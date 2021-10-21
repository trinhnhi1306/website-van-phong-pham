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
		<div class="h4 text-uppercase text-center">Danh sách loại sản phẩm</div>
	
		<div class="row">
			<div class="col-6">
				<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
						action="admin/searchCategory.htm">
					<div class="input-group">
						<input type="text" class="form-control bg-light border small" placeholder="Tên loại..." aria-label="Search" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-primary" type="button">
								<i class="fas fa-search fa-sm fs-5 py-1"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
				
			<div class="col-6 text-end">
				<a class="btn btn-primary bg-gradient text-uppercase" href="admin/newCategory.htm">
				<i class="fas fa-plus"></i> Thêm loại hàng
				</a>
			</div>
		</div>
		
		
		<table class="table table-hover mt-3">
		<tr class="table-primary text-center">
			<th class="col-2">Danh sách sản phẩm</th>
			<th class="col-2">Hình ảnh</th>
			<th class="col-3 text-start">Tên loại</th>
			<th class="col-2 text-start">Ghi chú</th>
			<th class="col-2">Chỉnh sửa</th>
			<th class="col-1">Xóa</th>
		</tr>
		<!-- add JSTL -->
		<tr class="table-light text-center">
			<td class=""><a href="admin/listProduct.htm"><i class="far fa-list-alt"></i></a></td>
			<td class=""><img class="rounded" src="resources/images/categories/mayTinh.png" style="width: 70px; height: 70px;"></td>
			<td class="text-start">Máy tính</td>
			<td class="text-start"></td>
			<td class=""><a href="admin/editCategory.htm"><i class="fas fa-edit"></i></a></td>
			<td class=""><a href="admin/deleteCategory.htm"><i class="far fa-trash-alt"> </i></a></td>
		</tr>
		<!-- end -->
		
		<!-- xóa từ đây -->
		<tr class="table-light text-center">
			<td class=""><a href="admin/listProduct.htm"><i class="far fa-list-alt"></i></a></td>
			<td class=""><img class="rounded" src="resources/images/categories/mayTinh.png" style="width: 70px; height: 70px;"></td>
			<td class="text-start">Máy tính</td>
			<td class="text-start"></td>
			<td class=""><a href="admin/editCategory.htm"><i class="fas fa-edit"></i></a></td>
			<td class=""><a href="admin/deleteCategory.htm"><i class="far fa-trash-alt"> </i></a></td>
		</tr>
		<tr class="table-light text-center">
			<td class=""><a href="admin/listProduct.htm"><i class="far fa-list-alt"></i></a></td>
			<td class=""><img class="rounded" src="resources/images/categories/mayTinh.png" style="width: 70px; height: 70px;"></td>
			<td class="text-start">Máy tính</td>
			<td class="text-start"></td>
			<td class=""><a href="admin/editCategory.htm"><i class="fas fa-edit"></i></a></td>
			<td class=""><a href="admin/deleteCategory.htm"><i class="far fa-trash-alt"> </i></a></td>
		</tr>
		<tr class="table-light text-center">
			<td class=""><a href="admin/listProduct.htm"><i class="far fa-list-alt"></i></a></td>
			<td class=""><img class="rounded" src="resources/images/categories/mayTinh.png" style="width: 70px; height: 70px;"></td>
			<td class="text-start">Máy tính</td>
			<td class="text-start"></td>
			<td class=""><a href="admin/editCategory.htm"><i class="fas fa-edit"></i></a></td>
			<td class=""><a href="admin/deleteCategory.htm"><i class="far fa-trash-alt"> </i></a></td>
		</tr>
		<tr class="table-light text-center">
			<td class=""><a href="admin/listProduct.htm"><i class="far fa-list-alt"></i></a></td>
			<td class=""><img class="rounded" src="resources/images/categories/mayTinh.png" style="width: 70px; height: 70px;"></td>
			<td class="text-start">Máy tính</td>
			<td class="text-start"></td>
			<td class=""><a href="admin/editCategory.htm"><i class="fas fa-edit"></i></a></td>
			<td class=""><a href="admin/deleteCategory.htm"><i class="far fa-trash-alt"> </i></a></td>
		</tr>
		<!-- tới đây :v -->
		</table>
	
		<div class="text-end" aria-label="Page navigation example">
			<ul class="pagination" style="display: -webkit-inline-box;">
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#"><i class="fas fa-angle-double-left fs-4"></i></a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#"><i class="fas fa-angle-left fs-4"></i></a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#">1</a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#">2</a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#">3</a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#"><i class="fas fa-angle-right fs-4"></i></a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#"><i class="fas fa-angle-double-right fs-4"></i></a></li>
			</ul>
		</div>
	</div>	
</div>
</div>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>