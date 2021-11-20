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
			<ul class="nav nav-pills mb-5 mx-3" id="pills-tab" role="tablist">
			<li class="nav-item mx-4" role="presentation">
				<button class="nav-link active" id="pills-waiting-tab"
					data-bs-toggle="pill" data-bs-target="#pills-waiting" type="button"
					role="tab" aria-controls="pills-waiting" aria-selected="true">Chờ xác nhận</button>
			</li>
			<li class="nav-item mx-4" role="presentation">
				<button class="nav-link" id="pills-accept-tab"
					data-bs-toggle="pill" data-bs-target="#pills-accept" type="button"
					role="tab" aria-controls="pills-accept" aria-selected="false">Chờ lấy hàng</button>
			</li>
			<li class="nav-item mx-4" role="presentation">
				<button class="nav-link" id="pills-shipping-tab"
					data-bs-toggle="pill" data-bs-target="#pills-shipping" type="button"
					role="tab" aria-controls="pills-shipping" aria-selected="false">Đang giao</button>
			</li>
			<li class="nav-item mx-4" role="presentation">
				<button class="nav-link" id="pills-completed-tab"
					data-bs-toggle="pill" data-bs-target="#pills-completed" type="button"
					role="tab" aria-controls="pills-completed" aria-selected="false">Đã giao</button>
			</li>
			<li class="nav-item mx-4" role="presentation">
				<button class="nav-link" id="pills-canceled-tab"
					data-bs-toggle="pill" data-bs-target="#pills-canceled" type="button"
					role="tab" aria-controls="pills-canceled" aria-selected="false">Đã hủy</button>
			</li>
		</ul>
		<div class="tab-content" id="pills-tabContent">
			<div class="tab-pane fade show active" id="pills-waiting"
				role="tabpanel" aria-labelledby="pills-waiting-tab">Chờ xác nhận
				
			</div>
				
			<div class="tab-pane fade" id="pills-accept" role="tabpanel"
				aria-labelledby="pills-accept-tab">Chờ lấy hàng
			</div>
				
				
			<div class="tab-pane fade" id="pills-shipping" role="tabpanel"
				aria-labelledby="pills-shipping-tab">Đang giao
				
			</div>
			
			<div class="tab-pane fade" id="pills-completed" role="tabpanel"
				aria-labelledby="pills-completed-tab">Đã giao
				
			</div>
			
			<div class="tab-pane fade" id="pills-canceled" role="tabpanel"
				aria-labelledby="pills-canceled-tab">Đang hủy
				
			</div>
		</div>


			
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