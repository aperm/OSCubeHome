<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">
</script>
<script>
$(document).ready(function(){
  $("#hide").click(function(){
    $('.action1').wrap('<span></span>').hide();
  });
  $("#show").click(function(){
     $('.action1').unwrap('<span></span>').show();
  });
});
</script>
</head>
<body>
<select id="customerIds" onchange="doOperation()">
          <option value="default"> Start..</option>              
          <option value="1" class="action1"> 1</option>
          <option value="2" class="action1"> 2</option>
          <option value="3" class="action1"> 3 </option>
          <option value="4" class="action2"> 4 </option>
          <option value="5" class="action3"> 5 </option>
    </select>​
<button id="hide">Hide</button>
<button id="show">Show</button>
</body>
</html>