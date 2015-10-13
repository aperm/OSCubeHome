<%@ page language="java" contentType="text/xml; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>


<%

 String s = request.getParameter("stnId");
System.out.println(s);
%>

<c:import charEncoding="utf-8" url="http://www.kma.go.kr/weather/forecast/mid-term-xml.jsp">
</c:import>





