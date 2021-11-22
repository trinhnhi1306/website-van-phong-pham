<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100">
		<form:form class="login100-form validate-form" action="forgotPassword.htm" modelAttribute="user">
			<span class="login100-form-logo">
			<i class="fas fa-shopping-bag" style="color: #7579ff;"></i>
			</span>
			
			<span class="login100-form-title py-4">Quên mật khẩu</span>
			
			<div class="col-sm-10 alert-danger" role="alert">${error }</div>
			
			<div class="wrap-input100 validate-input" data-validate="Enter password">
				<form:input class="input100" type="text" path="username" placeholder="Username"/>
			</div>			
			
			<div class="wrap-input100 validate-input" data-validate="Enter password">
				<form:input class="input100" type="email" path="email" placeholder="Email"/>
			</div>
			
			<div class="container-login100-form-btn">
				<button class="login100-form-btn">Khôi phục</button>
			</div>
		</form:form>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>