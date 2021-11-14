<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/menu.jsp"%>
	<br>
<div class="container">
<div class="row">
	<div class="col-3">
		<%@include file="/WEB-INF/views/include/menuProfile.jsp"%>
	</div>
		
	<div class="col-9 mbg-azure p-3">
		<div class="h4 text-uppercase">Địa chỉ của tôi</div>
		<hr>
		<div class="row my-3">
			<label class="col-sm-3 text-end">Họ và tên: </label>
			<div class="col-sm-9">
				${sessionScope.user.lastName } ${sessionScope.user.firstName }			
			</div>
		</div>
		  			
		<div class="row my-3">
			<label class="col-sm-3 text-end">Số điện thoại: </label>
			<div class="col-sm-9">${sessionScope.user.phone }</div>
		</div>
		
		<div class="row my-3">
			<label class="col-sm-3 text-end">Địa chỉ: </label>
			<div class="col-sm-9">
				${sessionScope.user.address.specificAddress }, ${sessionScope.user.address.ward.prefix} ${sessionScope.user.address.ward.name}, ${sessionScope.user.address.ward.district.prefix} ${sessionScope.user.address.ward.district.name}, ${sessionScope.user.address.ward.district.province.name}
			</div>
		</div>
		
		<div class="row my-3">
			<label class="col-sm-3 text-end"></label>
			<div class="col-sm-9">
				<a class="btn btn-info text-white btn-sm" href="user/changeAddress.htm" role="button">Thay đổi</a>
			</div>
		</div>
			
	</div>
		
</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>