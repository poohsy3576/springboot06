<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sitemesh" tagdir="/WEB-INF/tags/sitemesh"%>	<!-- custom tag -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><sitemesh:write property="title"/></title>	<!-- 특별한 기능은 없음. warning때문에 추가한 것 -->
<link rel="stylesheet" href="/webjars/bootstrap/3.3.7/css/bootstrap.css">
<link rel="stylesheet" href="/webjars/bootstrap/3.3.7/css/bootstrap-theme.css">
<link rel="stylesheet" href="/webjars/animate.css/3.5.2/animate.css">

<script type="text/javascript" src="/webjars/jquery/1.11.1/jquery.js"></script>
<script type="text/javascript" src="/webjars/bootstrap/3.3.7/js/bootstrap.js"></script>

<script type="text/javascript" src="/webjars/chartjs/2.6.0/Chart.bundle.js"></script>
<sitemesh:write property="head"/>
</head>
<body>
<h1>Decorator grid.jsp START</h1>
<hr>
<sitemesh:write property="body"/>
<hr>
<h1>Decorator grid.jsp END</h1>




</body>
</html>