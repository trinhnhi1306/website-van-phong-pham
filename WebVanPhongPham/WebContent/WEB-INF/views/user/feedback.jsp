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
		<div class="h4 text-uppercase">Đánh giá sản phẩm</div>
		<hr>
		<form:form action="user/feedback.htm" method="post" modelAttribute="feedback">
		<h1>${result }</h1>
			<div class="row">
				<div class="col-auto">
					<a target="_blank" href="home/product.htm?id=${feedback.product.id }">
						<img src="resources/images/products/${feedback.product.image }" class="rounded" style="width: 70px; height: 90px;">
					</a>
				</div>
				<form:input path="date" type="hidden"/>
				<form:input path="product.id" type="hidden"/>
				<form:input path="user.id" type="hidden"/>
				<form:input path="vote" type="hidden"/>
				<div class="col">
					<div class="h5">${feedback.product.name }</div>
					<!-- <div>//Chỗ để rating nhưng chưa biết làm :v</div> -->
					<form:textarea path="comment" class="form-control my-2" rows="5" required="true"></form:textarea>
				</div>
			</div>
			<c:choose>
				<c:when test="${message == 1 }">
					<div class="text-end">
						<button name="btnEdit" class="btn btn-info text-white">Chỉnh sửa</button>
						<button name="btnDelete" class="btn btn-danger text-white">Xóa</button>
					</div>
				</c:when>				
				<c:otherwise>
					<div class="text-end">
						<button name="btnAdd" class="btn btn-success text-white">Thêm</button>
					</div>
				</c:otherwise>
			</c:choose>			
		</form:form>
		
	</div>
		
</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>