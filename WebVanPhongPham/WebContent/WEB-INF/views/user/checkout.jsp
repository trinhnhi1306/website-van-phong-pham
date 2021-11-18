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
				<a class="btn btn-outline-primary btn-sm" href="user/shipping.htm" role="button">Thay đổi</a>
			</div>
		</div>
		<div class="h5 ps-3">${sessionScope.user.lastName } ${sessionScope.user.firstName }</div>
		<div class="text-secondary">Số điện thoại: ${sessionScope.user.phone }</div>
		<div class="text-secondary fst-italic">Địa chỉ: ${sessionScope.user.address.specificAddress }, ${sessionScope.user.address.ward.prefix} ${sessionScope.user.address.ward.name}, ${sessionScope.user.address.ward.district.prefix} ${sessionScope.user.address.ward.district.name}, ${sessionScope.user.address.ward.district.province.name}</div>
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
			<c:forEach var="c" items="${cart }">
				<tr>
					<td class="py-1">
						<div class="row">
							<div class="col-auto">
								<img src="resources/images/products/${c.products.image }" style="width: 50px; height: 70px;">
							</div>
					
							<div class="col py-2">
								<div>${c.products.name }</div>
							</div>
						</div>
					</td>
					<td class="py-3"><f:formatNumber value="${c.products.price - (c.products.price * c.products.discount / 100) }" type="currency" /></td>
					<td class="py-3">${c.quantity }</td>
					<td class="py-3"><f:formatNumber value="${(c.products.price - (c.products.price * c.products.discount / 100)) * c.quantity}" type="currency" /></td>
				</tr>
			</c:forEach>
			<!-- ////////////////////////////////////////// -->
		</tbody>
		</table>
	</div>
	<form:form modelAttribute="order">
		<div class="row">
			<div class="col-6 ">
				<div class="mbg-azure py-2 px-4 mb-2">
					<div class="fw-bold">Giảm phí vận chuyển:</div> <!-- Ví dụ như nếu mua trên 150k thì giảm 20k, không thì ghi không có :v -->
					<div class="fst-italic">
						<%-- <c:choose>
							<c:when test="${totalMoney > 150000}">
								<f:formatNumber value="20000" type="currency" />
							</c:when>
							<c:otherwise> --%>
								Không có
							<%-- </c:otherwise>				
						</c:choose> --%>
					</div>
				</div>
				<div class="alert alert-warning" role="alert"> <!-- Thêm chơi để dằn mặt mấy thím thích boom hàng :v -->
					Nhấn vào đặt hàng đồng nghĩa với việc bạn đồng ý với các điều khoản của MiniStore và có trách nhiệm với đơn hàng của mình.
				</div> <!-- Copy của Shopee >.o -->
			</div>
			
			<div class="col-6">
				<div class="mbg-azure py-2 px-4 mb-2">
					<div class="row">
						<div class="col">Tổng tiền hàng:</div>
						<div class="col text-end"><f:formatNumber value="${totalMoney }" type="currency" /></div>
					</div>
					<div class="row">
						<div class="col">Phí vận chuyển:</div>
						<div class="col text-end">+<f:formatNumber value="0" type="currency" /></div>
					</div>
					<hr>
					<div class="row fw-bolder">
						<div class="col">Tổng cộng:</div>
						<div class="col text-end"><f:formatNumber value="${totalMoney}" type="currency" /></div>
					</div>
				</div>
				<form:input path="id" type="hidden" class="form-control"/>
				<form:input path="status.id" value="1" type="hidden" class="form-control"/> 
				<form:input path="user.id" value="${user.id }" type="hidden" class="form-control"/> 
				<form:input path="totalPrice" value="${totalMoney}" type="hidden" class="form-control"/> 
				<div class="p-2 d-grid"> <!-- Button -->
					<button type="submit" class="btn btn-danger bg-gradient" >Đặt hàng</button>
				</div>
			</div>
		</div>
	</form:form>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>