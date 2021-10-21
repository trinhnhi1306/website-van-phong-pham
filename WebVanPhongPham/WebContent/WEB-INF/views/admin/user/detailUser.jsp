<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/adminMenu.jsp"%>

<div class="container-fluid">
<div class="row">
	<div class="col-3">
		<%@include file="/WEB-INF/views/include/adminTool.jsp"%>
	</div>
		
	<div class="col-9 mbg-azure pt-2">
		<div class="h4 text-uppercase text-center">Thông tin người dùng</div>
		
		<div class="row">
			<div class="col-8 ps-3">
				<div class="row my-3">
					<label class="col-sm-4 fw-bold">Tên tài khoản: </label>
					<div class="col-sm-8">Hello Kitty</div>
				</div>
				
				<div class="row my-3">
					<label class="col-sm-4 fw-bold">Họ và tên: </label>
					<div class="col-sm-8">Nguyễn Ngọc Lâm Như</div>
				</div>
				
				<div class="row my-3">
					<label class="col-sm-4 fw-bold">Số điện thoại: </label>
					<div class="col-sm-8">0382305835</div>
				</div>
				
				<div class="row my-3">
					<label class="col-sm-4 fw-bold">Email: </label>
					<div class="col-sm-8">lamnhunguyen4@gmail.com</div>
				</div>
				
				<div class="row my-3">
					<label class="col-sm-4 fw-bold">Địa chỉ: </label>
					<div class="col-sm-8">581/30A Trường Chinh, Tân Sơn Nhì, Tân Phú, Tp. Hồ Chí Minh</div>
				</div>
				
				<div class="row my-3">
					<label class="col-sm-4 fw-bold">Ngày tạo tài khoản: </label>
					<div class="col-sm-8">12/12/2121</div>
				</div>
				
				<div class="row my-3">
					<label class="col-sm-4 fw-bold">Quyền hạn: </label>
					<div class="col-sm-8">User</div>
				</div>
				
			</div>
			<div class="col-4 border-start text-center">
				<div class="avatar-preview">
	        		<img src="resources/images/users/userDefaul.png" id="imagePreview" class="rounded-circle" style="width: 180px; height: 180px;">
	            </div>
			</div>
		</div>
	
		<div class="my-3 me-5 text-center">
			<a class="btn btn-outline-danger" href="admin/editProduct.htm" role="button">Xóa</a>
		</div>
	</div>
		
</div>
</div>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>