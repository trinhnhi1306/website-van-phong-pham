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
		<!-- Khai báo pagedListHolder với param p -->
		<jsp:useBean id="pagedListHolder" scope="request"
			type="org.springframework.beans.support.PagedListHolder" />
		<c:url value="user/order.htm" var="pagedLink">
			<c:param name="p" value="~" />
		</c:url>
		<div class="h4 text-uppercase">Đơn hàng</div>
		<hr>
		<table class="table table-hover">
			<thead>
				<tr class="table-primary">
					<th scope="col" class="col-1 text-center">Chi tiết</th>
					<th scope="col" class="col-2">Ngày mua</th>
					<th scope="col" class="col-5">Sản phẩm</th>
					<th scope="col" class="col-2">Tổng tiền</th>
					<th scope="col" class="col-2">Trạng thái</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" items="${pagedListHolder.pageList }">
					<tr>
						<td class="text-center">
							<a class="link-primary" href="user/orderDetail.htm?id=${order.id }" role="button"><i class="fas fa-info-circle"></i></a>
						</td>
						<td>${order.date }</td>
						<td>
							<ul>
								<c:forEach var="orderDetail" items="${order.orderDetails }">
									<li>${orderDetail.products.name }</li>
								</c:forEach>
							</ul>
						</td>
						<td>${order.totalPrice }</td>
						<td>${order.status.description }</td>
					</tr>					
				</c:forEach>
			</tbody>
		</table>
		<tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
	</div>

</div>
</div>	
<%@include file="/WEB-INF/views/include/footer.jsp"%>