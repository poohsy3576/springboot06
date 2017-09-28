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
	<!-- 웹브라우저까지 안날아가고 코딩시에만 사용하도록 -->
	<link rel="stylesheet" href="../../css/bootstrap.css">
	<link rel="stylesheet" href="../../css/animate.css">
</c:if>
</head>
<body>
	<div class="panel-heading">List Page</div>

	<div class="panel-body pull-right">
	<h3><a class="label label-default " href="/board/register">Register</a></h3>
	</div>
	<div class="panel-body">
		<c:set var="result" value="${pageMaker.result}"/>
		<div>
			<table class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>BNO</th>
						<th>TITLE</th>
						<th>WRITER</th>
						<th>REGDATE</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${result.content}">
						<tr class="odd gradeX">
							<td>${board.bno}</td>
							<td><a href='${board.bno}' class='boardLink'>${board.title}</a></td>
							<td>${board.writer}</td>
							<td class="center">
							 <fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div>
				<select id='searchType'>
					<option>--</option>
					<option value='t' ${pageVO.type =='t' ? 'selected' : ''} >Title</option>
					<option value='c' ${pageVO.type =='c' ? 'selected' : ''}>Content</option>
					<option value='w' ${pageVO.type =='w' ? 'selected' : ''}>Writer</option>
				</select>
			  <input type='text' id='searchKeyword' value="${pageVO.keyword}">
			  <button id='searchBtn'>Search</button> 
			</div>

		</div>

		<nav>

			<div>

				<ul class="pagination">
					<c:if test="${pageMaker.prevPage != null}">
						<li class="page-item">
							<a href="${pageMaker.prevPage.pageNumber + 1}">
								PREV ${pageMaker.prevPage.pageNumber + 1}
							</a>
						</li>
					</c:if>

					<c:forEach var="p" items="${pageMaker.pageList}">
						<li class="page-item ${p.pageNumber == pageMaker.currentPageNum - 1? 'active' : ''} ">
							<a href="${p.pageNumber +1}">${p.pageNumber +1}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.nextPage != null}">
						<li class="page-item">
							<a href="${pageMaker.nextPage.pageNumber + 1}">
							NEXT ${pageMaker.nextPage.pageNumber + 1}
							</a>
						</li>
					</c:if>
				</ul>
			</div>
		</nav>


	</div>
	
		<form id='f1' action="/board/list" method="get">
		<input type='hidden' name='page' value="${pageMaker.currentPageNum}">
		<input type='hidden' name='size' value="${pageMaker.currentPage.pageSize}">
		<input type='hidden' name='type' value="${pageVO.type}">
		<input type='hidden' name='keyword' value="${pageVO.keyword}">
	</form>

	<script type="text/javascript">
	
		$(window).load(function(){
			
			var msg = "${msg}";
			
			
			if(msg =='success') {
				alert("정상적으로 처리되었습니다.");
				var stateObj = { msg: "" };
			}

		});
	
		$(document).ready(function() {
			var formObj = $("#f1");

			$(".pagination a").click(function(e) {

				e.preventDefault();

				formObj.find('[name="page"]').val($(this).attr('href'));

				formObj.submit();
			});
			
			$(".boardLink").click(function(e){
				
				e.preventDefault(); 
				
				var boardNo = $(this).attr("href");
				
				formObj.attr("action","/board/view");
				formObj.append("<input type='hidden' name='bno' value='" + boardNo +"'>" );
				
				formObj.submit();
				
			});
			
			$("#searchBtn").click(function(e){
				
				var typeStr = $("#searchType").find(":selected").val();
				var keywordStr = $("#searchKeyword").val();
				
				console.log(typeStr, "" , keywordStr);
				
				formObj.find("[name='type']").val(typeStr);
				formObj.find("[name='keyword']").val(keywordStr);
				formObj.find("[name='page']").val("1");
				formObj.submit();
			});

		});
	</script>

</body>
</html>