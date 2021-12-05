<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="limiter">
	<div class="container-login100">
		<c:if test="${not empty authen}">
			<div class="col-sm-8 alert alert-danger alert-dismissible" role="alert">
				Bạn cần đăng nhập để thực hiện chức năng này!
				<button type="button" class="rem" data-dismiss="alert" aria-label="Close">&times;</button>
			</div>
		</c:if>
		<div class="wrap-login100">
			<form:form action="login.htm" method="post" modelAttribute="user" class="login100-form validate-form">
				<span class="login100-form-logo"> <i
					class="fas fa-shopping-bag" style="color: #7579ff;"></i>
				</span>

				<span class="login100-form-title py-4">Đăng nhập</span>
				
				<div class="wrap-input100 validate-input"
					data-validate="Enter username">
					<form:input class="input100" type="text" path="username" placeholder="Tên đăng nhập" required="true" />
					<label class="mb-1">
						<form:errors path="username" cssClass="errorss" />
					</label>
				</div>

				<div class="wrap-input100 validate-input"
					data-validate="Enter password">
					<form:input class="input100" type="password" path="password" placeholder="Mật khẩu" required="true" />
					<label class="mb-1">
						<form:errors path="password" cssClass="errorss" />
					</label>
				</div>

				<div class="container-login100-form-btn">
					<button type="submit" class="login100-form-btn">Đăng nhập</button>
				</div>

				<div class="text-center pt-5">
					<a class="txt1 pe-1" href="home.htm">Trang chủ</a>
					<a class="txt1 pe-1" href="forgotPassword.htm">Quên mật khẩu?</a>
					<a class="txt1 ps-1" href="register.htm">Đăng kí</a>
				</div>
			</form:form>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>