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
		<div class="h4 text-uppercase text-center">Quản lý áp phích</div>
		
		<div class="row">
			<div class="col-sm-8">
				<table class="table table-hover mt-3 me-4">
					<tr class="table-primary text-center">
						<th class="col-1">Gỡ</th>
						<th class="col-11">Áp phích trái</th>
					</tr>
					<!-- add JSTL -->
					<tr class="table-light text-center">
						<td class=""><a href="./deletePoster"><i class="far fa-trash-alt"> </i></a></td>
						<td class=""><img src="resources/images/poster/poster2.jpg" style="height: 90px;"></td>
					</tr>
					<!-- end -->
					
					<!-- xóa từ đây -->
					<tr class="table-light text-center">
						<td class=""><a href="./deletePoster"><i class="far fa-trash-alt"> </i></a></td>
						<td class=""><img src="resources/images/poster/poster2.jpg" style="height: 90px;"></td>
					</tr>
					<tr class="table-light text-center">
						<td class=""><a href="./deletePoster"><i class="far fa-trash-alt"> </i></a></td>
						<td class=""><img src="resources/images/poster/poster2.jpg" style="height: 90px;"></td>
					</tr>
					<tr class="table-light text-center">
						<td class=""><a href="./deletePoster"><i class="far fa-trash-alt"> </i></a></td>
						<td class=""><img src="resources/images/poster/poster2.jpg" style="height: 90px;"></td>
					</tr>
					<!-- tới đây :v -->
				</table>
			</div>
			
			<div class="col-sm-4">
				<table class="table table-hover mt-3 me-4">
					<tr class="table-primary text-center">
						<th class="col-1">Gỡ</th>
						<th class="col-11">Áp phích phải</th>
					</tr>
					<!-- add JSTL -->
					<tr class="table-light text-center">
						<td class=""><a href="./deletePoster"><i class="far fa-trash-alt"> </i></a></td>
						<td class=""><img src="resources/images/poster/poster4.jpg" style="height: 90px;"></td>
					</tr>
					<!-- end -->
				</table>
				
				<div class="p-2 d-grid"> <!-- Button -->
					<a class="btn btn-primary bg-gradient my-1" href="admin/newPoster.htm" role="button">Thêm Áp phích</a>
					<a class="btn btn-primary bg-gradient my-1" href="admin/listPoster.htm" role="button">Danh sách Áp phích</a>
				</div>
			</div>
		</div>
	</div>	
</div>
</div>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>