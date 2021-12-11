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
		<div class="h4 text-uppercase text-center">Thông tin cá nhân</div>
		
		<div class="row">
			<div class="col-8 ps-3">
				<div class="row my-3">
					<label class="col-sm-4 fw-bold">Tên tài khoản: </label>
					<div class="col-sm-8">${sessionScope.admin.username }</div>
				</div>
				
				<div class="row my-3">
					<label class="col-sm-4 fw-bold">Họ và tên: </label>
					<div class="col-sm-8">${sessionScope.admin.lastName } ${sessionScope.admin.firstName }</div>
				</div>
				
				<div class="row my-3">
					<label class="col-sm-4 fw-bold">Số điện thoại: </label>
					<div class="col-sm-8">${sessionScope.admin.phone }</div>
				</div>
				
				<div class="row my-3">
					<label class="col-sm-4 fw-bold">Email: </label>
					<div class="col-sm-8">${sessionScope.admin.email }</div>
				</div>
				
				<div class="row my-3">
					<label class="col-sm-4 fw-bold">Địa chỉ: </label>
					<div class="col-sm-8">${sessionScope.admin.address.specificAddress }, ${sessionScope.admin.address.ward.prefix} ${sessionScope.admin.address.ward.name}, ${sessionScope.admin.address.ward.district.prefix} ${sessionScope.admin.address.ward.district.name}, ${sessionScope.admin.address.ward.district.province.name}</div>
				</div>
				
				<div class="row my-3">
					<label class="col-sm-4 fw-bold">Ngày tạo tài khoản: </label>
					<div class="col-sm-8">${sessionScope.admin.registrationDate }</div>
				</div>
				
			</div>
			<div class="col-4 border-start text-center">
				<div class="avatar-preview">
	        		<img src="${sessionScope.admin.image }" id="imagePreview" class="rounded-circle" style="width: 180px; height: 180px;">
	            </div>
			</div>
		</div>
	
		<div class="my-3 me-5 text-center">
			<a class="btn btn-outline-warning" href="admin/editProfile.htm" role="button">Chỉnh sửa</a>
			<a class="btn btn-outline-dark" href="admin/myProfile/changePassword.htm" role="button">Đổi mật khẩu</a>
		</div>
	</div>
		
</div>
</div>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>