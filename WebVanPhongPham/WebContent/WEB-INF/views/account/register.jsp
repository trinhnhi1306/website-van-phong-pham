<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100">
		
		<form class="login100-form validate-form">
			<span class="login100-form-logo">
			<i class="fas fa-shopping-bag" style="color: #7579ff;"></i>
			</span>
			
			<span class="login100-form-title py-4">Đăng kí</span>
			
			<div class="wrap-input100 validate-input" data-validate="Enter username">
				<input class="input100" type="text" name="username" placeholder="Tên đăng nhập">
			</div>
			
			<div class="wrap-input100 validate-input" data-validate="Enter password">
				<input class="input100" type="password" name="pass" placeholder="Mật khẩu">
			</div>
			
			<div class="wrap-input100 validate-input" data-validate="Enter password">
				<input class="input100" type="password" name="pass" placeholder="Họ">
			</div>
			
			<div class="wrap-input100 validate-input" data-validate="Enter password">
				<input class="input100" type="password" name="pass" placeholder="Tên">
			</div>
			
			<div class="wrap-input100 validate-input" data-validate="Enter password">
				<input class="input100" type="password" name="pass" placeholder="Email">
			</div>
			
			<div class="wrap-input100 validate-input" data-validate="Enter password">
				<input class="input100" type="password" name="pass" placeholder="Số điện thoại">
			</div>
			
			<div class="container-login100-form-btn">
				<button class="login100-form-btn">Đăng kí</button>
			</div>
			
			<div class="text-center pt-5">
				<label class="text-white">Đã có tài khoản: </label>
				<a class="txt1 ps-1" href="login.htm">Đăng nhập</a>
			</div>
		</form>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>