<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100">
		<form class="login100-form validate-form" action="changePassword.htm">
			<span class="login100-form-logo">
			<i class="fas fa-shopping-bag" style="color: #7579ff;"></i>
			</span>
			
			<span class="login100-form-title py-4">Cập nhật mật khẩu</span>
			
			<div class="wrap-input100 validate-input">
				<input class="input100" type="text" disabled name="username" value="HelloKity">
			</div>
			
			<div class="wrap-input100 validate-input" data-validate="Enter password">
				<input class="input100" type="password" name="pass" placeholder="Mật khẩu mới">
			</div>
			
			<div class="wrap-input100 validate-input" data-validate="Enter password">
				<input class="input100" type="password" name="pass" placeholder="Xác nhận mật khẩu mới">
			</div>
			
			<div class="container-login100-form-btn">
				<button class="login100-form-btn">Khôi phục</button>
			</div>
		</form>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>