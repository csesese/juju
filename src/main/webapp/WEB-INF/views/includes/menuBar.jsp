<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
   
     <style>
        li{
            /* 앞에 점 없앰 */
            list-style: none;
            color: black;
        }   
     
        .whole_menu .dropdown a,
        .whole_menu .dropdown-menu  a {
        /*전체 카테고리 안에 중분류 글씨 */
    	color:black;
        font-weight: 500;
        }
        .whole_menu .whole_menu-content.withdesc a:after {
        /* 전체 메뉴 안에 디테일한 설명들  */
        color: #CFCFCF;
        content: attr(data-description);
        display: block;
        font-size: 11px;
        font-weight: 400;
        line-height: 0;
        margin: 10px 0 15px;
        text-transform: uppercase;
    
    }
  
    .whole_menu .nav
    .whole_menu .collapse,
    .whole_menu .dropup,
    .whole_menu .dropdown {
    /*  전체카테고리 화면 꽉채우기 하기  */
        position: static;
    
    }
    .whole_menu .dropdown-menu {
    	left: auto;
    }
    .whole_menu .whole_menu-content {
        /* 전체카테고리 dropdown한 내용 */

        padding: 25px 25px;
        background:#fafafa;
    }

    .whole_menu .dropdown.whole_menu_category .dropdown-menu {
    /* 전체보기 full screen */
        left: 0;
        right: 0;
    }
    .whole_menu .title {
        /* 대분류 */
        font-size:16px;
        font-weight:bold;
        margin-top:15px;
        text-transform:uppercase;
        border-bottom:1px solid #efefef;
        padding-bottom:10px;
    }
    .whole_menu ul {
        /* 중분류 */
        list-style:none;
        padding-left:0px;
        
    }

    #defaultmenu {
        width: 100%;
        min-width: 1080px;
    }
    #defaultmenu > ul{

    display: table;
    width: auto;
    float: left;
    }
    .dropdown_each_menu{
        display: table-cell;
        position: absolute;
        height: 40px;
        padding: 0 28px;
  

    }

    .whole_menu{
        position:sticky;
        top:0;
        z-index: 1;
        width: 100%;
        min-width: 1080px;
        height: 40px;
        border: 1px;
        text-align: center;
      
    }
    .navbar-default .navbar-nav>li>a{
        color:green;
        font-weight: 800;
       
    }
    #defaultmenu > ul{
        margin-left: 20%;
        width: 1300px;
    }
    .search_bar{
    position: absolute;
    top: 50%;
    right: 10%;
    transform: translate(-50%,-50%);
    transition: all 1s;
    width: 50px;
    height: 50px;
    /* background: #5d8f6b; */
    box-sizing: border-box;
    border-radius: 25px;
    border: 4px solid #A3B6C5;
    padding: 5px;
}

.search_content{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;;
    height: 42.5px;
    line-height: 30px;
    outline: 0;
    border: 0;
    display: none;
    font-size: 1em;
    border-radius: 20px;
    padding: 0 20px;
}

.fa{
    box-sizing: border-box;
    padding: 10px;
    width: 42.5px;
    height: 42.5px;
    position: absolute;
    top: 0;
    right: 0;
    border-radius: 50%;
    color: white;
    text-align: center;
    font-size: 1.2em;
    transition: all 1s;
}
.search_bar:hover{
    width: 200px;
    cursor: pointer;
}

.search_bar:hover .search_content{
    display: block;
}

.search_bar:hover .fa{
    background: #A3B6C5;
    color: white;
}


    
    </style>

</head>
<body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!--   <script src="js/bootstrap.min.js"></script> -->
   
    <nav class="navbar navbar-default whole_menu" role="navigation" style=" background-color: #c9decf;">
      

        <div id="defaultmenu" class="navbar-collapse collapse">
           
            <ul class="nav navbar-nav"> 
            	<div class="navbar-header">
               			 <a class="navbar-brand" href="/">JUJU MARKET</a>
            	</div>
        
                <!-- 전체 카테고리  -->
                <li class="dropdown whole_menu_category"  style="padding-left: 100px;"><a href="#" data-toggle="dropdown" class="dropdown-toggle">▲전체카테고리<b class="caret"></b></a>
                    <ul class="dropdown-menu fullwidth">
                        <!-- 대분류 /중분류-->
                        <li class="whole_menu-content withdesc">
                            <div class="row_m" style="display: flex;">
                                <div class="col-sm-3">
                                    <h3 class="title"><a href="/product/list?classCode=Sea">수산물</a></h3>
                                    <ul>
                                        <li><a data-description="고등어/갈치" href="/product/list?classCode=SeaS01">생선류</a></li>
                                        <li><a data-description="꽃게" href="/product/list?classCode=SeaS02">갑각류</a></li>
                                        <li><a data-description="설명" href="/product/list?classCode=SeaS03">해조류</a></li>
                                        <li><a data-description="설명" href="/product/list?classCode=SeaS04">건어물</a></li>
                                        <li><a data-description="설명" href="/product/list?classCode=SeaS05">조개류</a></li>
                                        <li><a href="#">수산가공품</a></li>
                                    </ul>
                                </div>
    
                                <div class="col-sm-3">
                                    <h3 class="title"><a href="/product/list?classCode=Meat">축산/정육</a></h3>
                                    <ul>
                                        <li><a data-description="설명" href="/product/list?classCode=MeatM01">소고기</a></li>
                                        <li><a data-description="설명" href="/product/list?classCode=MeatM02">돼지고기</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=MeatM03">닭고기</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=MeatM04">기타정육</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=MeatM05">가공육</a></li>
                                    </ul>
                                </div>
    
                                <div class="col-sm-3">
                                    <h3 class="title"><a href="/product/list?classCode=Veggie">채소</a></h3>
                                    <ul>
                                        <li><a data-description="디테일" href="/product/list?classCode=VeggieV01">각종나물</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=VeggieV02">뿌리채소</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=VeggieV03">열매채소</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=VeggieV04">잎채소</a></li>
                                    </ul>
                                </div>
    
                                <div class="col-sm-3">
                                    <h3 class="title"><a href="/product/list?classCode=Fruit">과일</a></h3>
                                    <ul>
                                        <li><a data-description="디테일" href="/product/list?classCode=FruitF01">국내산과일</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=FruitF02">수입산과일</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=FruitF03">냉동과일</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=FruitF04">건과일</a></li>
                                    </ul>
                                </div>
    
                                <div class="col-sm-3">
                                    <h3 class="title"><a href="/product/list?classCode=Retort">간편식</a></h3>
                                    <ul>
                                        <li><a data-description="디테일" href="/product/list?classCode=RetortR01">젓갈류</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=RetortR02">양념류</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=RetortR03">반찬류</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=RetortR04">간식류</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=RetortR05">건강식품</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=RetortR06">혼밥족 반찬</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=RetortR07">견과류</a></li>
                                    </ul>
                                </div>
    
                                <div class="col-sm-3">
                                    <h3 class="title"><a href="/product/list?classCode=Grain">곡류</a></h3>
                                    <ul>
                                        <li><a data-description="디테일" href="/product/list?classCode=GrainG01">쌀</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=GrainG02">잡곡류</a></li>
                                        <li><a data-description="디테일" href="/product/list?classCode=GrainG03">건식</a></li>
                                    </ul>
                                </div>  
                         
                           
                            </div>
                             <!--end row  -->
                        </li>
                    </ul>
                </li>
                <!-- end dropdown whole_menu 전체 카테고리-->
    
                <!-- 나머지 각 meunu bar -->
              
                <li class="dropdown_each_menu" ><a href="/seasonal" data-toggle="dropdown" class="dropdown-toggle">딱 요게 제철</a>
                </li>
                <li class="dropdown_each_menu"><a href="/bob" data-toggle="dropdown" class="dropdown-toggle">베스트 오브 베스트</a>
                </li>
                <li class="dropdown_each_menu"><a href="#" data-toggle="dropdown" class="dropdown-toggle">같이사요 </a>    
                </li>
                <li class="dropdown_each_menu"><a href="#" data-toggle="dropdown" class="dropdown-toggle">이벤트 </a>    
                </li>
                
                <!-- end 나머지 각 menu bar -->
            </ul><!-- end nav navbar-nav -->
            <form class="search_bar" action="">
                <input class="search_content" type="search">
                <i class="fa fa-search"></i>
              </form>
            
        </div>
            </nav>

           
              

<script>
        $(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideDown("400");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideUp("400");
            $(this).toggleClass('open');       
        }
    );
});


</script>

