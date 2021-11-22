<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/adminMenu.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-3">
			<%@include file="/WEB-INF/views/include/adminTool.jsp"%>
		</div>

		<div class="col-9 mbg-azure pt-2">
			<jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder" />

			<c:url value="admin/listProduct.htm" var="pagedLink">
				<c:param name="p" value="~" />
			</c:url>

			<div class="h4 text-uppercase text-center">Danh sách sản phẩm</div>

			<c:if test="${not empty message}">			
				<c:choose>
					<c:when test="${message == 0}">
						<div class="col-sm-8 alert alert-danger" role="alert">
							Xóa thất bại (sản phẩm đã được bán)!
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
				<div class="col-6">
					<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" action="admin/searchProduct.htm">
						<div class="input-group">
							<input name="searchInput" type="search" class="form-control bg-light border small" placeholder="Tên sản phẩm..." aria-label="Search" aria-describedby="basic-addon2">
							
							<div class="input-group-append">
								<button name="btnsearch" class="btn btn-outline-primary" type="submit">
									<i class="fas fa-search fa-sm fs-5 py-1"></i>
								</button>
							</div>
						</div>
					</form>
				</div>

				<div class="col-6 text-end">
					<a class="btn btn-primary bg-gradient text-uppercase" href="admin/newProduct.htm"> <i class="fas fa-plus"></i> Thêm sản phẩm</a>
				</div>

				<div>
					<tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}"/>
				</div>
			</div>

			<table class="table table-hover mt-3">
				<thead>
					<tr class="table-primary text-center">
						<th class="col-1">Chi tiết</th>
						<th class="col-2">Hình ảnh</th>
						<th class="col-3">Tên sản phẩm</th>
						<th class="col-2">Đơn giá</th>
						<th class="col-2">Số lượng tồn</th>
						<th class="col-1">Chỉnh sửa</th>
						<th class="col-1">Xóa</th>
					</tr>
				</thead>
				
				<tbody>
					<!-- add JSTL -->
					<c:forEach var="s" items="${pagedListHolder.pageList}">
						<tr class="table-light text-center">
							<td class=""><a href="admin/detailProduct.htm?id=${s.id}"><i class="fas fa-info-circle"></i></a></td>
							<td class=""><img src="resources/images/products/${s.image}" style="width: 70px; height: 90px;"></td>
							<td class="text-start">${s.name}</td>
							<td class=""> <f:setLocale value="vi_VN"/> <f:formatNumber value="${s.price}" type="currency"/></td>
							<td class="">${s.quantity - s.sold_quantity}</td>
							<td class=""><a href="admin/editProduct.htm?id=${s.id}"><i class="fas fa-edit"></i></a></td>
							<td class=""><a href="admin/deleteProduct.htm?id=${s.id}" onclick="return confirm('Are you sure you want to Remove?');"><i class="far fa-trash-alt"> </i></a></td>
						</tr>
					</c:forEach>
				</tbody>
				<!-- end -->
			</table>

			<tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}"/>
		</div>
	</div>
</div>

<script>
	function searchValue() {
		var searchProductname = $("#searchInput").val();
		alert(searchProductname)
	}
</script>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>