<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "../includes/header.jsp" %>
<%@ include file = "../includes/menuBar.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>주문서 작성 및 결제</title>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="../../../resources/css/orderItemsForm.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>




	<form action="orderResult" id="orderResult" method="post">

		<p style="text-align: right;">
			01 장바구니 > <strong> 02 주문서 작성/결제 > </strong> 03 주문완료
		</p>


		<hr size="2px" color="grey"></hr>
		<!-- 	<form name="form_order"> -->
		<table class="list_view">
			<tbody align=center>
				<tr>
				<tr align=center class="fixed">

					<!-- itemImg1 from t_item -->
					<td class="fixed">아이템img</td>
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


				<c:set var="totalPay" value="${0}" />
				<c:set var="totalSum" value="${0}" />
				<c:set var="totalDiscount" value="${0}" />

				<c:forEach var="order" items="${orderList}">

					<c:set var="totalPay"
						value="${totalPay + (order.price * order.itemNum)}" />
					<c:set var="totalSum"
						value="${totalSum + (order.normPrice * order.itemNum)}" />
					<tr cellpadding=40 align=center>
						<c:set var="totalDiscount"
							value="${totalDiscount + ((order.normPrice - order.price) * order.itemNum)}" />
					<tr cellpadding=40 align=center>
						<td><c:out value="${order.itemImg1}"></c:out></td>
						<td><c:out value="${order.itemName}"></c:out></td>
						<td><c:out value="${order.normPrice}"></c:out></td>
						<td><c:out value="${order.itemNum}"></c:out></td>
						<td><c:out value="${order.normPrice - order.price}"></c:out></td>
						<td><c:out value="${order.price * order.itemNum}"></c:out></td>
					</tr>
				</c:forEach>


			</tbody>
		</table>

		<input type="hidden" value="${memberInfo.idNo}" name="idNo">

		<div class="clear"></div>
		<br> <br>

		<div class="clear"></div>
		<br>
		<table width=80% class="list_view">
			<tbody>

				<td class="fixed join">최종 결제금액</td>
				<td class="fixed join">${totalPay}</td>

			</tbody>
		</table>
		<input type="hidden" name="totalPay" value="${totalPay}"> 
		<input type="hidden" name="totalSum" value="${totalSum}"> 
		<input type="hidden" name="totalDiscount" value="${totalDiscount}">



		<div>
			<br> <br>

			<h2>주문자 정보</h2>
			<table>
				<tbody>
					<tr class="dot_line">
						<td>이름</td>
						<td><input type="text" class="memberInfo" id="memName" name="memName"
							value="${memberInfo.memName}" size="15" readonly="readonly" /></td>
					</tr>

					<tr class="dot_line">
						<td class="fixed_join">연락처</td>
						<td><input type="text" class="memberInfo" id="contact" name="contact"
							value="${memberInfo.contact}" size="15" readonly="readonly" />
					</tr>

					<tr class="dot_line">
						<td>이메일</td>
						<td><input type="text" value="${memberInfo.emailAccount}"
							size="15"  readonly="readonly" /></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" class="memberInfo" id="memAddr" value="${memberInfo.memAddr }">
		</div>



		<h2>배송지정보</h2>
		<input type="checkbox" id="sameAsMem"> 회원정보와 동일
		<input type="checkbox" id="recentDelivery"> 최근배송지
			<input type="hidden" class="recentDeliveryInfo" id="recentReceiver" value = "${recentDelivery.receiver}">
			<input type="hidden" class="recentDeliveryInfo" id="recentReceivContact" value = "${recentDelivery.receivContact}">
			<input type="hidden" class="recentDeliveryInfo" id="recentReceivAddr" value="${recentDelivery.receivAddr}">
		
		<div class="detail_table">

			<table>
				<tbody>

					<tr class="dot_line">
						<td class="fixed_join">수령인</td>
						<td><input id="receiver" name="receiver" type="text" size="40" value="" />
					</tr>




					<tr class="dot_line">
						<td class="fixed_join">연락처</td>
						<td><input id="receivContact" name="receivContact" type = "text" size = "40" value="" /></td>

					</tr>

					<tr class="dot_line">
						<td class="fixed_join">주소</td>
						<td><input type="text" id="zipcode" name="zipcode" size="5"
							value="" readonly="readonly"> <a
							href="javascript:execDaumPostcode()">우편번호검색</a> <br>
							<p>


								지번 주소: <input type="text" id="jibunAddress" name="jibunAddress"
									size="50" value="" /><br> <br> 도로명 주소: <input
									type="text" id="roadAddress" name="roadAddress" size="50"
									value="" /><br> <br> 나머지 주소: <input type="text"
									id="receivAddr" name="receivAddr" size="50" value="" />
							</p></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">배송 메시지</td>
						<td><input id="reqNote" name="reqNote" type="text" size="50"
							placeholder="택배 기사님께 전달할 메시지를 남겨주세요." /></td>
					</tr>

					</tboby>
			</table>
		</div>


		<div class="clear"></div>
		<br> <br> <br>
		<h2>결제금액 확인 및 결제방법 선택</h2>
		<div class="detail_table">
			<table>

			</table>
		</div>
		<div class="clear"></div>
		<br> <br> <br>
		<center>
			<br> <br>


			<button type="submit" id="submitBtn">결제하기</button>
	</form>


	<script src="../../../resources/jquery/orderItemsForm.js"></script>
</body>
</html>
