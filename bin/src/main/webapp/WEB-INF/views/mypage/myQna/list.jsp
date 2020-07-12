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

<style>
<!
DOCTYPE html> <html lang ="en"> <head> <meta charset ="UTF-8"> <meta name
	="viewport" content ="width=device-width, initial-scale =1.0 "> <title>공지사항
	</title> <!DOCTYPE html> <html> <head> <style>table {
	border-collapse: collapse;
	width: 90%;
}

<!--
배치-->th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: black;
	color: white;
	text-align: left;
}

tr:hover {
	background-color: #f5f5f5;
}

.check {
	width: 5%;
	height: 30px;
	left: 30%;
}

.text {
	width: 50%;
	height: 25px;
}

.serch {
	margin-left: 200px;
	margin-bottom: 10px;
}

.sb {
	height: 35px;
}

<!--
화면 나눔-->.pmain {
	width: 100%;
	height: 300px;
}

.p1 {
	width: 15%;
	float: left;
}

.p2 {
	width: 85%;
	float: right;
}

<!--
글쓰기 버튼-->.regBtn {
	margin-top: 10px;
	margin-left: 90%;
}
</style>
</head>
<body>


	 <div class="pmain">
		<div class="p1">
			<ul>마이페이지
			
			<li><a>공지사항</a></li>
			<li><a>자주하는질문</a></li>
			</ul>
		</div>

		<div class="p2">


			<p>1:1 문의</p>
					<!-- 검색창 form-->
           <div class='row'>
      <div class="col-lg-12">
      
      <form id='searchForm' action="/mypage/myQna/list" method='get'>
      <select name='type'>
      <option value=""
      <c:out value="${pageMaker.cri.type ==null?'selected':''}"/>>--</option>
      <option value="T"
      <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
      <option value="C"
      <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
      <option value="I"
      <c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>아이다</option>
      <option value="TC"
      <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
      <option value="TI"
      <c:out value="${pageMaker.cri.type eq 'TI'?'selected':''}"/>>제목 or 아이디</option>
      <option value="TCI"
      <c:out value="${pageMaker.cri.type eq 'TIC'?'selected':''}"/>>제목 or 내용 or 아이디</option>
      
      </select>
      
      <input  type='text' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
      <input name ='pageNum' value='${pageMaker.cri.pageNum}'>
      <input name ='amount' value='${pageMaker.cri.amount}'>
       <button class ='btn btn-default'>검색</button>
      
      </form>
      </div>
      </div><!-- 검색창마지막 -->
			
			<table tit aria-setsize="500px">
				<thead>
					<tr>
						<th>번호</th> 	
						<th>제목</th>   

						<th>답변여부</th> 
						<th>등록일</th>  
					</tr>
				</thead>
				<!-- postingNo
				title
				replyBool
                 regdata -->
                 <!-- 페이징처리 -->
                 
				<c:forEach items="${qna}" var="myQna">
					<tr>
						<td><c:out value="${myQna.postingNo }" /></td>

                        <td><a class ='move' href='<c:out value="${myQna.postingNo}"/>'>
						<c:out value="${myQna.title }" /></a></td>
		

						<td><c:out value="${myQna.replyBool }" /></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd"
								value="${myQna.regDate }" /></td>
							

					</tr>

				</c:forEach>

			</table>
			
					<!-- Paging -->
		
			<div class='pull-right'>
			<ul class="pagination">
			
			<c:if test="${pageMaker.prev}">
			<li class="paginate_button pervious">
			<a href="${pageMaker.startPage -1}">Pervious</a>
			</li>
			</c:if>
			
			<c:forEach var="num" begin="${pageMaker.startPage}"
			end="${pageMaker.endPage}">
			<li class='paginate_button ${pageMaker.cri.pageNum == num? "active":""}'>
			<a href="${num}">${num}</a></li>
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
			<a href="${pageMaker.endPage +1}">Next</a>
			</li>
			</c:if>
			
			</ul>
			</div><!-- endPaging -->
			
			<!-- paging form end-->
			<form id='actionForm' action="/mypage/myQna/list" method='get'>
				<input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
			    <input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
                <input  type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
			</form><!-- paging form end-->

			<button id='regBtn' type="button" class="btn btn-xs pull-right">글쓰기</button>

		</div>
		<!-- p2-->

		<script type="text/javascript">
		  var actionForm = $("#actionForm");
	
		
		$(document).ready(
					function() {

						var result = '<c:out value="${result}"/>';

						checkModal(result);

						function checkModal(result) {

							if (result === '') {
								return;
							}

							if (parseInt(result) > 0) {

								alert(result);
								$(".modal-body").html(
										"게시글" + parseInt(result)
												+ "번이 등록되었습니다.");

							}
							$("#myModal").modal("show");

						}

						$("#regBtn").on("click", function() {

							self.location = "/mypage/myQna/register"
						});
						
					});
			
		              
	         $(".paginate_button a").on("click", function(e){
	        	
	        
	         	e.preventDefault();
	         	
	         	console.log('click');
	         
	         	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	         	actionForm.submit();
	         });
	         
	         $(".move").on("click",function(e){
	        	   

	          	e.preventDefault();
	          	actionForm.append("<input type='hidden' name='postingNo' value = '" + $(this).attr("href") + "'>");
	             actionForm.attr("action", "/mypage/myQna/get");
	          	actionForm.submit();
	          	
	          });
	         
	         <!--검색 스크립트 start-->
	         var searchForm =$("#searchForm");
	         
	         $("#searchForm button").on("click" , function(e){
	            	
	        	 if(!searchForm.find("option:selected").val()){
	        		 alert("검색종류를 선택하세요");
	        		 return false;
	        		 
	        	 }
	        	 if(!searchForm.find("input[name='keyword']").val()){
	        		 alert("검색어 입력하세요");
	        		 return false;
	        		 
	        	 }
	        	 
	        	 searchForm.find("input[name='pageNum']").val("1");
	        	 e.preventDefault();
	        	 
	        	 searchForm.submit();
	        	 
	        	 
	             });
	         
	         <!--검색 스크립트 end-->
		</script>

	</div>
	<!-- main-->





</body>

</html>