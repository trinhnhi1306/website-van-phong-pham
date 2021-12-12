<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/adminMenu.jsp"%>

<div class="container-fluid">
<div class="row">
	<div class="col-3">
		<%@include file="/WEB-INF/views/include/adminTool.jsp"%>
	</div>
		
	<div class="col-9 mbg-azure pt-2">
		<div class="h4 text-uppercase text-center">Thông tin sản phẩm</div>
	
		<div class="row">
			<div class="col-4">
				<img class="rounded border ms-3 mt-3" src="resources/images/products/${product.image}" style="width: 250px; height: 300px;">		
			</div>
					
			<div class="col-8">
				<div class="row my-3">
					<label class="col-sm-3 fw-bold">Tên sản phẩm: </label>
					<div class="col-sm-9">${product.name}</div>
				</div>
			
				<div class="row my-3">
					<label class="col-sm-3 fw-bold">Thể loại: </label>
					<div class="col-sm-9">${product.categories.name}</div>
				</div>
			
				<div class="row my-3">
					<label class="col-sm-3 fw-bold">Thương hiệu: </label>
					<div class="col-sm-9">${product.brands.name}</div>
				</div>
			
				<div class="row my-3">
					<label class="col-sm-3 fw-bold">Đơn giá: </label>
					<div class="col-sm-9"><f:setLocale value="vi_VN"/> <f:formatNumber value="${product.price}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></div>
				</div>
			
				<div class="row my-3">
					<label class="col-sm-3 fw-bold">Quy cách: </label>
					<div class="col-sm-9">${product.specification}</div>
				</div>
			
				<div class="row my-3">
					<label class="col-sm-3 fw-bold">Giảm giá: </label>
					<div class="col-sm-9"><f:formatNumber value="${product.discount}" type="percent"/></div>
				</div>
			
				<div class="row my-3">
					<label class="col-sm-3 fw-bold">Tổng số lượng: </label>
					<div class="col-sm-9">${product.quantity}</div>
				</div>
			
				<div class="row my-3">
					<label class="col-sm-3 fw-bold">Đã bán: </label>
					<div class="col-sm-9">${product.sold_quantity}</div>
				</div>
			</div>
			
		</div>
		
		<div class="card border border-info mx-5 my-3" style="width: 850px;">
			<div class="m-1 px-2 fw-bold">Mô tả:</div> 
			<div class="m-1 px-2">${product.description}</div>
		</div>	
	
		<div class="my-3 me-5 text-end">
			<a class="btn btn-outline-warning" href="admin/editProduct.htm?id=${product.id}" role="button">Chỉnh sửa</a>
			<a class="btn btn-outline-danger" href="admin/deleteProduct.htm?id=${product.id}" onclick="return confirm('Are you sure you want to Remove?');" role="button">Xóa</a>
		</div>
	</div>
		
</div>
</div>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>