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
		
		<c:if test="${not empty message}">			
		  	<c:choose>
				<c:when test="${message == 0}">
					<div class="col-sm-8 alert alert-danger" role="alert">
					Xóa thất bại!
					<button type="button" class="rem" data-dismiss="alert" aria-label="Close">&times;</button>
					</div>
				</c:when>
				<c:when test="${message == 1}">
					<div class="col-sm-8 alert alert-success alert-dismissible" role="alert">
					Xóa thành công!
					<button type="button" class="rem" data-dismiss="alert" aria-label="Close">&times;</button>
					</div>
				</c:when>
			</c:choose>		  	
		</c:if>
		
		<div class="row">
			<div class="col-sm-8">
				<table class="table table-hover mt-3 me-4">
					<tr class="table-primary text-center">
						<th class="col-1">Gỡ</th>
						<th class="col-11">Áp phích trái</th>
					</tr>
				
					<c:forEach var="lPoster" items="${leftPoster}">
						<tr class="table-light text-center">
							<td class=""><a href="admin/undisplayPoster.htm?id=${lPoster.id}"><i class="far fa-trash-alt"> </i></a></td>
							<td class=""><img src="resources/images/poster/${lPoster.name}" style="height: 90px;"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<div class="col-sm-4">
				<table class="table table-hover mt-3 me-4">
					<tr class="table-primary text-center">
						<th class="col-1">Đổi</th>
						<th class="col-11">Áp phích phải</th>
					</tr>
					<c:if test="${empty rightPoster}">
						<tr class="table-light text-center">
							<td class=""><a href="admin/changeRightPoster.htm?id=4"><i class="fas fa-edit"></i></a></td>
							<td class=""><img src="resources/images/poster/defaul.png" style="height: 90px;"></td>
						</tr>
					</c:if>
					<c:forEach var="rPoster" items="${rightPoster}">
						<tr class="table-light text-center">
							<td class=""><a href="admin/changeRightPoster.htm?id=${rPoster.id}"><i class="fas fa-edit"></i></a></td>
							<td class=""><img src="resources/images/poster/${rPoster.name}" style="height: 90px;"></td>
						</tr>
					</c:forEach>
				</table>
				
				<div class="p-2 d-grid"> <!-- Button -->
					<a class="btn btn-primary bg-gradient my-1" href="admin/newLeftPoster.htm" role="button">Thêm Áp phích trái</a>
					<a class="btn btn-primary bg-gradient my-1" href="admin/listPoster.htm" role="button">Danh sách Áp phích</a>
				</div>
			</div>
		</div>
	</div>	
</div>
</div>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>