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
		<c:forEach var="poster" items="${list}">
			<tr class="table-light text-center">
				<td class="">${poster.id}</td>
				<td class=""><img src="resources/images/poster/${poster.name}" style="height: 90px;"></td>
				<c:choose>
					<c:when test="${poster.type == 2}"><td class="">Phải</td></c:when>
					<c:when test="${poster.type == 1}"><td class="">Trái</td></c:when>
				</c:choose>
				<c:choose>
					<c:when test="${poster.isActive == true}"><td class="">Có</td></c:when>
					<c:when test="${poster.isActive == false}"><td class="">Không</td></c:when>
				</c:choose>
				
			</tr>
		</c:forEach>
		
		</table>
	
	</div>	
</div>
</div>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>