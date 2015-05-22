<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Payment form with total preview - Bootsnipp.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type='text/javascript' src='http://code.jquery.com/jquery-1.8.0.min.js'></script>
	<script src="js/paymentManager.js"></script>

<style type="text/css">
	
#panel {
	padding: 50px;
	display: none;
}
</style>

<script type="text/javascript">

</script>

</head>
<body>

<!--처음 회비관리화면 -->
	<div class="container" style="border: 1px solid; padding: 15px">
		<div class="row">
			<div class="col-sm-12">
				<h2 align="center"> < 회비 내역 > </h2>
				
				<!-- 회비관리에대한 그룹 리스트 -->
				<div style="padding-bottom: 15px;">
					<ul class="nav nav-pills">
						<li id="flip" class="active"><a href="#">그룹1</a></li>
						<li><a href="#">그룹2</a></li>
						<li><a href="#">그룹3</a></li>
					</ul>
				</div>
				
				<div class="panel panel-default">
				<form id="register-form" action="/Snl/addGroupMoney.do" method="post">
					<div class="panel-body form-horizontal payment-form">
			

						<div class="form-group" style="margin-bottom: 40px">
							<label for="concept" class="col-sm-3 control-label">회비명</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="gmName" name="gmName" placeholder="이름을 입력하세요" style="width: 40%">
							</div>
						</div>

						<div class="form-group" style="margin-bottom: 40px">
							<label for="date" class="col-sm-3 control-label">날짜</label>
							<div class="col-sm-8">
								<input type="date" class="form-control" id="gmDate" name="gmDate" style="width: 40%">
							</div>
						</div>

						<div class="form-group" style="margin-bottom: 40px">
							<label for="text" class="col-sm-3 control-label">회비</label>
							<div class="col-sm-3">
								<p>
								<input type="text" onchange="getNumber(this);" onkeyup="getNumber(this);" class="form-control" id="gmPay" name="gmPay" placeholder="숫자만 입력가능" style="width: 150px">
								원</p>
							</div>

							<div class="col-sm-4">
								<label for="text" class="col-sm-3 control-label">개인회비</label> 
								<p>
								<input type="text" onchange="getNumber(this);" onkeyup="getNumber(this);" class="form-control" id="gmPays" name="gmPays" placeholder="숫자만 입력가능" style="width: 150px">
								원</p>
							</div>
						</div>
						
					</div>
					
			

			<div class="row">
				<div align="center" style="padding-bottom: 15px;">
					<button type="submit" class="btn btn-default preview-add-button" id="register-submit" name="register-submit">저장</button>
					<button class="btn btn-info btn-pressure btn-sensitive">취소</button>
				</div>
			</div>
			</form>
				</div>
			</div>
		</div>
	</div>
	<!--간단한 bar로 영역나누기  -->
	<hr style="border: 1px dashed #dddddd;">

	<!--첫번째 화면에서 Toggle로 넘어온 두번째 화면 -->
	<div class="container" id="panel" style="border: 1px solid;">
		
		<h3 align="center">< 회비내역 리스트 ></h3>
	
	<!--회비관리에 대한 회비이름 리스트(아직 미숙함)-->
		<ul class="nav nav-pills" style="margin-bottom: 15px;">
			<li class="active"><a href="#">회비1</a></li>
			<li class="active"><a href="#">회비2</a></li>
		</ul>

		<div class="panel-body form-horizontal payment-form" style="border: 2px solid; margin-bottom: 15px;">

			<div class="form-group">
				<label for="concept" class="col-sm-3 control-label">회비명</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="gmName1" name="gmName" style="width: 40%" disabled>
				</div>
			</div>

			<div class="form-group" style="margin-bottom: 40px">
				<label for="date" class="col-sm-3 control-label">날짜</label>
				<div class="col-sm-8">
					<input type="date" class="form-control" id="gmDate1" name="gmDate" style="width: 40%" disabled>
				</div>
			</div>

			<div class="form-group" style="margin-bottom: 40px">
				<label for="text" class="col-sm-3 control-label">회비</label>
				<div class="col-sm-3">
					<p><input type="text" class="form-control" id="gmPay1" name="gmPay" style="width: 150px" disabled> 원</p>
				</div>

				<div class="col-sm-5">
					<label for="text" class="col-sm-3 control-label">개인회비</label> 
					<p><input type="text" class="form-control" id="gmPays1" name="gmPays" style="width: 150px" disabled> 원</p>
				</div>
			</div>
		</div>
		
		<!--회원리스트, 개인회비, 수납내역 등 회원목록에 대한 테이블 화면란  -->
		<div class="row" style="border: 2px solid" style="padding-top: 15px;">
			<div class="col-xs-12">
				<div class="table-responsive">
					<table class="table preview-table">

						<thead>
							<tr>
								<th>회원</th>
								<th>개인회비</th>
								<th>수납내역</th>
							</tr>
						</thead>
						<tbody>
							<tr class="success">
								
								<td>회원1</td>
								<td>
									<p><input type="text" class="form-control" id="gmPays2" name="gmPays" style="width: 150px" disabled> 원</p>
								</td>
								<td>
									<input type="checkbox" id=check>
								</td>
							</tr>
							<tr class="danger">
								<td>회원2</td>
								<td>
									<p><input type="text" class="form-control" id="gmPays2" name="gmPays" style="width: 150px" disabled> 원</p>
								</td>
								<td>
									<input type="checkbox" id=check>
								</td>
							</tr>
							<tr class="info">
								<td>회원3</td>
								<td>
									<p><input type="text" class="form-control" id="gmPays2" name="gmPays" style="width: 150px" disabled> 원</p>
								</td>
								<td>
									<input type="checkbox" id=check>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>



		<div class="row">
			<div align="center" style="padding-bottom: 15px; margin-top: 15px">
				<button class="btn btn-info" type="button" id="submit">저장</button>
				<button class="btn btn-info" type="button">취소</button>
			</div>
		</div>
	</div>

	<script type="text/javascript"></script>
	
</body>
</html>
