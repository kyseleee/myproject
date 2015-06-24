<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${! empty param.sgroupNo}">
<%
	String sgroupNo = request.getParameter("sgroupNo");
	session.setAttribute("sgroupNo", sgroupNo);
%>
</c:if>

<c:if test=" ${! empty user}">
	<script type="text/javascript">
		location.href="/calendar.jsp";
	</script>
</c:if>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--  css -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/grayscale.css" rel="stylesheet">
<link href="css/mainActivity.css" rel="stylesheet">

<!--  js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/login.js"></script>


</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation" style="background-color:#2b3340 !important;">
	<div class="container">
		 <div class="navbar-header">
			<a class="navbar-brand logo-nav page-scroll" href="#page-top" style="font-size:2em;
			font-weight:bold; color:white;">S N L</a>
		</div> 

		<div
			class="collapse navbar-collapse navbar-right navbar-main-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a class="page-scroll active" href="#page-top">Home</a></li>
				<li><a class="page-scroll" href="#main2">introduction</a></li>
				<li><a class="" href="login.jsp">Login</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<div id="content">

		<!-- 첫번째 Main 화면 -->
		<div id="main">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators" style="margin-bottom:50px;">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="./images/home/bg01.jpg" alt="Chania" width="460" height="345">
        <div class="carousel-caption" style="left:5%; text-align: left; height:650px;">
				<div class="main_title">
					<div class="title">
					<h1>Simple & Easy  <br/><br/> SNL Chart </h1>
					</div>
					<div class="context">
					<p>
						UI차트는 다양한 브러쉬와 그리드, 위젯을 제공하며 <br/>
						이를 조합하여 간단하고 쉽게 차트를 사용할 수 있습니다. <br/> 
						또한 기존의 테이블 컴포넌트와 연동하여 데이터를 표현할 수 있습니다.
					</p>
					<a href="#main2" class="btn btn-circle page-scroll"> <i
						class="animated glyphicon glyphicon-arrow-down"
						style="top: 7px; right: 4px"></i></a>
					</div>	
				</div>
        </div> 
      </div>

      <div class="item">
        <img src="./images/home/bg02.jpg" alt="Chania" width="460" height="345">
        <div class="carousel-caption" style="left:20%; text-align: center; height:650px;">
        	<div class="main_title">
					<p style="color:#8772bf; font-size:60px; ">Social Network Ledger <br/> S N L </p>
					<div class="context">
					<p>
						UI차트는 다양한 브러쉬와 그리드, 위젯을 제공하며 <br/>
						이를 조합하여 간단하고 쉽게 차트를 사용할 수 있습니다. <br/> 
						또한 기존의 테이블 컴포넌트와 연동하여 데이터를 표현할 수 있습니다.
					</p>
					</div>	
					<a href="#main2" class="btn btn-circle page-scroll"> <i
						class="animated glyphicon glyphicon-arrow-down"
						style="top: 7px; right: 4px"></i></a>
				</div>
        </div>
      </div>
    
      <div class="item">
        <img src="./images/home/bg03.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption" style="left:20%; text-align: center; height:650px;">
        	<div class="main_title">
					<h1 style="color:white; padding-top:80px;">Simple & Easy  SNL Chart </h1> <br/><br/>
					<div class="context">
					<p style="color:white;">
						UI차트는 다양한 브러쉬와 그리드, 위젯을 제공하며 <br/>
						이를 조합하여 간단하고 쉽게 차트를 사용할 수 있습니다. <br/> 
						또한 기존의 테이블 컴포넌트와 연동하여 데이터를 표현할 수 있습니다.
					</p>
						<a href="#main2" class="btn btn-circle page-scroll"> <i
							class="animated glyphicon glyphicon-arrow-down"
							style="top: 7px; right: 4px"></i></a>
					</div>	
				</div>
        </div>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
			
		</div>

		<!-- 두번째 Main2 화면 -->
		<div id="main2">
			<div class="main2_wrap">
				<div class="container" style="width:100%;">
					<div class="row">
						<div class="col-md-12 text-center">
						</div>
					</div>
					<div class="main2_section">
					<div class="boxs" style="float:left; margin:30px 30px 60px 30px;">
					
						<div class="box-icon">
							<span style="font-size: 45px; left: 2px;"
								class="glyphicon glyphicon-calendar"></span>
							
						</div>
						<div> <br/>
							<h4>현황리스트</h4>
							<!-- <img style="width: 200px; height: 150px" class="img-responsive"
								src="./images/a.jpg" /> -->
							<p>그룹의 지출을 한눈에 볼 수 있어요 !</p>
						</div>
					</div>

					<div class="boxs" style="float: right; margin:30px 30px 60px 30px;">
						<div class="box-icon">
							<span style="font-size: 45px;" class="glyphicon glyphicon-usd"></span>
						</div>
						<div><br/>
							<h4>지출추가</h4>
							<!-- <img style="width: 200px; height: 150px" class="img-responsive"
								src="./images/a.jpg" /> -->
							<p>지출 발생시, 영수증도 함께 기록하시면 그룹원들에게 문자 발송 해드려요 !</p>
						</div>
					</div>

					<div class="boxs" style="float: left; margin:30px 30px 60px 30px">
						<div class="box-icon">
							<span style="font-size: 45px;" class="glyphicon glyphicon-stats"></span>
						</div>
						<div><br/>
							<h4>통계</h4>
							<!-- <img style="width: 200px; height: 150px" class="img-responsive"
								src="./images/a.jpg" /> -->
							<p>우리 그룹의 지출 패턴을 한눈에 확인할 수 있어요 !</p>
						</div>
					</div>



					<div class="boxs" style="float: right; margin:30px 30px 60px 30px">
						<div class="box-icon">
							<span style="font-size: 45px;"
								class="glyphicon glyphicon-list-alt"></span>
						</div>
						<div><br/>
							<h4>회비관리</h4>
							<!-- <img style="width: 300px; height: 150px" class="img-responsive"
								src="./images/a.jpg" /> -->
							<p>우리 그룹의 회비 수납. 이제 SNL을 통해 확인하세요.</p>
						</div>
					</div>
					
				</div>
			</div>
		</div>
			<!-- <div class="main2_wrap2">
					<div class="container">
  <div class="row">
    <h2>Media Slider Carousel BS3</h2>
  </div>
    <div class='col-md-12'>
      <div class="carousel slide media-carousel" id="media">
        <div class="carousel-inner">
          <div class="item  active">
            <div class="row">
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="./images/a.jpg;"></a>
              </div>          
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="./images/a.jpg;"></a>
              </div>
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="./images/a.jpg;"></a>
              </div>        
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="./images/a.jpg;"></a>
              </div>          
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="./images/a.jpg;"></a>
              </div>
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="./images/a.jpg;"></a>
              </div>        
            </div>
          </div>
        </div>
        <a data-slide="prev" href="#media" class="left carousel-control">‹</a>
        <a data-slide="next" href="#media" class="right carousel-control">›</a>
      </div>                          
					</div>
			</div>
			
		</div>
		Main2 End
		 -->
	</div>
</div>

	<div id="footer2">
	</div>
	
	<div id="footer">
	<div class="center row">
		<div class="col col-8 msg">
			JENNIFER UI has developed by the UI parts of JenniferSoft.<br>
			Designer Yoha and Programmer Alvin and Jayden has developed a UI library.
		</div>
		<div class="col col-4 link">
		</div> <br/>
		<div class="col col-8 msg">
			Code licensed under MIT License.<br>
			Copyright © 2015 JenniferSoft Inc. All rights reserved.
		</div>
		<div class="col col-4 link">
			<strong>Supported languages:</strong>
			<span>English</span>
		</div>
	</div>
	</div>
	
	


<script src="js/jquery.easing.min.js"></script>
<script src="js/grayscale.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	  $('#media').carousel({
	    pause: true,
	    interval: false,
	  });
	});
	
</script>
</body>
</html>