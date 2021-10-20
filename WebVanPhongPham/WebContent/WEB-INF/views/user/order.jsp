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
		<div class="h4 text-uppercase">Đơn hàng</div>
		<hr>
		<table class="table table-hover">
			<thead>
				<tr class="table-primary">
					<th scope="col" class="col-2 text-center">Chi tiết</th>
					<th scope="col" class="col-2">Ngày mua</th>
					<th scope="col" class="col-4">Sản phẩm</th>
					<th scope="col" class="col-2">Tổng tiền</th>
					<th scope="col" class="col-2">Trạng thái</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="text-center">
						<a class="link-primary" href="user/orderDetail.htm" role="button"><i class="fas fa-info-circle"></i></a>
					</td>
					<td>11/02/2020</td>
					<td>
						<div>Hộp bút cute</div>
						<div>Hộp bút cute</div>
						<div>Hộp bút cute</div>
						<div>Hộp bút cute</div>
					</td>
					<td>80.000 đ</td>
					<td>Đã giao</td>
				</tr>
				<tr>
					<td class="text-center">
						<a class="link-primary" href="user/orderDetail.htm" role="button"><i class="fas fa-info-circle"></i></a>
					</td>
					<td>11/02/2020</td>
					<td>
						<div>Hộp bút cute</div>
						<div>Hộp bút cute</div>
						<div>Hộp bút cute</div>
						<div>Hộp bút cute</div>
					</td>
					<td>80.000 đ</td>
					<td>Đang giao</td>
				</tr>
			</tbody>
		</table>
	</div>

</div>
</div>	
<%@include file="/WEB-INF/views/include/footer.jsp"%>