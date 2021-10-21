<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">

<div class="d-flex flex-column flex-shrink-0 p-3 mbg-navy">
	<div class="py-2 text-center">
		<i class="fab fa-phoenix-framework" style="font-size: 75px;"></i>
	</div>
	<ul class="nav nav-pills flex-column mb-auto">
		<li class="nav-item border-top pt-2">
			<a class="nav-link collapsed text-light" href="admin/listProduct.htm">
				<i class="fas fa-clipboard-list"></i> Danh sách sản phẩm
			</a>	
		</li>
		
		<li class="nav-item border-top pt-2">
			<a class="nav-link collapsed text-light" href="admin/listBrand.htm">
				<i class="fas fa-building"></i> Danh sách thương hiệu
			</a>	
		</li>
		
		<li class="nav-item border-top pt-2">
			<a class="nav-link collapsed text-light" href="admin/listCategory.htm">
				<i class="fas fa-pencil-ruler"></i> Danh sách loại sản phẩm
			</a>	
		</li>
		
		<li class="nav-item border-top pt-2">
			<a class="nav-link collapsed text-light" href="admin/listOrder.htm">
				<i class="fas fa-box-open"></i> Danh sách đơn hàng
			</a>	
		</li>
		
		<li class="nav-item border-top pt-2">
			<a class="nav-link collapsed text-light" href="admin/showPoster.htm">
				<i class="fas fa-images"></i> Quản lý áp phích
			</a>	
		</li>
		
		<li class="nav-item border-top pt-2">
			<a class="nav-link collapsed text-light" href="admin/listUser.htm">
				<i class="fas fa-user-friends"></i> Danh sách người dùng
			</a>	
		</li>
		
	</ul>

</div>