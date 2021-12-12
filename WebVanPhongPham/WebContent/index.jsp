<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="container text-center col-4">
	<div class="card border border-info p-3" style="width: 25rem;">
  		<div class="h3">Đăng nhập bằng tài khoản Google</div>
	    <%
	    	String id = request.getAttribute("idGoogle").toString();
	    	String picture = String.valueOf(request.getAttribute("pictureGoogle"));
	    	String email = request.getAttribute("emailGoogle").toString();
	    	out.print("Id: " + id);
	    	out.print("<br/>Email: " + email);
	  	%>
	  	<div class="text-center mx-5 px-5 my-2">
	  		<img class="rounded-circle" style="width: 100px; height: 100px;" alt="" src="${pictureGoogle }">
	  	</div>
	  	<form action="register1.htm" method="post">
	  		<div class="col-sm-10 mx-4 p-2">
	  			<input class="form-control" name="email" value="${emailGoogle }" readonly="readonly">
	  		</div>
	  		<div class="col-sm-10 mx-4 p-2">
	  			<input class="form-control" name="picture" value="${pictureGoogle }" readonly="readonly">
	  		</div>
	  		<div class="col-sm-10 mx-4 p-2">
	  			<button class="btn btn-primary bg-gradient text-white" type="submit">Đăng nhập</button>
	  		</div>
	  </form>
  	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>