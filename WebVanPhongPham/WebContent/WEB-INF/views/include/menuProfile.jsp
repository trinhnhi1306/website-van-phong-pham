<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">

<div class="d-flex flex-column flex-shrink-0 p-3 bg-white text-dark">
	<div class="row px-4">
		<div class="col-3">
			<img src="resources/images/users/user1.png" class="rounded-circle" style="width: 50px; height: 50px;">
		</div>
		<div class="col-9">
			<div class="fs-5 fw-bold">Username</div>
			<a href="user/userProfile.htm" class="link-secondary" style="text-decoration: blink;">
				<i class="fas fa-pen"></i> Sửa hồ sơ
			</a>
		</div>
	</div>
	<hr>
	<ul class="nav nav-pills flex-column mb-auto">
		<li class="nav-item">
			<a href="user/userProfile.htm" class="nav-link" aria-current="page">
				<i class="fas fa-user"></i> Thông tin tài khoản
			</a>
		</li>
		
		<li class="nav-item">
			<a href="user/address.htm" class="nav-link" aria-current="page">
				<i class="fas fa-map-marker-alt"></i> Địa chỉ hiện tại
			</a>
		</li>
		
		<li class="nav-item">
			<a href="user/changePassword.htm" class="nav-link" aria-current="page">
				<i class="fas fa-key"></i> Đổi mật khẩu
			</a>
		</li>
		
		<li class="nav-item">
			<a href="user/order.htm" class="nav-link" aria-current="page">
				<i class="fas fa-clipboard-list"></i> Đơn hàng
			</a>
		</li>
		
	</ul>

</div>