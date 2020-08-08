<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="./../includes/header.jsp" %>
<%@include file="./../includes/menuBar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style>

body {
   font-family: Arial, Helvetica, sans-serif;
   color: #303030;
}

li {
   list-style: none;
}

.regi_menu a{
   text-decoration: none;
   color: #303030;
   font-size: 17px;
}

table {
   border-collapse: collapse;
   width: 100%;
}

/* 배치 */
th, td {
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

/* 글쓰기, 검색 버튼 시작 */
#regBtn,
#searchBtn {
  background-color: #ffc30b; 
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}


#regBtn:hover,
#searchBtn:hover {
  background-color: white; 
  color: #ffc30b; 
  border: 2px solid #ffc30b;
}
#regBtn:focus,
#searchBtn:focus { 
    outline: none; 
}


#regBtn {

margin-right: 0%;

}
/* 글쓰기, 검색 버튼 끝 */

/* 페이지 버튼 디자인 시작 */

.pageBtns {
	text-align: center;
}

.pageBtns a{
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
}

.pagination1 a:hover:not(.active) {
    background-color: #f6dd90;
    border-radius: 50%;
}

/* 페이지 버튼 디자인 끝 */

/* 모달디자인 시작  */
.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 16px;
  background-color: white;
  color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
  padding: 2px 16px;
  background-color: white;
  color: white;
}


#closeBtn {
  background-color: #ffc30b; 
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

#closeBtn:hover {
  background-color: white; 
  color: #ffc30b; 
  border: 2px solid #ffc30b;

}

#closeBtn:focus {
    outline: none; 

}
/* 모달 디자인 끝 */

/* 사이드 메뉴 */
.side{
     width: 200px;
     height: 500px;
     background-color: white;
     float: left;
     margin-right: 90px;
     border:solid #ffc30b ;
}

 .regi_side_tit{
      padding-top: 12px;
      padding-bottom:12px ;
      text-align: center;
      width: 100%;
      background-color: #ffc30b;
      font-size: 20px;
      font-weight: 900;
}

.regi_menu {
	margin-top:20px;
}

/* 사이드 메뉴 끝 */

.col-lg-12 {
	text-align: center;
    margin: 10px 0 30px 0;
}
        
.regi_main{
   float:  right;
   width: 1000px;
   height: 1000px;
   background-color: white;
} 

.regi_main .regi_tit{
   font-size: 30px;
   margin-bottom:50px;
   text-align: center;
}

.regi_content{
   width: 1300px;
   height: 1000px;
   margin:0 auto;
}
        
.regi_wrap{
   position: relative;
   display: inline-block;
   padding-top: 30px;
}

table img {
	height: 100px;
}

.imgTd {
	width: 215px;
}
</style>
</head>
<body>

<div class="regi_content">
 <div class="regi_wrap">


<!-- side 시작 -->
   <div class="side">
      <div class="1nb_list">
         <div class="regi_side_tit">마이페이지</div>
           <div class="regi_side_menu">
               <ul class="regi_menu">
                    <p><b>쇼핑 이용 정보</b></p>
                    <li><a href='/mypage/myPerchaseList'><i class="fa fa-check" ></i>주문내역</a></li>
                    <li><a href='/order/basketList'><i class="fa fa-check" ></i>장바구니</a></li>
                    <br>
                    <c:if test="${!empty sessionMember}">
                    <p><b>게시판 이용 내역</b></p>
                    <li> <a href='/mypage/myQna/list'><i class="fa fa-check" ></i>1:1문의</a></li>
                    <li><a href='/mypage/myReview'><i class="fa fa-check" ></i>나의 상품평</a></li>
                    <li><a href='/mypage/myPrdReply'><i class="fa fa-check" ></i>나의 상품 문의</a></li>
                    
                    
                    
                   		 <c:choose>
                           <c:when test="${sessionMember.memCode eq 'CUSTOMER'}">
                              <li><a href="/mypage/customerInfoModify"><i class="fa fa-check" ></i>개인 정보 수정</a></li>
                           </c:when>
                           <c:when test="${sessionMember.memCode eq 'SELLER'}">
                              <li><a href="/mypage/sellerInfoModify"><i class="fa fa-check" ></i>개인 정보 수정</a></li>
                           </c:when>
                           <c:when test="${sessionMember.memCode eq 'JUNIOR'}">
                              <li><a href="/mypage/sellerInfoModify"><i class="fa fa-check" ></i>개인 정보 수정</a></li>
                           </c:when>
                        </c:choose>
                        <c:choose>
  						<c:when test="${(sessionMember.memCode eq 'CUSTOMER'
                           				|| sessionMember.memCode eq 'JUNIOR'                           			
                           				|| sessionMember.memCode eq 'SELLER')                           			
                           				}">
                    <li><a href='/mypage/modifyPwd'><i class="fa fa-check" ></i>비밀번호 변경</a></li>
                    <li><a href='/mypage/memberDelete'><i class="fa fa-check" ></i>회원 탈퇴</a></li>
                    <br>
                    <p><b>단골 상점 </b></p>
                    <li> <a href='/mypage/myDangol'><i class="fa fa-check" ></i>상점 바로가기</a></li>
                        </c:when>
                        </c:choose>
                    </c:if>
                </ul>
           </div>
     </div>
     <!-- 1nb_list -->
  </div>
<!-- side 끝-->



<!-- regi_main 시작 -->      
<div class="regi_main">
      
      



      <div class="p2">
   <!-- regi_tit 시작 -->
    <div class="regi_tit">
       <p><b>나의 주문내역 </b></p>
   </div>
   <!-- regi_tit 끝 -->

         
         <table tit aria-setsize="500px">
            <!-- postingNo
            title
            replyBool
                 regdata -->
                 <!-- 페이징처리 -->
            <tbody id="myPerchaseTable">                 
            <c:forEach items="${myPerchaseList}" var="myPerchase">
               <tr>
                 <td colspan="5">
                 <label>주문일시:&nbsp;</label><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss"
                        value="${myPerchase.orderDate }" />	
				&emsp;
                 <label>주문번호:&nbsp;</label><c:out value="${myPerchase.orderCode}" /></td> 
               </tr>
               <tr>                         
               	 <td class="imgTd" rowspan="3"><img src="/resources/upload/<c:out value="${myPerchase.idNo}"/>/<c:out value="${myPerchase.itemImg1}"/>"></td>
                 <td><label>카테고리:&nbsp;</label><c:out value="${myPerchase.fullPath}" /></td>  
                 <td rowspan="3"><label>수량</label><br><br><br><c:out value="${myPerchase.itemNum}" /></td>
                 <td rowspan="3"><label>가격</label><br><br><br><c:out value="${myPerchase.totalPrice}" /></td>
                 <td rowspan="3"><label>주문상태</label><br><br><br><c:out value="${myPerchase.orderStat}" /></td>
               </tr>  
               <tr>
                 <td><label>상품명:&nbsp;</label><c:out value="${myPerchase.itemName}" /></td>    
               </tr>
               <tr>
                 <td><label>상점명:&nbsp;</label><c:out value="${myPerchase.shopName}" /></td>
               </tr>       
                 

          
            </c:forEach>
            </tbody>

         </table>
         
               
      <!-- Paging -->
         <div class='pageBtns'>
            <ul class="pagination1">
            
               <c:if test="${pageMaker.prev}">
               <li class="paginate_button1 pervious">
               <a href="${pageMaker.startPage -1}">Previous</a>
               </li>
               </c:if>
               
               <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
               <li class='paginate_button1 ${pageMaker.cri.pageNum == num? "active":""}'>
               <a class="paging" href="/mypage/myPerchase/page/${num}">${num}</a></li>
               </c:forEach>
               
               <c:if test="${pageMaker.next}">
               <li class="paginate_button1 next">
               <a href="${pageMaker.endPage +1}">Next</a>
               </li>
               </c:if>
            
            </ul>
         </div><!-- endPaging -->
      </div>
      <!-- p2-->
</div>
<!-- regi_main 끝 -->     

</div>

</div>
<script type="text/javascript">

$(document).ready(function(){
	
	var pageTags = $(".paging");
	var myPerchaseTable = $("#myPerchaseTable");
	
	pageTags.on().click(function(e){
		e.preventDefault();
		var pageNum = e.target.innerText;
		console.log(pageNum);
		getListByPage(pageNum)
		.then(function(response){
			console.log(response);
			drawMyPerchaseList(response);
		})
		.catch(function(error){
			console.log(error);
		});
		
	});
	
	
	/* 	ajax 방식으로 페이징 처리 */
	function getListByPage(pageNum) {
		return $.ajax({
			type: "GET",
			url: "/mypage/myPerchase/page/"+pageNum,
			contentType : "application/json; charset=UTF-8"
		});
	};
	
	/* 하드코딩으로 해결..테이블이 상대적으로 복잡 */
	function drawMyPerchaseList(myPerchaseList){
		myPerchaseTable.html("");
		var str = "";
		for(var i = 0; i<myPerchaseList.length; i++){
			var myPerchase = myPerchaseList[i];
			var orderDate = myPerchase.orderDate;
			var date = new Date(orderDate);
			str += '<tr><td colspan="5"><label>주문일시:&nbsp;</label>'+formatDate(date)+'&emsp;&nbsp;&nbsp;';
			str += '<label>주문번호:&nbsp;</label>'+myPerchase.orderCode+'</td></tr>';
			str += '<tr><td class="imgTd" rowspan="3"><img src="/resources/upload/'+myPerchase.idNo+'/'+myPerchase.itemImg1+'"></td>';
			str += '<td><label>카테고리:&nbsp;</label>'+myPerchase.fullPath+'</td>';
			str += '<td rowspan="3"><label>수량</label><br><br><br>'+myPerchase.itemNum+'</td>';
			str += '<td rowspan="3"><label>가격</label><br><br><br>'+myPerchase.totalPrice+'</td>';
			str += '<td rowspan="3"><label>주문상태</label><br><br><br>'+myPerchase.orderStat+'</td></tr>';
			str += '<tr><td><label>상품명:&nbsp;</label>'+myPerchase.itemName+'</td></tr>';
			str += '<tr><td><label>상점명:&nbsp;</label>'+myPerchase.shopName+'</td></tr>';
		}
		myPerchaseTable.html(str);
	}
	
	
	function formatDate(date) { 
		var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear(), hour = '' + d.getHours(), minute = '' + d.getMinutes(), second = '' + d.getSeconds(); 
		if (month.length < 2) month = '0' + month; 
		if (day.length < 2) day = '0' + day; 
		if (hour.length < 2) hour = '0' + hour; 
		if (minute.length < 2) minute = '0' + minute; 
		if (second.length < 2) second = '0' + second; 
		return [year, month, day].join('/') + " " + [hour, minute, second].join(':'); }
	
});
</script>
</body>
</html>
