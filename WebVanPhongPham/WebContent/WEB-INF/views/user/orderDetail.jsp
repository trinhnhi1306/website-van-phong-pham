<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/menu.jsp"%>
	<br>
<div class="container">
<div class="row">
	<div class="col-3">
		<%@include file="/WEB-INF/views/include/menuProfile.jsp"%>
	</div>
		
	<div class="col-9 mbg-azure p-3">
		<div class="row">
			<div class="col">
				<div class="h4 text-uppercase">Chi tiết đơn hàng</div>
			</div>
			<div class="col text-end">
				<!-- Trạng thái của đơn hàng -->
				<div class="text-success text-uppercase">Đang giao</div>
			</div>
		</div>
		<hr>
		<div class="row mb-1">
			<div class="col-5 border-end">
				<div class="h5">Địa chỉ nhận hàng</div>
				<div class="h6">Username</div>
				<div class="text-secondary">Số điện thoại: 0382305835</div>
				<div class="text-secondary fst-italic">Địa chỉ: 581/30A Trường Chinh, Tân Sơn Nhì, Tân Phú, Hồ Chí Minh</div>
			</div>
			<div class="col-3"></div>
			<div class="col-4">
				<div class="d-grid"> 
					<!-- Tùy theo trạng thái mà dùng JSTL để show các nút -->
					<!-- Ví dụ: "Đang giao" thì show nút "Nhận hàng", "Đang duyệt" và "Chuẩn bị" thì "Hủy"-->
					<a class="btn btn-info text-white m-2" href="#" role="button">Nhận được hàng</a>
					<a class="btn text-info border border-info m-2" href="#" role="button">Hủy đơn hàng</a>
				</div>
			</div>
		</div>
		
		<table class="table">
		<thead>
			<tr class="table-primary">
				<th scope="col" class="col-4 fw-bold">Sản phẩm</th>
				<th scope="col" class="col-2 text-secondary">Đơn giá</th>
				<th scope="col" class="col-2 text-secondary">Số lượng</th>
				<th scope="col" class="col-2 text-secondary">Thành tiền</th>
				<th scope="col" class="col-2 text-secondary text-center">Đánh giá</th>
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
				<td class="py-3 text-center">
					<!-- Cái này xuất hiện khi đơn "Đã giao" Dùng JSTL để làm  
					<a class="link-primary" href="user/feedback.htm" role="button"><i class="fas fa-comment-dots"></i></a>
					<!-- Cái này xuất hiện khi đơn trong các trạng thái còn lại  -->
					<i class="fas fa-comment-dots text-muted"></i>
				</td>
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
				<td class="py-3 text-center">
					<a class="link-primary" href="user/feedback.htm" role="button"><i class="fas fa-comment-dots"></i></a>
				</td>
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
				<td class="py-3 text-center">
					<a class="link-primary" href="user/feedback.htm" role="button"><i class="fas fa-comment-dots"></i></a>
				</td>
			</tr>
		</tbody>
		</table>
		
		<div class="row text-end">
			<div class="col-8 border py-2">Tổng tiền hàng</div>
			<div class="col-4 border py-2">144,000 đ</div>
		</div>
		
		<div class="row text-end">
			<div class="col-8 border py-2">Phí vận chuyển</div>
			<div class="col-4 border py-2">20,000 đ</div>
		</div>
		
		<div class="row text-end">
			<div class="col-8 border py-2">Tổng số tiền</div>
			<div class="col-4 border py-2 fw-bold">164,000 đ</div>
		</div>		
	</div>
		
</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>