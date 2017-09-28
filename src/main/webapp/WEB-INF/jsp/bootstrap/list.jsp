<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>list.jsp</title>
<c:if test="${false}">
	<link rel="stylesheet" href="../../css/bootstrap.css">
	<link rel="stylesheet" href="../../css/animate.css">
</c:if>
</head>
<body>
	<div class="panel-heading">
		<h1 class="animated fadeInRight">Bootstrap List Page</h1>
	</div>
	<div class="panel-body pull-right">
		<h3>
			<a href="/bootstrap/register">Register</a>
		</h3>
	</div>
	<div class="panel-body">
		<table class="table table-bordered">
			<tr>
				<th>BNO</th>
				<th>TITLE</th>
				<th>WRITER</th>
			</tr>
			<c:forEach var="bno" begin="100" end="110">
				<tr>
					<td>${bno}</td>
					<td><a href="${bno}">xxx ${bno}</a></td>
					<td>user01</td>
				</tr>
			</c:forEach>

		</table>
	<div>
		<select id="typeSelect">
			<option value="t">Title</option>
			<option value="c">Content</option>
			<option value="w">Writer</option>
		</select> 
		<input id="xxx" type="text">
		<button id="btnSearch">Search</button>
	</div>
	</div>
	<nav>
		<ul class="pagination">
			<li><a href="10">Prev 10</a></li>
			<li class=""><a href="11">11</a></li>
			<li class=""><a href="12">12</a></li>
			<li class=""><a href="13">13</a></li>
			<li class=""><a href="14">14</a></li>
			<li class="active"><a href="15">15</a></li>
			<li class=""><a href="16">16</a></li>
			<li class=""><a href="17">17</a></li>
			<li class=""><a href="18">18</a></li>
			<li class=""><a href="19">19</a></li>
			<li><a href="20">Next 20</a></li>
		</ul>
	</nav>
	
	<!-- -------------서버에 전송하기 위해 필요---------------------------- -->
	<form id="f1" action="/bootstrap/list" method="get">
		<input type="hidden" name="page" value="${pageVO.page}">
		<input type="hidden" name="size" value="${pageVO.size}">
		<input type="hidden" name="type" value="${pageVO.type}">
		<input type="hidden" name="keyword" value="${pageVO.keyword}"> 
	</form>
	<!-- ------------------------------------------------------------------ -->
	
	
	<script type="text/javascript">
	// f1을 찾아라. (id를 찾을때는 #을 붙인다.)
	var formObj = $("#f1");
	
	// pagination class(.) 이하의 a태그를 몽땅 다 찾아 list로 만들어	 (class를 찾을때는 .을 붙인다.)
	$(".pagination a").click(function(e) {
		
		// click할 때 수행
		e.preventDefault();					// default동작을 우선 막고, 
		var page = $(this).attr("href"); 	// href의 속성값을 읽어서 bno에 넣는다.
		alert("page = " + page);
		
		// f1안에서 name이 page인 것을 찾아서 value로 page를 넣어라.
		formObj.find("[name='page']").val(page);
		// 찾은 f1을 서버로 전송하라.
		formObj.submit();
	});
	
	
	$("#btnSearch").click(function(e) {
		var type = $('#typeSelect').find(":selected").val();
		var keyword = $('#xxx').val();
		
		alert("type = " + type + ", keyword = " + keyword);
		
		formObj.find("[name='type']").val(type);
		formObj.find("[name='keyword']").val(keyword);
		
		formObj.submit();
	});
	</script>
</body>
</html>