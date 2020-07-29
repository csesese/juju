<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
    <title>Admin Page</title>
<%-- <%@include file="../includes/header.jsp" %> --%>
<style>
	li{
       list-style: none;
       
   	}
   	body{
       color: #303030;
   	}
   	a{
       text-decoration: none;
       color: #303030;
       font-size: 17px;
   	}
   	.banner_content{
       width: 1300px;
       height: 1000px;
       margin:0 auto;
       border: solid;
   	}
   	.banner_wrap{
      position: relative;
      display: inline-block;
      padding-top: 30px;
      background-color: cornsilk;
   	}
   
   	.side{
       width: 200px;
       height: 500px;
       background-color: white;
       float: left;
       margin-right: 90px;
       border:solid;
       
   	}
   	.banner_main{
       float:  right;
       width: 1000px;
       height: 1000px;
       background-color: white;
   	} 
   	.banner_side_tit{
       padding-top: 12px;
       padding-bottom:12px ;
       text-align: center;
       width: 100%;
       background-color: #ffc30b;
       font-size: 20px;
       font-weight: 900;
   	}
   	
   .banner_main .banner_tit{
       font-size: 30px;
       margin-bottom:50px;

   }
	#activeImg img{
		height : 170px;
		width : 700px;
		padding-bottom : 30px;
	}
</style>
<body>
    <div class="banner_content">
        <div class="banner_wrap">
            <div class="side">
                <div class="1nb_list">
                    <div class="banner_side_tit">
                        	배너관리
                    </div>
                    <div class="banner_side_menu">
                        <ul class="banner_menu">
                            <li><a href='/admin/mainBanner'><i class="fa fa-check" ></i>메인 배너</a></li>
                            <li><a href='/admin/advertise'><i class="fa fa-check" ></i>중간 광고</a></li>
                            <li><a href='/admin/seasonalMagazine'><i class="fa fa-check" ></i>제철 페이지</a></li>
                            <li><a href='/admin/eventBanner'><i class="fa fa-check" ></i>이벤트</a></li>
                        </ul>
                    </div>
                </div>

            </div>

            <div class="banner_main">
                <div class="banner_tit">
                    <p><b><i class="fa fa-list-alt"></i>상품 고르기</b></p>
                    <p><b><i class="fa fa-list-alt"></i>제철 페이지 매거진 등록</b></p>
                </div>
                <p style='opacity:0.75;'>이미지 규격 : </p>
                <div class="uploadDiv">
                	<input type="file" name="uploadFile" multiple>
                	<!-- <button id="uploadBtn">등록하기</button> -->
                </div>
                <div class="uploadResult">
                	<ul>
                	
                	</ul>
                </div>
                
               	<label>현재 등록된 매거진</label><br>
                <div id="activeImg">
                	<c:forEach items="${seasonal }" var="seasonal">
		           		<img class="banner" alt="" src='/resources/banner/<c:out value="${seasonal.imgPath}"/>/<c:out value="${seasonal.uuid}"/>_<c:out value="${seasonal.imgName}"/>' >
		           		<button id='removeBtn' data-oper='<c:out value="${seasonal.imgNo}"/>'>삭제</button>
		           	</c:forEach>
                </div>
             </div>
            <!-- banner_main  -->
        </div>
        <!-- banner_wrap -->
    </div>
    <!-- banner_content -->

    <script type="text/javascript">
    	$(document).ready(function() {
    		
    		var regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif|PNG|JPG)$");
    		var maxSize = 5242880;
    		
    		function checkExtension(fileName, fileSize) {
    			if(fileSize >= maxSize) {
    				alert("파일 사이즈 초과입니다.");
    				return false;
    			}
    			
    			if(!regex.test(fileName)) {
    				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
    				return false;
    			}
    			return true;
    		}
    		
    		var cloneObj = $(".uploadDiv").clone();
    		
    		$("input[type='file']").change(function(e) {
    			var formData = new FormData();
    			var inputFile = $("input[name='uploadFile']");
    			var files = inputFile[0].files;
    			
    			console.log(files);
    			
    			for(var i=0; i<files.length; i++) {
    				if(!checkExtension(files[i].name, files[i].size)) {
    					return false;
    				}
    				formData.append("uploadFile", files[i]);
    			}
    			
    			$.ajax({
    				url : '/admin/seasonalMagazine',
    				processData : false,
    				contentType : false,
    				data : formData,
    				type : 'POST',
    				dataType : 'json',
    				success : function(result) {
    					console.log(result);
    					alert("정상적으로 등록되었습니다.");
    					showUploadedFile(result);
    					
    					//$(".uploadDiv").html(cloneObj.html());
    				}
    			}); // $.ajax
    		}); // uploadBtn click event
    		
    		function showUploadedFile(uploadResultArr) {
    			if(!uploadResultArr || uploadResultArr.length == 0) {return; }
    			
    			var str = "";
	    		var uploadUL = $(".uploadResult ul");
    			
    			$(uploadResultArr).each(function(i, obj) {
	    			var fileCallPath = encodeURIComponent(obj.imgPath + "/" + obj.uuid + "_" + obj.imgName);
	    			str += "<li><div>";
	    			str += "<span>" + obj.imgName + "</span>";
	    			str += "<button type='button' data-no='"+ obj.imgNo +"' data-file=\'" + fileCallPath + "\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
    				str += "<img src='/admin/display?imgName=" + fileCallPath + "'>";
    				str += "</div></li>";
    			});
    			
    			
    			uploadUL.append(str);
    		}
    		
    		$(".uploadResult").on("click", "button", function(e) {
    			var targetFile = $(this).data("file");
    			var type = $(this).data("type");
    			var imgNo = $(this).data("no");
    			
    			var targetLi = $(this).closest("li");
    			
    			$.ajax({
    				url : '/admin/deleteFile',
    				data : {fileName : targetFile, type : type, bannerType : 'seasonal', imgNo : imgNo},
    				dataType : 'text',
    				type : 'POST',
    				success : function(result) {
    					if(result == 'deleted') {
    						alert("정상적으로 삭제되었습니다.");
    						location.reload();
    					}else {
    						alert("오류가 생겼습니다. 잠시 후 다시 시도해주세요.");
    					}
    					targetLi.remove();
    				}
    			});	// $.ajax
    		}); // uploadResult on click
    		
    		$("#activeImg").on("click","button[id='removeBtn']", function(e){
    	        var target = e.target;
    	        var dataFormat = $(target).closest("button");
    	        var imgNo = dataFormat.data("oper");
    	        
    	        var result = confirm("정말로 삭제하시겠습니까? 삭제하면 메인 화면에도 반영됩니다.");
    	        if (result) {
	    	        $.ajax({
	    				url : '/admin/remove',
	    				data : {imgNo : imgNo},
	    				dataType : 'text',
	    				type : 'POST',
	    				success : function(result) {
	    					if(result == 'deleted') {
	    						alert("정상적으로 삭제되었습니다.");
	    						location.reload();
	    					}else {
	    						alert("오류가 생겼습니다. 잠시 후 다시 시도해주세요.");
	    					}
	    				}
	    			});	// $.ajax
    	        }else {
    	        	return false;
    	        }
    		});
    	});
	</script>
</body>
</html>