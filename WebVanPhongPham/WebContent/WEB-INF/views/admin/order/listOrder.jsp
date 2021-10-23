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
		<div class="h4 text-uppercase text-center">Danh sách đơn hàng</div>
	
		<div class="row">
			<div class="col-6">
				<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
						action="admin/searchOrder.htm">
					<div class="input-group">
						<input type="date" class="form-control bg-light border small" aria-label="Search" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-primary" type="button">
								<i class="fas fa-search fa-sm fs-5 py-1"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
				
			<div class="col-6">
				<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
						action="admin/searchOrder.htm">
					<div>Trạng thái của đơn hàng: </div>
					<div class="row">
					<div class="col-4 form-check">
						<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
						<label class="form-check-label" for="flexRadioDefault1">Tất cả</label>
					</div>
					<div class="col-4 form-check">
						<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >
						<label class="form-check-label" for="flexRadioDefault2">Chờ xử lý</label>
					</div>
					<div class="col-4 form-check">
						<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >
						<label class="form-check-label" for="flexRadioDefault2">Nhận đơn</label>
					</div>
					<div class="col-4 form-check">
						<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >
						<label class="form-check-label" for="flexRadioDefault2">Đang giao</label>
					</div>
					<div class="col-4 form-check">
						<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >
						<label class="form-check-label" for="flexRadioDefault2">Đã giao</label>
					</div>
					<div class="col-4 form-check">
						<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >
						<label class="form-check-label" for="flexRadioDefault2">Hủy đơn</label>
					</div>
					</div>
				</form>
			</div>
		</div>
		
		
		<table class="table table-hover mt-3">
		<tr class="table-primary text-center">
			<th class="col-1">Chi tiết</th>
			<th class="col-2 text-start">Ngày đặt</th>
			<th class="col-3 text-start">Khách hàng</th>
			<th class="col-2">Đơn giá</th>
			<th class="col-2">Trạng thái</th>
		</tr>
		<!-- add JSTL -->
		<tr class="table-light text-center">
			<td class=""><a href="admin/orderDetail.htm"><i class="fas fa-info-circle"></i></a></td>
			<td class="text-start">11/02/2021</td>
			<td class="text-start">Nguyễn Ngọc Lâm Như</td>
			<td class="">140.000 đ</td>
			<td class="">Chờ xử lý</td>
		</tr>
		<!-- end -->
		
		<!-- xóa từ đây -->
		<tr class="table-light text-center">
			<td class=""><a href="admin/orderDetail.htm"><i class="fas fa-info-circle"></i></a></td>
			<td class="text-start">11/02/2021</td>
			<td class="text-start">Nguyễn Ngọc Lâm Như</td>
			<td class="">140.000 đ</td>
			<td class="">Đã hủy</td>
		</tr>
		<tr class="table-light text-center">
			<td class=""><a href="admin/orderDetail.htm"><i class="fas fa-info-circle"></i></a></td>
			<td class="text-start">11/02/2021</td>
			<td class="text-start">Nguyễn Ngọc Lâm Như</td>
			<td class="">140.000 đ</td>
			<td class="">Đang giao</td>
		</tr>
		<tr class="table-light text-center">
			<td class=""><a href="admin/orderDetail.htm"><i class="fas fa-info-circle"></i></a></td>
			<td class="text-start">11/02/2021</td>
			<td class="text-start">Nguyễn Ngọc Lâm Như</td>
			<td class="">140.000 đ</td>
			<td class="">Chờ xử lý</td>
		</tr>
		<tr class="table-light text-center">
			<td class=""><a href="admin/orderDetail.htm"><i class="fas fa-info-circle"></i></a></td>
			<td class="text-start">11/02/2021</td>
			<td class="text-start">Nguyễn Ngọc Lâm Như</td>
			<td class="">140.000 đ</td>
			<td class="">Nhận đơn</td>
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