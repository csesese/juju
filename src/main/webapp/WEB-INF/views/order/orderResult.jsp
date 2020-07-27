<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문완료</title>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>


   #containerOFAll {
      width:1300px;
      height:100%;
      margin: 0 auto;
      color: #303030;
   }



   
        ul {
            list-style:none;
            font-weight: bold;
            color: lightgray;
        }


        #orderProcess {
            
            position: relative;
            width: 1300px;
            height: 100px;
            
        }

        #ordProcess {

            position:absolute;
            bottom:0px;
            right:0px;

        }


        #currentProcess {
            color: #303030;
        }
        
        
      #completeMsg {
         color: #303030;
         font-weight: bold;
         margin: 15px;
      }
      
      #subMsg {
         color: grey;
         font-weight: bold;
         margin: 15px;
      }
      
      
      .subTitle {
      
         font-size: 10px;
         
      }
      
      #completeContent {
         margin: auto;
         
      }
      
      .contentDiv {
         
         margin: 50px;
      
      }
      
      
      .button1,
      .button2,
      .button3,
      .button4 {
       background-color: #ffc30b; 
        border: none;
        color: white;
        padding: 16px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        transition-duration: 0.4s;
        cursor: pointer;
      
      }
      
      .button1:hover,
      .button2:hover,
      .button3:hover,
      .button4:hover {
        background-color: white; 
        color: #ffc30b; 
        border: 2px solid #ffc30b;
      }
      
      .button1:focus,
      .button2:focus,
      .button3:focus,
      .button4:focus {
        outline: none; 
      }
      
      
      
      
      /* 
      .btn-primary {
         color: white;
         background-color: #ffc30b;
         border-color: #ffc30b;
         
         
      }
       */
      
      
      
      
      
      
      /* button:active{
         background-color: pink; 
         color:#ffc30b;
      }
      
      button:visited{
         background-color: white; 
         color:#ffc30b;
      }
       */
      
      .btns {
       width: 60%;
       margin: auto;
      
      }
      
      table {
      
      width: 100%;
      /* border-right: none;
      border-left: none; */
      
      }
      
      
      th {
      
      height: 40px;
      background-color: rgb(238,238,238);
      text-align: right !important;
      padding-right: 10px !important;
      
      /* border: solid 2px;
      border-color: lightgrey; */
      }
      
      td, th {
      border: solid 2px;
      border-color: lightgrey;
      padding-left: 10px !important;
      
      /* border-left: 0;
      border-right: 0; */
      } 
      
      
      
       


</style>

</head>
<body>


<jsp:include page="../includes/header.jsp" flush="false"/>
<jsp:include page="../includes/menuBar.jsp" flush="false"/>


   <div id="containerOFAll">




    <div id="orderProcess">
            <!-- 01 장바구니 > 02 주문서 작성/결제 > 03 주문완료 -->
            <div id="ordProcess">
                <ul>
                    <li style="color: lightgrey; float:left;">01 장바구니</li> 
                    <li style="color: lightgrey; float:left;">  >  </li>
                    <li style="color: lightgrey; float:left;">02 주문서 작성/결제</li> 
                    <li style="color: lightgrey; float:left;">  >  </li>
                    <li style="float:left;"  id = "currentProcess">03 주문완료</li>
                </ul>
            </div>
        </div>
    


        <!-- 라인 -->
        <hr style="border:solid 1px lightgrey;">



   <div id="completeMsg">
   <h1><strong>주문이 완료되었습니다. 이용해주셔서 감사합니다.</strong></h1>
   </div>

   <div id="subMsg">
   <h4>주문 내역은  [마이페이지 > 주문내역/배송조회] 에서 다시 확인할 수 있습니다.</h4>
   </div>

   
   
   <div id="completeContent">
   
   
   
   
   
   <div class="contentDiv">
   <div class="subTitle">
   <h4><strong>| 주문번호: </strong> ${order.orderCode}</h4>
   </div>

   <form action="orderResult" method="post">
      <!--    <form name="form_order"> -->
      <table class="list_view">
         <tbody align=center>
            <tr>
            <tr align=center class="fixed">

               <!-- itemImg1 from t_item -->
               <td class="fixed">아이템Img</td>
               <!-- itemName from t_item -->
               <td class="fixed">주문상품명</td>
               <!-- normPrice from t_item -->
               <td class="fixed">상품금액</td>
               <!-- itemNum from t_basket -->
               <td class="fixed">수량</td>
               <!-- disAmount from t_order_info -->
               <td class="fixed">할인금액</td>
               <!-- price from t_item -->
               <td class="fixed">주문금액</td>
            </tr>

            <!-- 리스트니까 여러 목록이어서 c:forEach로 c:out을 감싸주었음  -->
            <!-- OrderController의 list -> jsp에서 DB 호출시 ${list} -->
            <!-- totalPrice를 구하기 위해 c:set 사용하여 forEach로 반복문 돌려주었음  -->

            <c:forEach var="item" items="${itemList}">
               <tr cellpadding="40" align=center>
                  <td><c:out value="${item.itemImg1}"></c:out></td>
                  <td><c:out value="${item.itemName}"></c:out></td>
                  <td><c:out value="${item.normPrice}"></c:out></td>
                  <td><c:out value="${item.itemNum}"></c:out></td>
                  <td><c:out value="${item.normPrice - item.price}"></c:out></td>
                  <td><c:out value="${item.totalPrice}"></c:out></td>
               </tr>
            </c:forEach>

         </tbody>
      </table>
   </form>
   
   
   </div>
   
   
   


   <div class="contentDiv">
   <div class="subTitle">
   <h4><strong>| 주문자 정보</strong></h4>
   </div>
   
   <table border="1" cellpadding="0" cellspacing="0">
      <colgroup>
         <col width="150" />
         <col width="400" />
      </colgroup>

      <tr>
         <th>이름</th>
         <td>${orderMember.memName}</td>
      </tr>
      <tr>
         <th>연락처</th>
         <td>${orderMember.contact}</td>
      </tr>
      
   </table>

   
   
   </div>
   
   
   
   <div class="contentDiv">
   
   

   <div class="subTitle">
   <h4><strong>| 배송 정보</strong></h4>
   </div>
   
   <table border="1" cellpadding="0" cellspacing="0">
      <colgroup>
         <col width="150" />
         <col width="400" />
      </colgroup>

      <tr>
         <th>이름</th>
         <td>${delivery.receiver}</td>
      </tr>
      <tr>
         <th>주소</th>
         <td>${delivery.receivAddr}</td>
         
      </tr>
      <tr>
         <th>연락처</th>
         <td>${delivery.receivContact}</td>
      </tr>
      <tr>
         <th>요청사항</th>
         <td>${delivery.reqNote}</td>
      </tr>
   </table>
   </div>
   



   <div class="contentDiv">
   


   <div class="subTitle">
   <h4><strong>| 결제 정보</strong></h4>
   </div>
   
   <table border="1" cellpadding="0" cellspacing="0">
      <colgroup>
         <col width="150" />
         <col width="400" />
      </colgroup>

      <tr>
         <th>결제 방법</th>
         <td>payment method</td>
      </tr>
      <tr>
         <th>결제금액</th>
         <td>${order.totalPay}</td>
      </tr>

   </table>
   
   </div>
 


     <div class="btns">
            <button type="submit" class="button1">주문내역/배송조회 확인</button>
            <button type="submit" class="button2">쇼핑 계속하기</button>
            <button type="submit" class="button3">메인으로 가기</button>
            <button type="submit" class="button4">로그아웃</button>
    </div>
   
   </div>
   
   
   



   </div>
   <!-- end of containerOFAll -->


</body>
</html>