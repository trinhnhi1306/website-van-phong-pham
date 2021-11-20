<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">

<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/menu.jsp"%>
	<br>
	
<div class="container">
	<div class="h4 text-uppercase">Danh mục sản phẩm</div>
	
	<div class="text-center ms-5 ps-5">
	<div class="row">
		<!-- JSTL -->
		<c:forEach var="c" items="${categories }">
			<div class="col-2 py-2 m-2 mbg-azure text-center" >
				<div class="py-2 mb-2" style="height: 125px;">
					<img class="rounded-circle" src="resources/images/categories/${c.image }" style="width: 70px; height: 70px;">
					<div class="fw-bold py-2 my-auto">${c.name }</div>
				</div>
				<div class="py-2">
					<a class="btn btn-outline-primary" href="home/category/product.htm?id=${c.id }" role="button">Xem</a>
				</div>
			</div>
		</c:forEach>	
		
	</div>	
	</div>
	
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>