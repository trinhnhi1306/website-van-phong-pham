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
				<h1>${result }</h1>
				<div class="text-success text-uppercase">${order.status.description}</div>
			</div>
		</div>
		<hr>
		<div class="row mb-1">
			<div class="col-5 border-end">
				<div class="h5">Địa chỉ nhận hàng</div>
				<div class="h6">${sessionScope.user.lastName } ${sessionScope.user.firstName }</div>
				<div class="text-secondary">Số điện thoại: ${sessionScope.user.phone }</div>
				<div class="text-secondary fst-italic">Địa chỉ: ${sessionScope.user.address.specificAddress }, ${sessionScope.user.address.ward.prefix} ${sessionScope.user.address.ward.name}, ${sessionScope.user.address.ward.district.prefix} ${sessionScope.user.address.ward.district.name}, ${sessionScope.user.address.ward.district.province.name}</div>
			</div>
			<div class="col-3">
				<c:choose>
					<c:when test="${order.status.id == 3 }">
						<div class="alert-warning rounded m-1 p-2" role="alert">
							Hãy chắc chắn rằng bạn đã nhận được hàng bạn nhé.
						</div>
					</c:when>
					<c:when test="${order.status.id == 2 }">
						<div class="alert-warning rounded m-1 p-2" role="alert">
							Bạn có thực sự muốn bỏ qua đơn hàng này?
						</div>
					</c:when>
					<c:when test="${order.status.id == 1 }">
						<div class="alert-info rounded m-1 p-2" role="alert">
							Đơn hàng của bạn vẫn đang được chờ xử lý.
						</div>	
					</c:when>
				</c:choose>
			</div>
			<div class="col-4">
				<div class="d-grid"> 
					<!-- Tùy theo trạng thái mà dùng JSTL để show các nút -->
					<!-- Ví dụ: "Đang giao" thì show nút "Nhận hàng", "Đang duyệt" và "Chuẩn bị" thì "Hủy"-->
					<c:choose>
						<c:when test="${order.status.id == 3 }">
							<a class="btn btn-info text-white m-2" href="user/orderDetail/receive.htm?id=${order.id }" role="button">Nhận được hàng</a>
						</c:when>
						<c:when test="${order.status.id == 2 }">
							<a class="btn btn-warning text-white m-2" href="user/orderDetail/cancelRequest.htm?id=${order.id }" role="button">Hủy yêu cầu</a>
						</c:when>
						<c:when test="${order.status.id == 1 }">
							<a class="btn btn-danger text-white m-2" href="user/orderDetail/requestCancel.htm?id=${order.id }" role="button">Yêu cầu hủy đơn</a>
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
				<th scope="col" class="col-2 text-secondary text-center">Đánh giá</th>
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
					<td class="py-3 text-center">
					<!-- icon feedback -->
						<c:choose>
							<c:when test="${order.status.id == 4 }">
								<a class="link-primary" href="user/feedback.htm?productId=${o.products.id}" role="button"><i class="fas fa-comment-dots"></i></a>
							</c:when>
							<c:otherwise>
								<i class="fas fa-comment-dots text-muted"></i>
							</c:otherwise>
						</c:choose>
					</td>
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

<%@include file="/WEB-INF/views/include/footer.jsp"%>