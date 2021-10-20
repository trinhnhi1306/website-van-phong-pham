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
		<form action="user/feedback.htm" method="post">
			<div class="row">
				<div class="col-auto">
					<img src="resources/images/products/hopbuttim.png" class="rounded" style="width: 70px; height: 90px;">
				</div>
				
				<div class="col">
					<div class="h5">Hộp bút cute</div>
					<div>//Chỗ để rating nhưng chưa biết làm :v</div>
					<textarea class="form-control my-2" rows="5"></textarea>
				</div>
			</div>
		</form>
		
	</div>
		
</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>