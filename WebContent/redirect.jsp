<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<html>
<html>
<head>
<title>页面重定向</title>
</head>
<body>

<h1>页面重定向</h1>

<%
   	response.sendRedirect("http://127.0.0.1/data/index.php");
%>

</body>
</html>