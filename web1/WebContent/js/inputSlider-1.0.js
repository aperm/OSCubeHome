// SLIDER SWITCH
	var sls_target;
	var sls_width;
	var sls_type;
	var sls_handle_target;
	var sls_handle_width;
	var sls_input;
	var sls_handle_dist;
	
	
	// setting up
	$("div.sls").each(function(){
		// "width" - "handle width"
		// because sls-limit means there must be two handles
		// and each of their movement field is that width because one whitch can't overlap other
		// that's why defining movement field explicitically
		var width = $(this).width() - $(this).children(".sls-handle").width();
		
		$(this).prepend("<div style='width:"+width+"px' class='sls-knob-stack'></div>");
		
		if($(this).attr("data-start") && $(this).attr("data-end") && !$(this).hasClass("sls-limit") && !$(this).hasClass("sls-knob-disabled")){
			var start = parseInt($(this).attr("data-start"));
			var end = parseInt($(this).attr("data-end"));
			var diff = Math.abs(start - end);
			for(var i=0; i<diff; i++){
				$(this).children(".sls-knob-stack").append("<span class='sls-knob'></span>");
			}
		}
		if($(this).attr("data-start") && $(this).attr("data-end")){
			$(this).children(".sls-handle").html($(this).attr("data-start"));
		}
		if($(this).hasClass("sls-limit")){
			// getting end value from attribute
			var end = parseInt($(this).attr("data-end"));
			// positioning the second button on the far right
			var second_handle_left = $(this).width() - $(this).find(".sls-handle").outerWidth();
			// adding button
			$(this).append("<div style='left:"+second_handle_left+"px;' class='sls-handle'>"+end+"</div>");
		}
	});
	
	$("div.sls > .sls-handle").on("mousedown touchstart", function(e){
		// on mousedown or touch it'll get and store all info about the slider into the global variables
		// that are in the beginning
		
		// next two line prevent selection on drag
		e.preventDefault();
		e.cancelBubble=true;
		// when the user press button the slider's data-drag attr will change to 1
		// that means it can be moved/dragged now (verified on mousemove)
		// if the user moves button up then it changes back to 0 (it's done later)
		$(this).parent().attr("data-drag","1");
		// next 3 lines sets gloal variable
		sls_target = $(this).parent();
		sls_handle_width = sls_target.find(".sls-handle").outerWidth();
		sls_width = sls_target.width();
		sls_input = sls_target.siblings("input");
		
		// it registers which handle is going to move, and it's used in mousemove
		// as an example, if the user press on the first handle then only first one gonna move
		sls_handle_target = $(this).index();
		sls_handle_dist = Math.abs(e.pageX - $(this).offset().left);
		
		
		// if user wants two handles then specify it in global variables
		if($(this).parent().hasClass("sls-limit")){
			sls_type = "limit";
		}else{
			sls_type = "single";
		}
	});
	
	
	// as said before when user unclick it'll be non-movable
	$(document).on("mouseup touchend", function(){
		sls_target.attr("data-drag","0");
		var data = sls_target.find(".sls-handle").eq(0).text();
		if(sls_target.find(".sls-handle").eq(1).length > 0){
			data += "-"+sls_target.find(".sls-handle").eq(1).text();
		}
		sls_input.val(data);
	});
	
	
	// now the real part...
	$(document).on("mousemove touchmove", function(e){
		// if data-drag=1 then handles will move
		if(sls_target && sls_target.attr("data-drag") == 1){
			
			// getting event type, touch or mouse
			if(e.type == "touchmove"){
				var event = e.originalEvent.touches[0] || e.originalEvent.changedTouches[0];
			}else if(e.type == "mousemove"){
				var event = e;
			}
			
			// getting the active handle that
			// because of starting number i had to substarct 1 from original index number
			var handle = sls_target.find(".sls-handle").eq(sls_handle_target - 1);
			
			// if the active one is the first and has two switches (limit)
			if(sls_handle_target == 1 && sls_type == "limit"){
				// getting position of mouse
				var posX = event.pageX - sls_target.offset().left;
				
				// left position of the left handle
				var handle_left_pos = posX - sls_handle_dist;
				
				// if position is greated than 0 and less than (total width - handle width)
				// then move according to mouse position
				if(handle_left_pos >= 0 && handle_left_pos <= (sls_width - sls_handle_width*2)){
					// moving
					handle.css({
						"left": handle_left_pos + "px"
					});
					// if the first handle collides with the second then drag it with the first one
					// untill it stops
					// 	"posX + sls_handle_width" : because posX is the left position of first whitch
					//	that's why added it's width so the second one will drag like is would in real life
					
					// if end point of the first handle is biggert than start point of second handle
					if(handle_left_pos + sls_handle_width > parseInt(handle.next().css("left"))){
						handle.next().css({
							"left": handle_left_pos + sls_handle_width + "px"
						}).addClass("merge-left");
						handle.addClass("merge-right");
						// calculation position & printing it on the handle
						// while dragging with the first handle, second handle also need to change value as it drags
						var start = parseInt(sls_target.attr("data-start"));
						var end = parseInt(sls_target.attr("data-end"));
						var length_value = (Math.round(parseInt(handle.next().css("left")) - sls_handle_width)/(sls_width - sls_handle_width*2) * 100);
						var value = start + Math.round( length_value/(100/(end - start)));
						handle.next().html(value);
					}else{
						handle.removeClass("merge-right");
						handle.next().removeClass("merge-left");
					}
				// if reaches right end limit then set it to the right
				}else if(handle_left_pos > (sls_width - sls_handle_width*2)){
					handle.css({
						"left": sls_width - sls_handle_width*2 + "px"
					}).addClass("merge-right");
					// if first handle reaches end end then
					// secont handle's left = end of width = bar width - handle width
					// because of perfection
					handle.next().css({
						"left": sls_width - sls_handle_width + "px"
					}).addClass("merge-left");
					// calculation position & printing it on the handle
					// again calculation if first handle reaches end..
					// otherwise adjustment of the second handle will be imperfect at the end
					var start = parseInt(sls_target.attr("data-start"));
					var end = parseInt(sls_target.attr("data-end"));
					var length_value = (Math.round(parseInt(handle.next().css("left")) - sls_handle_width)/(sls_width - sls_handle_width*2) * 100);
					var value = start + Math.round( length_value/(100/(end - start)));
					handle.next().html(value);
				// if reaches left end limit then set it to the left
				}else if(handle_left_pos <= 0){
					handle.css({
						"left": 0 + "px"
					});
				}
				
				// calculation position & printing it on the handle
				// (this same calculation is done in the previous two state)
				if(sls_target.attr("data-start") && sls_target.attr("data-end")){
					var start = parseInt(sls_target.attr("data-start"));
					var end = parseInt(sls_target.attr("data-end"));
					var length_value = Math.round(parseInt(handle.css("left"))/(sls_width - sls_handle_width*2) * 100);
					var value = start + Math.round( length_value/(100/(end - start)));
					handle.html(value);
				}
			// just like the first one second condition is 90% same
			// in this case if the second handle is active
			}else if(sls_handle_target == 2 && sls_type == "limit"){
				var posX = event.pageX - sls_target.offset().left;
				
				// left position of the left handle
				var handle_left_pos = posX - sls_handle_dist;
				
				if(handle_left_pos > sls_handle_width && handle_left_pos < (sls_width - sls_handle_width)){
					handle.css({
						"left": handle_left_pos + "px"
					});
					//
					// now, unlike the first condition, the second handle must stop before (0px + handle width)
					// from the left, because first handle is there
					//
					
					// again if second handle collides with first
					// then drag it with the second one
					if(handle_left_pos <= parseInt(handle.prev().css("left")) + sls_handle_width){
						handle.prev().css({
							"left": handle_left_pos - sls_handle_width + "px"
						}).addClass("merge-right");
						handle.addClass("merge-left");
						// calculating..
						var start = parseInt(sls_target.attr("data-start"));
						var end = parseInt(sls_target.attr("data-end"));
						var length_value = Math.round(parseInt(handle.prev().css("left"))/(sls_width - sls_handle_width*2) * 100);
						var value = start + Math.round( length_value/(100/(end - start)));
						handle.prev().html(value);
					}else{
						handle.removeClass("merge-left");
						handle.prev().removeClass("merge-right");
					}
				// if reaches right end limit then set it to the right
				}else if((handle_left_pos + sls_handle_width) > sls_width){
					handle.css({
						"left": sls_width - sls_handle_width + "px"
					});
				// if reaches left end limit then set it to the left
				}else if(handle_left_pos < sls_handle_width){
					handle.css({
						"left": sls_handle_width + "px"
					}).addClass("merge-left");
					// if second hanndle reaches end then
					// first handle's left = 0
					// because of perfection
					handle.prev().css({
						"left": 0 + "px"
					}).addClass("merge-right");
					// calculating...
					var start = parseInt(sls_target.attr("data-start"));
					var end = parseInt(sls_target.attr("data-end"));
					var length_value = Math.round(parseInt(handle.prev().css("left"))/(sls_width - sls_handle_width*2) * 100);
					var value = start + Math.round( length_value/(100/(end - start)));
					handle.prev().html(value);
				}
				
				if(sls_target.attr("data-start") && sls_target.attr("data-end")){
					var start = parseInt(sls_target.attr("data-start"));
					var end = parseInt(sls_target.attr("data-end"));
					var length_value = (Math.round(parseInt(handle.css("left")) - sls_handle_width)/(sls_width - sls_handle_width*2) * 100);
					var value = start + Math.round( length_value/(100/(end - start)));
					handle.html(value);
				}
			// else if user don't need two handles
			}else if(sls_handle_target == 1 && sls_type != "limit"){
				var posX = event.pageX - sls_target.offset().left;
				
				// left position of the left handle
				var handle_left_pos = posX - sls_handle_dist;
				
				if(handle_left_pos > 0 && handle_left_pos < (sls_width - sls_handle_width)){
					handle.css({
						"left": handle_left_pos + "px"
					});
				}else if(handle_left_pos > (sls_width - sls_handle_width)){
					handle.css({
						"left": sls_width - sls_handle_width + "px"
					});
				}else if(handle_left_pos < 0){
					handle.css({
						"left": 0 + "px"
					});
				}
				
				if(sls_target.attr("data-start") && sls_target.attr("data-end")){
					var start = parseInt(sls_target.attr("data-start"));
					var end = parseInt(sls_target.attr("data-end"));
					
					var length_value = Math.round(parseInt(handle.css("left"))/(sls_width - sls_handle_width) * 100);
					var value = start + Math.round( length_value/(100/(end - start)));
					
					handle.html(value);
				}
			}
			
		}
	});
