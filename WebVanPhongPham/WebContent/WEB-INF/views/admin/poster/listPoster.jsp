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
		
	<div class="col-9 mbg-azure pt-2">
		<div class="h4 text-uppercase text-center">Danh sách áp phích</div>
		
		<table class="table table-hover mt-3">
		<tr class="table-primary text-center">
			<th class="col-1">Id</th>
			<th class="col-7">Hình ảnh</th>
			<th class="col-2">Tên loại</th>
			<th class="col-2">Đang hoạt động</th>
		</tr>
		<!-- add JSTL -->
		<tr class="table-light text-center">
			<td class="">1</td>
			<td class=""><img src="resources/images/poster/poster2.jpg" style="height: 90px;"></td>
			<td class="">Trái</td>
			<td class="">Có</td>
		</tr>
		<!-- end -->
		
		<!-- xóa từ đây -->
		<tr class="table-light text-center">
			<td class="">2</td>
			<td class=""><img src="resources/images/poster/poster3.jpg" style="height: 90px;"></td>
			<td class="">Trái</td>
			<td class="">Có</td>
		</tr>
		<tr class="table-light text-center">
			<td class="">3</td>
			<td class=""><img src="resources/images/poster/poster4.jpg" style="height: 90px;"></td>
			<td class="">Phải</td>
			<td class="">Có</td>
		</tr>
		<tr class="table-light text-center">
			<td class="">4</td>
			<td class=""><img src="resources/images/poster/poster2.jpg" style="height: 90px;"></td>
			<td class="">Trái</td>
			<td class="">Không</td>
		</tr>
		<!-- tới đây :v -->
		</table>
	
		<div class="text-end" aria-label="Page navigation example">
			<ul class="pagination" style="display: -webkit-inline-box;">
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#"><i class="fas fa-angle-double-left fs-4"></i></a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#"><i class="fas fa-angle-left fs-4"></i></a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#">1</a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#">2</a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#">3</a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#"><i class="fas fa-angle-right fs-4"></i></a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#"><i class="fas fa-angle-double-right fs-4"></i></a></li>
			</ul>
		</div>
	</div>	
</div>
</div>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>