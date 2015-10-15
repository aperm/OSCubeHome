<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, java.text.*"%>
<%
	System.out.println();
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	String today = formatter.format(new java.util.Date());
	System.out.println(today);
	System.out.println("Remote Addr: " + request.getRemoteAddr());
	System.out.println("Remote Host: " + request.getRemoteHost());
	System.out.println("X-Forwarded-For: " + request.getHeader("x-forwarded-for"));
%>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon"
	href="images/favicon/favicon.ico" />

<link rel="stylesheet" href="/css/bootstrap-theme.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<script src="/js/bootstrap.js"></script>

<meta name="viewport" content="width=device-width" />
<!--�����������ũ��������Ÿ�±�-->

<title>OSCube</title>
</head>
<link href='https://fonts.googleapis.com/css?family=Gruppo' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<body>
<!-- Start ���� Header -->
<header>
    <nav class="navbar navbar-default navbar-fixed-top"
        role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Cornerstone</a>
        </div>
    </nav>
</header>
<!-- //End ���� Header -->

<!-- Start Pages -->
<div id="pages" class="container">
    <section id="list"></section>
    <section id="add"></section>
    <section id="detail"></section>
</div>
<!-- //End Pages -->

<!-- Start ���� Footer -->
<footer>
    <div
        class="navbar-mobile btn-group
                    btn-group-justified navbar-fixed-bottom">
        <a href="#list"
            class="btn btn-default" data-transition="slide">
            <span class="glyphicon glyphicon-info-sign"></span>
            <span class="text">���</span>
        </a>
        <a href="#detail"
            class="btn btn-default" data-transition="slide"
            data-duration="1500">
            <span class="glyphicon glyphicon-star"></span>
            <span class="text">��</span>
        </a>
        <a href="#add"
            class="btn btn-default" data-transition="slide">
            <span class="glyphicon glyphicon-download-alt"></span>
            <span class="text">���</span>
    </a>
    </div>
</footer>
<!-- //End ���� Footer -->
</body>
</html>