<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">수정하기</h1>
		</div>
	</div>
	<!--  col-lg-12 end -->


	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">수정하기</div>
				<div class="panel-body">

                   <form role="form" action="/community/Board_FAQ/modify" method="post">
					<!-- 조회페이지에서 수정/삭제 페이지로 이동 -->
					<input  name ='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                    <input name='amount' value='<c:out value="${cri.amount}"/>'>
                    <input name='type' value='<c:out value="${cri.type}"/>'>
                    <input name='keyword' value='<c:out value="${cri.keyword}"/>'>

					<div class="from-group">
						<label>Title</label><input class="form-control" name='title'
							value='<c:out value="${Board_FAQ.title}"/>'>
					</div>

					<div class="from-group">
						<label>내용</label>
						<textarea class="form-control" rows="10" name='content'
					 ><c:out value="${Board_FAQ.content}"/></textarea>
					</div>


					<div class="from-group">
						<label>게시글타입</label><input class="form-control" name='boardType'
							value='<c:out value="${Board_FAQ.boardType}"/>'readonly="readonly">
					</div>
					
					<div class="from-group">
						<label>작성자</label><input class="form-control" name='idNo'
							value='<c:out value="${Board_FAQ.idNo}"/>'readonly="readonly">
					</div>
					
					<div class="from-group">
						<label>글번호</label><input class="form-control" name='postingNo'
							value='<c:out value="${Board_FAQ.postingNo}"/>'readonly="readonly">
					</div>

					
					<button type="submit" data-oper='modify' class="btn btn-default">수정완료</button>
					<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
					<button type="submit" data-oper='list' class="btn btn-info">리스트</button>
					</form>
					
					
				</div>
			</div>
		</div>
	</div>
	<!-- row end -->
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		var formObj = $("form");
		
		$('button').on("click", function(e){
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
	

		 if(operation === 'remove'){
			 
			 formObj.attr("action","/community/Board_FAQ/remove");
			 
		 }else if(operation ==='list'){
		 
		
				formObj.attr("action", "/community/Board_FAQ/list").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				 
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);			
				formObj.append(keywordTag);
				formObj.append(typeTag);			

		 }
			 formObj.submit();
	
		
	});
	});
	
	</script>

</body>
</html>