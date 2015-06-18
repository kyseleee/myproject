<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



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

	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
	<div class="container">
		 <div class="navbar-header">
			<a class="navbar-brand logo-nav page-scroll" href="#page-top"
				style="font-size: 30px; font-family:Arial Black;">S N L</a>
		</div> 

		<div
			class="collapse navbar-collapse navbar-right navbar-main-collapse">
			<ul class="nav navbar-nav">
				<li><a class="page-scroll" href="#page-top">Home</a></li>
				<li><a class="page-scroll" href="#main1">introduction</a></li>
				<li><a class="page-scroll" href="#main2">contact</a></li>
				<li><a class="" href="login.jsp">Login</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>


	<div id="content">

		<!-- 첫번째 Main 화면 -->
		<div id="main">
	<br>
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
        <img src="./images/home/bg4.jpg" alt="Chania" width="460" height="345">
        <div class="carousel-caption">
        </div>
      </div>

      <div class="item">
        <img src="./images/home/bg2.jpg" alt="Chania" width="460" height="345">
        <div class="carousel-caption">
        </div>
      </div>
    
      <div class="item">
        <img src="./images/home/bg3.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
        </div>
      </div>

      <div class="item">
        <img src="./images/home/bg1.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
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
			<div class="main_wrap">
				
				<div class="main_title">
					<h1>SNL  <br/><br/> (Socail Network Ledger)</h1>
					<p>
						어디에서도 경험 할 수 없었던  소셜 네트워크 가계부 <br /> 경험해보세요. <br />
					</p>
					<a href="#main1" class="btn btn-circle page-scroll"> <i
						class="animated glyphicon glyphicon-arrow-down"
						style="top: 7px; right: 4px"></i></a>


				</div>



				
			</div>
		</div>
 


		<!-- 세번째 Main2 화면 -->
		<div id="main2">
			<div class="main2_wrap">
				<div class="container" style="margin-top:10px;">
					<div class="row">
						<div class="col-md-12 text-center">
							<h2>Social Network <span style="color:#be9869">Leager</span>  </h2>
							<p>bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb</p>
							
							
						</div>
					</div>
					<div class="main2_section">
					<div class="boxs" style="float: left; margin: 20px;">
					
						<div class="box-icon">
							<span style="font-size: 25px; left: 2px;"
								class="glyphicon glyphicon-calendar"></span>
							
						</div>
						<div> <br/>
							<h4>현황리스트</h4>
							<!-- <img style="width: 200px; height: 150px" class="img-responsive"
								src="./images/a.jpg" /> -->
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
						</div>
					</div>

					<div class="boxs" style="float: left; margin: 15px;">
						<div class="box-icon">
							<span style="font-size: 25px;" class="glyphicon glyphicon-usd"></span>
						</div>
						<div><br/>
							<h4>지출추가</h4>
							<!-- <img style="width: 200px; height: 150px" class="img-responsive"
								src="./images/a.jpg" /> -->
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
						</div>
					</div>

					<div class="boxs" style="float: left; margin: 15px;">
						<div class="box-icon">
							<span style="font-size: 25px;" class="glyphicon glyphicon-stats"></span>
						</div>
						<div><br/>
							<h4>통계</h4>
							<!-- <img style="width: 200px; height: 150px" class="img-responsive"
								src="./images/a.jpg" /> -->
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
						</div>
					</div>



					<div class="boxs" style="float: left; margin: 20px;">
						<div class="box-icon">
							<span style="font-size: 25px;"
								class="glyphicon glyphicon-list-alt"></span>
						</div>
						<div><br/>
							<h4>회비관리</h4>
							<!-- <img style="width: 300px; height: 150px" class="img-responsive"
								src="./images/a.jpg" /> -->
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
			<div class="main2_wrap2">
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
		<!-- Main2 End -->
		
	</div>

	<div id="footer">
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