<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100">
		
		<form:form method="post" modelAttribute="user" enctype="multipart/form-data" class="login100-form validate-form">
			<span class="login100-form-logo">
			<i class="fas fa-shopping-bag" style="color: #7579ff;"></i>
			</span>
			
			<span class="login100-form-title py-4">Đăng kí</span>
			
			<div class="wrap-input100 validate-input" data-validate="Enter username">
				<form:input path="username" class="input100" type="text" name="username" placeholder="Tên đăng nhập (*)" required="true"/>
			</div>
			
			<div class="wrap-input100 validate-input" data-validate="Enter password">
				<form:input path="password" class="input100" type="password" name="pass" placeholder="Mật khẩu (*)" required="true"/>
			</div>
			
			<div class="wrap-input100 validate-input" data-validate="Enter password">
				<form:input path="lastName" class="input100" type="text" name="pass" placeholder="Họ (*)" required="true"/>
			</div>
			
			<div class="wrap-input100 validate-input" data-validate="Enter password">
				<form:input path="firstName" class="input100" type="text" name="pass" placeholder="Tên (*)" required="true"/>
			</div>
			
			<div class="wrap-input100 validate-input" data-validate="Enter password">
				<form:input path="phone" class="input100" type="phone" name="pass" placeholder="Số điện thoại (*)" required="true"/>
			</div>
			
			<div class="wrap-input100 validate-input" data-validate="Enter password">
				<form:input path="email" class="input100" type="email" name="pass" placeholder="Email"/>
			</div>
			
			<div class="container-login100-form-btn">
				<button type="submit" class="login100-form-btn">Đăng kí</button>
			</div>
			
			<div class="text-center pt-5">
				<label class="text-white">Đã có tài khoản: </label>
				<a class="txt1 ps-1" href="login.htm">Đăng nhập</a>
			</div>
			<form:input path="permission.id" value="1"  type="hidden"/>
			<input name="file" type="file" class="visually-hidden">
		</form:form>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>