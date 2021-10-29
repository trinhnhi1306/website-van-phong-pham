<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<div class="container-wrapper fixed-top navbar-dark mbg-navy bg-gradient ">
<div class="container ">
	<div class="row">
	    <div class="col py-4">
	     	<a class="navbar-brand mb-0 h1" href="#"><i class="fas fa-home"></i> Trang chủ</a>
	    </div>
	   
	    <div class="col-auto text-end px-0 pt-2">	
			<a class="nav-link text-white pt-3" href="admin/myProfile.htm">
				<span class="mr-2 d-none d-lg-inline pt-1">Hello ${sessionScope.admin.username }</span> 
				<img class="img-profile rounded-circle" src="resources/images/users/${sessionScope.admin.image }">
			</a>
		</div>
		
		<div class="col-auto text-end px-0 pt-3" >	
			<a class="nav-link text-white" href="logout.htm" >
				<i class="fas fa-sign-out-alt fs-4" ></i>
			</a>
		</div>	
	</div>

</div>
</div>