<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/menu.jsp"%>
	<br>
<div class="container">
	<div class="h4 text-uppercase">Thanh toán</div>
	
	<div class="mbg-azure py-2 px-4 mb-2">
		<div class="row">
			<div class="col">
				<div class="fw-bold text-primary"><i class="fas fa-map-marker-alt"></i> Địa chỉ nhận hàng</div>
			</div>
			
			<div class="col text-end">
				<a class="btn btn-outline-primary btn-sm" href="home/shipping.htm" role="button">Thay đổi</a>
			</div>
		</div>
		<div class="h5 ps-3">Username</div>
		<div class="text-secondary">Số điện thoại: 0382305835</div>
		<div class="text-secondary fst-italic">Địa chỉ: 581/30A Trường Chinh, Tân Sơn Nhì, Tân Phú, Hồ Chí Minh</div>
	</div>
	
	<div class="mbg-azure py-2 px-4 mb-2">
		<table class="table">
		<thead>
			<tr class="table-primary">
				<th scope="col" class="col-6 fw-bold">Sản phẩm</th>
				<th scope="col" class="col-2 text-secondary">Đơn giá</th>
				<th scope="col" class="col-2 text-secondary">Số lượng</th>
				<th scope="col" class="col-2 text-secondary">Thành tiền</th>
			</tr>
		</thead>
		<tbody>
			<!-- Sau ghép JSTL vào -->
			<tr>
				<td class="py-1">
					<div class="row">
						<div class="col-auto">
							<img src="resources/images/products/hopbuttim.png" style="width: 50px; height: 70px;">
						</div>
				
						<div class="col py-2">
							<div>Hộp bút cute</div>
						</div>
					</div>
				</td>
				<td class="py-3">40.000 đ</td>
				<td class="py-3">1</td>
				<td class="py-3">40.000 đ</td>
			</tr>
			<!-- ////////////////////////////////////////// -->
			<tr>
				<td class="py-1">
					<div class="row">
						<div class="col-auto">
							<img src="resources/images/products/hopbuttim.png" style="width: 50px; height: 70px;">
						</div>
				
						<div class="col py-2">
							<div>Hộp bút cute</div>
						</div>
					</div>
				</td>
				<td class="py-3">40.000 đ</td>
				<td class="py-3">2</td>
				<td class="py-3">80.000 đ</td>
			</tr>
			
			<tr>
				<td class="py-1">
					<div class="row">
						<div class="col-auto">
							<img src="resources/images/products/hopbuttim.png" style="width: 50px; height: 70px;">
						</div>
				
						<div class="col py-2">
							<div>Hộp bút cute</div>
						</div>
					</div>
				</td>
				<td class="py-3">40.000 đ</td>
				<td class="py-3">1</td>
				<td class="py-3">40.000 đ</td>
			</tr>
		</tbody>
		</table>
	</div>
	
	<div class="row">
		<div class="col-6 ">
			<div class="mbg-azure py-2 px-4 mb-2">
				<div class="fw-bold">Giảm phí vận chuyển:</div> <!-- Ví dụ như nếu mua trên 150k thì giảm 20k, không thì ghi không có :v -->
				<div class="fst-italic">Không có</div>	<!-- Ví dụ không giảm -->
			<!--	<div class="fst-italic">Giảm: -20.000 đ</div>  Ví dụ có giảm -->
			</div>
			<div class="alert alert-warning" role="alert"> <!-- Thêm chơi để dằn mặt mấy thím thích boom hàng :v -->
				Nhấn vào đặt hàng đồng nghĩa với việc bạn đồng ý với các điều khoản của MiniStore và có trách nhiệm với đơn hàng của mình.
			</div> <!-- Copy của Shopee >.o -->
		</div>
			
		<div class="col-6">
			<div class="mbg-azure py-2 px-4 mb-2">
				<div class="row">
					<div class="col">Tổng tiền hàng:</div>
					<div class="col text-end">144.000 đ</div>
				</div>
				<div class="row">
					<div class="col">Phí vận chuyển:</div>
					<div class="col text-end">+20.000 đ</div>
				</div>
				<hr>
				<div class="row fw-bolder">
					<div class="col">Tổng cộng:</div>
					<div class="col text-end">164.000 đ</div>
				</div>
			</div>
			
			<div class="p-2 d-grid"> <!-- Button -->
				<a class="btn btn-danger bg-gradient" href="#" role="button">Đặt hàng</a>
			</div>
		</div>
	</div>

</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>