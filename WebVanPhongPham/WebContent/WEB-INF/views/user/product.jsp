<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">

<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/menu.jsp"%>
	<br>
	
<div class="container">
	<div class="h4 text-uppercase">Danh mục sản phẩm</div>
	
	<div class="text-center ms-5 ps-5">
	<div class="row">
		<!-- JSTL -->
		<div class="col-3 mb-5">
			<div class="card h-100">
				<img class="card-img-top" src="resources/images/products/hopbuttim.png" style="height: 250px;">
				<div class="card-body p-4">
					<div class="text-center">
						<h5 class="fw-bolder">Fancy Product</h5>
						<div>$40.00 - $80.00</div>
					</div>
				</div>
				<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
					<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="home/product.htm">Xem</a></div>
				</div>
			</div>
		</div>
		<!-- /////////////////// -->
		
		<!-- xóa -->
		<div class="col-3 mb-5">
				<div class="card h-100">
					<img class="card-img-top" src="resources/images/products/hopbuttim.png" style="height: 250px;">
					<div class="card-body p-4">
						<div class="text-center">
							<h5 class="fw-bolder">Fancy Product</h5>
							<div>$40.00 - $80.00</div>
						</div>
					</div>
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="home/product.htm">Xem</a></div>
					</div>
				</div>
			</div>
			<div class="col-3 mb-5">
				<div class="card h-100">
					<img class="card-img-top" src="resources/images/products/hopbuttim.png" style="height: 250px;">
					<div class="card-body p-4">
						<div class="text-center">
							<h5 class="fw-bolder">Fancy Product</h5>
							<div>$40.00 - $80.00</div>
						</div>
					</div>
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="home/product.htm">Xem</a></div>
					</div>
				</div>
			</div>
			
		<!-- end xóa -->
		
	</div>	
	</div>
	
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>