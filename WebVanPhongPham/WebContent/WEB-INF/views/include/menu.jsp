<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<base href="${pageContext.servletContext.contextPath}/">
<div class="container-wrapper fixed-top navbar-dark bg-info bg-gradient ">


<div class="container-wrapper navbar-wrapper navbar-expand-lg ">
	<div class="container ">
	<div class="row">
		<div class="col">
			<a class="navbar-brand mb-0 sizemenu" href="#"><i class="fas fa-phone"></i> 0382305835</a>
			<a class="navbar-brand mb-0 sizemenu" href="#"><i class="far fa-paper-plane"></i> ministorehr@gmail.com</a>
		</div>
		
		<div class="col-auto text-end px-0">	
			<a class="nav-link text-white" href="home/category.htm">
				<i class="fas fa-clipboard-list"></i> Danh mục sản phẩm 
				<span class="sr-only">(current)</span>
			</a>
		</div>
		
		<div class="col-auto text-end px-0">	
			<a class="nav-link text-white" href="home/information.htm">
				<i class="fas fa-info-circle"></i> Thông tin store 
				<span class="sr-only">(current)</span>
			</a>
		</div>	

		<div class="col-auto text-end px-0">	
			<!-- Nav Item - User Information -->
			<ul class="navbar-nav">
				<li class="nav-item dropdown text-end">
					<a  class="nav-link dropdown-toggle text-white" href="#"
						id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> 
							<i class="fas fa-user-circle"></i>
							<span class="mr-2 d-none d-lg-inline text-white small">${sessionScope.user.username }</span> 
							
					</a> 
					<!-- Dropdown - User Information -->
					<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<c:choose>
							<c:when test="${sessionScope.user != null}">
								<li><a class="dropdown-item" href="user/userProfile.htm">Tài khoản của tôi</a></li>
								<li><a class="dropdown-item" href="user/order.htm">Đơn mua</a></li>
								<li><a class="dropdown-item" href="logout.htm">Đăng xuất</a></li>
							</c:when>
							<c:otherwise>
								<li><a class="dropdown-item" href="login.htm">Đăng nhập</a></li>
								<li><a class="dropdown-item" href="register.htm">Đăng ký</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	</div>
</div>
<div class="navbar-home navbar-expand-lg container-wrapper ">
	<div class="container">
	<div class="row">
	    <div class="col">
	     	<a class="navbar-brand mb-0 h1" href="#"><i class="fas fa-shopping-bag"></i> MiniStore</a>
	    </div>
	    <div class="col-8 ">
	      <div class="text-center form-inline ">
	<form class="d-none d-sm-inline-block form-inline mr-auto my-2 my-lg-0 " style="width: 700px;" action="home/search.htm">
       <div class="input-group ">
         <input class="form-control mr-sm-2" style="padding: inherit;" type="search" placeholder=" Sản phẩm cần tìm" aria-label="Search">
         <div class="input-group-append">
         <button class="btn btn-outline-success my-2 my-sm-0" type="submit"> <i class="fas fa-search fa-sm"></i></button>
         </div>
       </div>
    </form>

	</div>
	    </div>
	    <div class="col text-end">
	      <a role="button" class="btn position-relative border pull-right" href="user/cart.htm">
			<i class="fas fa-shopping-cart"></i>
				<c:if test="${not empty sessionScope.totalItem }">
					<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">${sessionScope.totalItem }
						<span class="visually-hidden">Sản phẩm</span>
					</span>
				</c:if>
			</a>
	    </div>
	</div>
</div>

</div>
</div>