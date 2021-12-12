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

	<div class="col-9 mbg-azure p-3">
		<div class="row">
			<div class="col">
				<div class="h4 text-uppercase">Chi tiết đơn hàng</div>
			</div>
			<div class="col text-end">
				<!-- Trạng thái của đơn hàng -->
				<div class="text-success text-uppercase">${order.status.description}</div>
			</div>
		</div>
		<hr>
		<div class="row mb-1">
			<div class="col-5 border-end">
				<div class="h5">Địa chỉ nhận hàng</div>
				<div class="h6">${order.user.lastName } ${order.user.firstName }</div>
				<div class="text-secondary">Số điện thoại: ${order.user.phone }</div>
				<div class="text-secondary fst-italic">Địa chỉ: ${order.user.address.specificAddress }, ${order.user.address.ward.prefix} ${order.user.address.ward.name}, ${order.user.address.ward.district.prefix} ${order.user.address.ward.district.name}, ${order.user.address.ward.district.province.name}</div>
			</div>
			<div class="col-3"></div>
			<div class="col-4">
				<div class="d-grid"> 
					<!-- Tùy theo trạng thái mà dùng JSTL để show các nút -->
					<!-- Ví dụ: "Đang giao" thì show nút "Nhận hàng", "Đang duyệt" và "Chuẩn bị" thì "Hủy"-->
					<c:choose>
						<c:when test="${order.status.id == 1 }">
							<a class="btn btn-outline-success mt-auto" href="admin/acceptOrder.htm?id=${order.id }">Chấp nhận</a>
							<a class="btn btn-outline-danger mt-auto" href="admin/denyOrder.htm?id=${order.id }">Từ chối</a>
						</c:when>
						<c:when test="${order.status.id == 2 }">
							<a class="btn btn-outline-success mt-auto" href="admin/acceptCancel.htm?id=${order.id }">Chấp nhận</a>
							<a class="btn btn-outline-danger mt-auto" href="admin/denyCancel.htm?id=${order.id }">Từ chối</a>
						</c:when>
					</c:choose>
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
			</tr>
		</thead>
		<tbody>
			<c:forEach var="o" items="${orderDetail }">
				<tr>
					<td class="py-1">
						<div class="row">
							<div class="col-auto">
								<a target="_blank" href="home/product.htm?id=${o.products.id }">
									<img src="resources/images/products/${o.products.image }" style="width: 50px; height: 70px;">
								</a>
							</div>
					
							<div class="col py-2">
								<div>${o.products.name}</div>
							</div>
						</div>
					</td>
					<td class="py-3"><f:formatNumber value="${o.item_price}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></td>
					<td class="py-3">${o.quantity}</td>
					<td class="py-3"><f:formatNumber value="${o.item_price * o.quantity}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></td>					
				</tr>		
			</c:forEach>	
		</tbody>
		</table>
		
		<div class="row text-end">
			<div class="col-8 border py-2">Tổng tiền hàng</div>
			<div class="col-4 border py-2"><f:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></div>
		</div>
		
		<div class="row text-end">
			<div class="col-8 border py-2">Phí vận chuyển</div>
			<div class="col-4 border py-2"><f:formatNumber value="0" type="currency" currencySymbol="đ" maxFractionDigits="0"/></div>
		</div>
		
		<div class="row text-end">
			<div class="col-8 border py-2">Tổng số tiền</div>
			<div class="col-4 border py-2 fw-bold"><f:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></div>
		</div>		
	</div>	
</div>
</div>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>