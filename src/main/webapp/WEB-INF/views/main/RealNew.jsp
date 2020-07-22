<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
   

    <style>


        a{
            text-decoration: none;
        }
        a:hover{
        	text-decoration:none;
        	}
        li{
            list-style: none;
        }
   		.new_pro_li{
   			margin-left: 100px;
   		}
    
        .pro_module{
            width: 270px;
            height: 500px;
            border: solid;
        }
        .pro_img_wrap{
            width: 100%;
            height: 300px;
            background-color: tomato;
            position: relative;
            overflow: hidden;
        }
        .pro_module .txt_wrap{
            position: relative;
            margin-top: 16px;
         /*    background-color: greenyellow; */
            width: 100%;
            height: 170px;
        }
        .txt_wrap .pro_flag_wrap{
            margin-left: 1px;
        }
        .pro_flag_wrap .flag{
            border: 1px solid darkgray;
            background-color: darkgray;
            display: inline-block;
            min-width: 55px;
            height: 25px;
            margin: 0 0 0 -1px;
            font-size: 12px;
            line-height: 22px;
            text-align: center;
            font-weight: 800;
            color: black;
        }
        .tit_info .info_itemName{
            display: block;
            color: black;
            font-weight: bold;
            font-size: 20px;
            word-break: break-all;
            padding: 8px 0 0;
        }
        .tit_info .info_idNo{
            display: block;
            color: black;
            font-size: 15px;
            word-break: break-all;
            margin: 5px 0 0;
        }
        .price_info{
            padding-top: 8px;
            font-size: 0;
        }
        .price_info .sale{
            display: inline-block;
            margin-right: 5px;
            vertical-align: middle;
           
            
        }
        .price_info .sale .price{
            display: inline-block;
            vertical-align: top;
            font-size: 21px;
            line-height: 27px;
            font-weight: 800;
            color: black;
        }
        .price_info .normPrice{
            display: inline-block;
            padding-left: 6px;
            color: black;
            font-size: 13px;
            line-height: 21px;
            text-decoration: line-through;
            vertical-align: middle;
        }
        .pro_module .cart_btn{
            position: static;
            margin-top: 5px;
        }
        .pro_list .pro_list_ul .pro_list_li{
            float: left;
            margin: 40px 0 0 25px;
            min-height: 550px;
        } 
    </style>
</head>
<body>
			 <div class="new_pro_li">
                    <c:forEach items="${RealNew }" var="realnew">
	         
							<section id="pro_container"> 
							
							    <div class="pro_list">
							        <ul class="pro_list_ul">
							            <li class="pro_list_li">
							                <div class="pro_module">
							                <div class="pro_img_wrap">
							                    <a href="#" class="conts">
							                        <img src="/resources/images/default1.png" alt="메인 이미지">
							                    </a>
							                </div>
							                <!-- END img_wrap -->
							                <div class="txt_wrap">
							                	 <a href="#" class="conts">
							                        <div class="pro_flag_wrap">
							                            <span class="flag"> <c:out value="${realnew.itemChr}" /></span>
							                        </div>
							                        <!-- END pro_flag_wrap -->
							                        <div class=tit_info>
							                            <span class="info_itemName"> <c:out value="${realnew.itemName}" /> </span>
							                            <span class="info_idNo"><c:out value="${realnew.idNo}" /></span>
							                        </div>
							                        <!-- END tit_info -->
							                        <div class="price_info">
							                                <p class="sale">
							                                    <span class="price"><c:out value="${realnew.price}" />
							                                        <span class="won">원</span>
							                                    </span>
							                                </p>
							                                <p class="normPrice">
							                                  <c:out value="${realnew.normPrice}" />
							                                  <span class="won">원</span>
							                                </p>
							                        </div>
							                  		 </a>
							                    <div class="cart_btn">
							                        <button type="button" class="add_to_cart">add to cart</button>
							                    </div>
							                </div>
							                <!-- END txt_wrap -->
							                
							                </div>
							                <!-- END pro_moduel  -->
							            </li>     
							        </ul>    
							    </div>
							    <!--END pro_list  -->
							</section>     
	                   
	               </c:forEach>

                </div>		
</body>
</html>