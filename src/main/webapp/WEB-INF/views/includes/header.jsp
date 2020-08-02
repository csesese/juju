<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
#head {
   min-width: 1000px;
   border: 1px;
   height: 200px;
}
li {
   /* 앞에 점 없앰 */
   list-style: none;
   color: black;
}
.head_logo {
   /* 가운데 정렬 */
   display: flex;
   justify-content: center;
   padding-bottom: 20px;
}
.head_util {
   font-size: 15px;
   margin-top: 15px;
}
.util_wrap ul {
   list-style-type: none;
   margin: 0;
   padding: 0;
   overflow: hidden;
   /* background-color: #333; */
   display: flex;
   justify-content: flex-end;
   padding-right: 60px;
}
.util_wrap ul li {
   float: left;
}
.util_wrap li a, .subMemu {
   display: inline-block;
   color: black;
   text-align: center;
   padding: 14px 16px;
   text-decoration: none;
}
.util_wrap li a:hover, .dropdown_sub:hover .subMemu {
   color: #ffc30b;
}
.util_wrap li.dropdown_sub {
   display: inline-block;
}
.dropdown_sub .subMemu-content {
   display: none;
   position: absolute;
   background-color: #f6dd90;
   border-radius: 30px;
   min-width: 130px;
   width: 150px;
   box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
   z-index: 99;
   font-size: 15px;
}
.dropdown_sub .subMemu-content a {
   color: black;
   padding: 12px 16px;
   text-decoration: none;
   display: block;
   text-align: left;
}
.subMemu-content a:hover {
   background-color: white;
   border-radius: 10px;
}
.dropdown_sub:hover .subMemu-content {
   display: block;
}
</style>
</head>
<body>
   <header id="head">
      <div class="head_wrap">
         <div class="head_util">
            <div class="util_wrap">
               <ul>
                  <c:if test="${empty sessionMember}">
                     <li><a href="/member/login">로그인</a></li>
                     <li><a href="/member/chooseMemberType">회원가입</a></li>
                  </c:if>
                 <c:if test="${!empty sessionMember}">
                     <!-- <li><a href="/member/logout">로그아웃</a></li> -->
                     <li><a>${sessionMember.memName} 님 안녕하세요!</a></li>
	                 <c:choose>
		                <c:when test="${sessionMember.memCode eq 'KAKAO'}">
		                	<li><a href="https://kauth.kakao.com/oauth/logout?client_id=01b574850137dfee5c295348e0be136f&logout_redirect_uri=http://localhost/member/kakaoLogout">로그아웃</a></li>
		                </c:when>
		                <c:when test="${sessionMember.memCode eq 'NAVER'}">
		                	<li><a href="/member/naverLogout">로그아웃</a></li>
		                </c:when>
		                <c:otherwise>
		                	<li><a href="/member/logout">로그아웃</a></li>
		             	</c:otherwise>
					 </c:choose>
                  </c:if>


                  <li class="dropdown_sub"><a href="/mypage/myQna/list" class="subMemu">마이페이지</a>
<%--                      <div class="subMemu-content">

                        <a href="#">쇼핑 이용 정보</a> <a href="#">게시판 이용내역</a>
                        <c:choose>
                           <c:when test="${sessionMember.memCode eq 'CUSTOMER'}">
                              <a href="/mypage/customerInfoModify">개인 정보 수정</a>
                           </c:when>
                           <c:when test="${sessionMember.memCode eq 'SELLER'}">
                              <a href="/mypage/sellerInfoModify">개인 정보 수정</a>
                           </c:when>
                        </c:choose>
                        </div> --%>
                     </li>
                     <li class="dropdown_sub"><a href="#" class="subMemu">고객센터</a>
                        <div class="subMemu-content">
                           <a href="/community/notice/list">공지사항</a> 
                           <a href="/community/BoardFAQ/list">자주하는 질문</a> 
<!--                            <a href="/mypage/myQna/list">1:1 문의 게시판</a> -->
                        </div>
                     </li>
                     <c:choose>
<%--                         <c:when test="${fn:substring(sessionMember, 0, 1) eq 's'}"> --%>
                           <c:when test="${sessionMember.memCode eq 'SELLER'}">
                           <li><a href="/shop/">상인 홈</a></li>
                        </c:when>
<%--                         <c:when test="${fn:substring(sessionMember, 0, 1) eq 'a'}"> --%>
                           <c:when test="${sessionMember.memCode eq 'ADMIN'}">
                           <li><a href="/admin/index">관리자 홈</a></li>
                        </c:when>
                     </c:choose>
               </ul>
            </div>
         </div>

         <div class="head_logo">
            <div class="logo">
               <a href="/"><img src="/resources/images/juju_logo.png"
                  alt="JuJu_Market_Logo" style="height: 150px;"></a>
            </div>
         </div>
      </div>

   </header>
</body>
</html>