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

<script type="text/javascript"></script>

</head>
<body>

<!--ó�� ȸ�����ȭ�� -->
	<div class="container" style="border: 1px solid; padding: 15px">
		<div class="row">
			<div class="col-sm-12">
				<h2 align="center"> < ȸ�� ���� > </h2>
				
				<!-- ȸ����������� �׷� ����Ʈ -->
				<div style="padding-bottom: 15px;">
					<ul class="nav nav-pills">
						<li id="flip" class="active"><a href="#">�׷�1</a></li>
						<li><a href="#">�׷�2</a></li>
						<li><a href="#">�׷�3</a></li>
					</ul>
				</div>
				
				<div class="panel panel-default">
					<div class="panel-body form-horizontal payment-form">

						<div class="form-group" style="margin-bottom: 40px">
							<label for="concept" class="col-sm-3 control-label">ȸ���</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="concept" name="concept" placeholder="�̸��� �Է��ϼ���" style="width: 40%">
							</div>
						</div>

						<div class="form-group" style="margin-bottom: 40px">
							<label for="date" class="col-sm-3 control-label">��¥</label>
							<div class="col-sm-8">
								<input type="date" class="form-control" id="date" name="date" style="width: 40%">
							</div>
						</div>

						<div class="form-group" style="margin-bottom: 40px">
							<label for="text" class="col-sm-3 control-label">ȸ��</label>
							<div class="col-sm-3">
								<p>
								<input type="text" onchange="getNumber(this);" onkeyup="getNumber(this);" class="form-control" id="pay" name="pay" placeholder="���ڸ� �Է°���" style="width: 150px">
								��</p>
							</div>

							<div class="col-sm-4">
								<label for="text" class="col-sm-3 control-label">����ȸ��</label> 
								<p>
								<input type="text" onchange="getNumber(this);" onkeyup="getNumber(this);" class="form-control" id="paylist" name="paylist" placeholder="���ڸ� �Է°���" style="width: 150px">
								��</p>
							</div>
						</div>
						
						<!-- ȸ������Ʈ ���̺� �������� üũ�� ���� ùȭ�鿡�� input(check)�� hidden���� ���� -->
						<div style="visibility: hidden">
							<div class="form-group">
								<input type="checkbox" class="form-check" id="check" name="check">
							</div>
						</div>

					</div>
				</div>
			</div>

			<div class="row">
				<div align="center" style="padding-bottom: 15px;">
					<button type="button" class="btn btn-default preview-add-button2">����</button>
					<button class="btn btn-info btn-pressure btn-sensitive">���</button>
				</div>
			</div>
			
		</div>
	</div>
	
	<!--������ bar�� ����������  -->
	<hr style="border: 1px dashed #dddddd;">

	<!--ù��° ȭ�鿡�� Toggle�� �Ѿ�� �ι�° ȭ�� -->
	<div class="container" id="panel" style="border: 1px solid;">
		
		<h3 align="center">< ȸ�񳻿� ����Ʈ ></h3>
	
	<!--ȸ������� ���� ȸ���̸� ����Ʈ(���� �̼���)-->
		<ul class="nav nav-pills" style="margin-bottom: 15px;">
			<li class="active"><a href="#">ȸ��1</a></li>
			<li class="active"><a href="#">ȸ��2</a></li>
		</ul>

		<div class="panel-body form-horizontal payment-form" style="border: 2px solid; margin-bottom: 15px;">

			<div class="form-group">
				<label for="concept" class="col-sm-3 control-label">ȸ���</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="concept1" name="concept" style="width: 40%" disabled>
				</div>
			</div>

			<div class="form-group" style="margin-bottom: 40px">
				<label for="date" class="col-sm-3 control-label">��¥</label>
				<div class="col-sm-8">
					<input type="date" class="form-control" id="date1" name="date" style="width: 40%" disabled>
				</div>
			</div>

			<div class="form-group" style="margin-bottom: 40px">
				<label for="text" class="col-sm-3 control-label">ȸ������Ʈ</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="list" name="list" placeholder="ȸ���̸��� �Է��ϼ���">
				</div>
				<button type="button" class="btn btn-default preview-add-button">
					�߰� <span class="glyphicon glyphicon-plus"></span>
				</button>
			</div>

			<div class="form-group" style="margin-bottom: 40px">
				<label for="text" class="col-sm-3 control-label">ȸ��</label>
				<div class="col-sm-3">
					<p><input type="text" class="form-control" id="pay1" name="pay" style="width: 150px" disabled> ��</p>
				</div>

				<div class="col-sm-5">
					<label for="text" class="col-sm-3 control-label">����ȸ��</label> 
					<p><input type="text" class="form-control" id="paylist1" name="paylist" style="width: 150px" disabled> ��</p>
				</div>
			</div>
		</div>
		
		<!--ȸ������Ʈ, ����ȸ��, �������� �� ȸ����Ͽ� ���� ���̺� ȭ���  -->
		<div class="row" style="border: 2px solid" style="padding-top: 15px;">
			<div class="col-xs-10">
				<div class="table-responsive">
					<table class="table preview-table">
					
						<thead>
							<tr>
								<th>ȸ������Ʈ</th>
								<th>����ȸ��</th>
								<th>��������</th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td></td>
							</tr>
						</tbody>
						
					</table>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div align="center" style="padding-bottom: 15px; margin-top: 15px">
				<button class="btn btn-info" type="button" id="submit">����</button>
				<button class="btn btn-info" type="button">���</button>
			</div>
		</div>
	</div>

	<script type="text/javascript"></script>
	
</body>
</html>
