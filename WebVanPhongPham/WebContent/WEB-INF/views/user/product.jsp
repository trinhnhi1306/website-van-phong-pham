<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">

<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/menu.jsp"%>
	<br>
	
<div class="container">
	<div class="h4 text-uppercase">Danh mục sản phẩm</div>
	<!-- Khai báo pagedListHolder với param p -->
	<jsp:useBean id="pagedListHolder" scope="request"
		type="org.springframework.beans.support.PagedListHolder" />
	<c:url value="home.htm" var="pagedLink">
		<c:param name="p" value="~" />
	</c:url>
	<!--  -->
	<div class="text-center ms-5 ps-5">
	<div class="row">
		<!-- JSTL -->
		<c:forEach var="s" items="${pagedListHolder.pageList}">
			<div class="col-3 mb-5">
				<div class="card h-100">
					<img class="card-img-top" src="resources/images/products/${s.image }" style="height: 250px;">
					<div class="card-body p-4">
						<div class="text-center">
							<h5 class="fw-bolder">${s.name }</h5>
							<div><f:formatNumber value="${s.price }" type="currency" currencySymbol="đ" maxFractionDigits="0"/></div>
						</div>
					</div>
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<!-- <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="home/product.htm">Xem</a></div> -->
						<div class="text-center">
							<!-- <a class="btn btn-outline-info mt-auto" data-toggle="modal" href="#ignismyModal">Xem chi tiết</a> -->
							<a class="btn btn-outline-dark mt-auto" href="home/product.htm?id=${s.id }">Xem chi tiết</a>
							<c:choose>
								<c:when test="${s.quantity > s.sold_quantity }">
									<a class="btn btn-outline-success mt-auto" href="user/addCart.htm?id=${s.id }"><i class="fas fa-cart-plus fs-4"></i></a>
								</c:when>
								<c:otherwise>
									<a class="btn btn-danger"><i class="fas fa-cart-plus fs-4"></i></a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>	
	</div>
	
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>