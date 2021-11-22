<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/menu.jsp"%>
	<br>
	
<div class="container text-center">
	<div class="card mx-auto border-info mbg-azure" style="width: 50rem;">
		<div class="card-body">
			<h5 class="card-title text-success">Đặt hàng thành công!!!</h5>
			<p class="card-text">Cám ơn bạn đã đặt hàng! Shop sẽ xử lý đơn hàng của bạn trong thời gian nhanh nhất có thể!</p>
			<a class="btn btn-outline-primary card-link" href="#" role="button"><i class="fas fa-home"></i> Quay về trang chủ</a>
			<a class="btn btn-outline-primary card-link" href="#" role="button"><i class="fas fa-list-alt"></i> Danh sách đơn hàng</a>
		</div>
	</div>
</div>
<script type="text/javascript">
		
</script>
<%@include file="/WEB-INF/views/include/footer.jsp"%>