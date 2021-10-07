<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<div class="container-wrapper fixed-top navbar-dark bg-info bg-gradient ">


<div class="container-wrapper navbar-wrapper navbar-expand-lg ">
	<div class="container">
		<a class="navbar-brand mb-0 sizemenu" href="#"><i class="fas fa-phone"></i> 0382305835</a>
		<a class="navbar-brand mb-0 sizemenu" href="#"><i class="far fa-paper-plane"></i> ministorehr@gmail.com</a>	
		<ul class="navbar-nav pull-right">

			<li class="nav-item active ">
				<a class="nav-link text-white" href="#">Danh mục sản phẩm <span
					class="sr-only">(current)</span>
				</a>
			</li>

			<li class="nav-item active ">
				<a class="nav-link text-white" href="#"><i class="fas fa-info-circle"></i> Thông tin store <span
					class="sr-only">(current)</span>
				</a>
			</li>

			<!-- Nav Item - User Information -->
			<li class="nav-item dropdown">
			<a  class="nav-link dropdown-toggle text-white" href="#"
				id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown"
				aria-expanded="false"> 
					<i class="fas fa-user-circle"></i>
					<span class="mr-2 d-none d-lg-inline text-white small">Username</span> 
					
			</a> 
			<!-- Dropdown - User Information -->
				<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<li><a class="dropdown-item" href="#">Tài khoản của tôi</a></li>
					<li><a class="dropdown-item" href="#">Đơn hàng của tôi</a></li>
					<li><a class="dropdown-item" href="#">Đăng xuất</a></li>
				</ul></li>

		</ul>
		
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
	<form class="d-none d-sm-inline-block form-inline mr-auto my-2 my-lg-0 " style="width: 700px;">
       <div class="input-group ">
         <input class="form-control mr-sm-2" style="padding: inherit;" type="search" placeholder=" Search" aria-label="Search">
         <div class="input-group-append">
         <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fas fa-search fa-sm"></i></button>
         </div>
       </div>
    </form>

	</div>
	    </div>
	    <div class="col">
	      <button type="button" class="btn position-relative border pull-right">
					<i class="fas fa-shopping-cart"></i> <span
						class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">7
						<span class="visually-hidden">Sản phẩm</span>
					</span>
			</button>
	    </div>
	</div>
</div>

</div>
</div>