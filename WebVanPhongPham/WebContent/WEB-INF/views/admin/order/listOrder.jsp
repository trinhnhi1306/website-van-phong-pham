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
		<div class="h4 text-uppercase text-center">Danh sách đơn hàng</div>
	
		<div class="row">
			<div class="col-3">
				<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
						action="admin/searchOrder.htm">
					<div class="input-group">
						<input name="searchInput" type="date" class="form-control bg-light border small" aria-label="Search" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-primary" type="submit">
								<i class="fas fa-search fa-sm fs-5 py-1"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
				
			<div class="col-9">
				<ul class="nav nav-pills mb-5 mx-3" id="pills-tab" role="tablist">
					<li class="nav-item mx-2" role="presentation">
						<button class="nav-link ${type == 1 ? 'active' : ''}" id="pills-waiting-tab"
							data-bs-toggle="pill" data-bs-target="#pills-waiting" type="button"
							role="tab" aria-controls="pills-waiting" aria-selected="${type == 1 ? 'true' : 'false'}">Chờ xác nhận</button>
					</li>
					<li class="nav-item mx-2" role="presentation">
						<button class="nav-link ${type == 2 ? 'active' : ''}" id="pills-accept-tab"
							data-bs-toggle="pill" data-bs-target="#pills-accept" type="button"
							role="tab" aria-controls="pills-accept" aria-selected="${type == 2 ? 'true' : 'false'}">Yêu cầu hủy</button>
					</li>
					<li class="nav-item mx-2" role="presentation">
						<button class="nav-link ${type == 3 ? 'active' : ''}" id="pills-shipping-tab"
							data-bs-toggle="pill" data-bs-target="#pills-shipping" type="button"
							role="tab" aria-controls="pills-shipping" aria-selected="${type == 3 ? 'true' : 'false'}">Đang giao</button>
					</li>
					<li class="nav-item mx-2" role="presentation">
						<button class="nav-link ${type == 4 ? 'active' : ''}" id="pills-completed-tab"
							data-bs-toggle="pill" data-bs-target="#pills-completed" type="button"
							role="tab" aria-controls="pills-completed" aria-selected="${type == 4 ? 'true' : 'false'}">Đã giao</button>
					</li>
					<li class="nav-item mx-2" role="presentation">
						<button class="nav-link ${type == 5 ? 'active' : ''}" id="pills-canceled-tab"
							data-bs-toggle="pill" data-bs-target="#pills-canceled" type="button"
							role="tab" aria-controls="pills-canceled" aria-selected="${type == 5 ? 'true' : 'false'}">Đã hủy</button>
					</li>
				</ul>
				
			</div>
		</div>
		
		<div class="tab-content" id="pills-tabContent">
			<div class="tab-pane ${type == 1 ? 'show active' : ''}" id="pills-waiting"	role="tabpanel" aria-labelledby="pills-waiting-tab">Chờ xác nhận
				<!-- Khai báo pagedListHolder1 với param p1 -->
				<jsp:useBean id="pagedListHolder1" scope="request"
					type="org.springframework.beans.support.PagedListHolder" />
				<c:url value="admin/listOrder/1.htm" var="pagedLink">
					<c:param name="p1" value="~" />
				</c:url>
				<table class="table table-hover mt-3">
					<tr class="table-primary text-center">
						<th class="col-1">Chi tiết</th>
						<th class="col-2 text-start">Ngày đặt</th>
						<th class="col-3 text-start">Khách hàng</th>
						<th class="col-2">Tổng tiền</th>
						<th class="col-2">Xử lý</th>
					</tr>
					<!-- add JSTL -->
					<c:forEach var="p1" items="${pagedListHolder1.pageList}">
						<tr class="table-light text-center">
							<td class=""><a href="admin/orderDetail.htm?orderId=${p1.id }"><i class="fas fa-info-circle"></i></a></td>
							<td class="text-start">${p1.date }</td>
							<td class="text-start">${p1.user.lastName } ${p1.user.firstName }</td>
							<td class=""><f:formatNumber value="${p1.totalPrice }" type="currency" /></td>
							<td class="">
								<a class="btn btn-outline-success mt-auto" href="admin/acceptOrder.htm?id=${p1.id }"><i class="fas fa-check-circle"></i></a>
								<a class="btn btn-outline-danger mt-auto" href="admin/denyOrder.htm?id=${p1.id }"><i class="fas fa-times-circle"></i></a>
							</td>
						</tr>	
					</c:forEach>						
				</table>
				<tg:paging pagedListHolder="${pagedListHolder1}" pagedLink="${pagedLink}" />
			</div>
				
			<div class="tab-pane ${type == 2 ? 'show active' : ''}" id="pills-accept" role="tabpanel" aria-labelledby="pills-accept-tab">Yêu cầu hủy
				<!-- Khai báo pagedListHolder2 với param p2 -->
				<jsp:useBean id="pagedListHolder2" scope="request"
					type="org.springframework.beans.support.PagedListHolder" />
				<c:url value="admin/listOrder/2.htm" var="pagedLink">
					<c:param name="p2" value="~" />
				</c:url>
				<table class="table table-hover mt-3">
					<tr class="table-primary text-center">
						<th class="col-1">Chi tiết</th>
						<th class="col-2 text-start">Ngày đặt</th>
						<th class="col-3 text-start">Khách hàng</th>
						<th class="col-2">Tổng tiền</th>
						<th class="col-2">Xử lý</th>
					</tr>
					<!-- add JSTL -->
					<c:forEach var="p2" items="${pagedListHolder2.pageList}">
						<tr class="table-light text-center">
							<td class=""><a href="admin/orderDetail.htm?orderId=${p2.id }"><i class="fas fa-info-circle"></i></a></td>
							<td class="text-start">${p2.date }</td>
							<td class="text-start">${p2.user.lastName } ${p2.user.firstName }</td>
							<td class=""><f:formatNumber value="${p2.totalPrice }" type="currency" /></td>
							<td class="">
								<a class="btn btn-outline-success mt-auto" href="admin/acceptCancel.htm?id=${p2.id }"><i class="fas fa-check-circle"></i></a>
								<a class="btn btn-outline-danger mt-auto" href="admin/denyCancel.htm?id=${p2.id }"><i class="fas fa-times-circle"></i></a>
							</td>
						</tr>	
					</c:forEach>						
				</table>
				<tg:paging pagedListHolder="${pagedListHolder2}" pagedLink="${pagedLink}" />
			</div>
				
				
			<div class="tab-pane ${type == 3 ? 'show active' : ''}" id="pills-shipping" role="tabpanel" aria-labelledby="pills-shipping-tab">Đang giao
				<!-- Khai báo pagedListHolder3 với param p3 -->
				<jsp:useBean id="pagedListHolder3" scope="request"
					type="org.springframework.beans.support.PagedListHolder" />
				<c:url value="admin/listOrder/3.htm" var="pagedLink">
					<c:param name="p3" value="~" />
				</c:url>
				<table class="table table-hover mt-3">
					<tr class="table-primary text-center">
						<th class="col-1">Chi tiết</th>
						<th class="col-2 text-start">Ngày đặt</th>
						<th class="col-3 text-start">Khách hàng</th>
						<th class="col-2">Tổng tiền</th>
						<th class="col-2">Trạng thái</th>
					</tr>
					<!-- add JSTL -->
					<c:forEach var="p3" items="${pagedListHolder3.pageList}">
						<tr class="table-light text-center">
							<td class=""><a href="admin/orderDetail.htm?orderId=${p3.id }"><i class="fas fa-info-circle"></i></a></td>
							<td class="text-start">${p3.date }</td>
							<td class="text-start">${p3.user.lastName } ${p3.user.firstName }</td>
							<td class=""><f:formatNumber value="${p3.totalPrice }" type="currency" /></td>
							<td class="">${p3.status.description }</td>
						</tr>	
					</c:forEach>						
				</table>
				<tg:paging pagedListHolder="${pagedListHolder3}" pagedLink="${pagedLink}" />
			</div>
			
			<div class="tab-pane ${type == 4 ? 'show active' : ''}" id="pills-completed" role="tabpanel" aria-labelledby="pills-completed-tab">Đã giao
				<!-- Khai báo pagedListHolder4 với param p4 -->
				<jsp:useBean id="pagedListHolder4" scope="request"
					type="org.springframework.beans.support.PagedListHolder" />
				<c:url value="admin/listOrder/4.htm" var="pagedLink">
					<c:param name="p4" value="~" />
				</c:url>
				<table class="table table-hover mt-3">
					<tr class="table-primary text-center">
						<th class="col-1">Chi tiết</th>
						<th class="col-2 text-start">Ngày đặt</th>
						<th class="col-3 text-start">Khách hàng</th>
						<th class="col-2">Tổng tiền</th>
						<th class="col-2">Trạng thái</th>
					</tr>
					<!-- add JSTL -->
					<c:forEach var="p4" items="${pagedListHolder4.pageList}">
						<tr class="table-light text-center">
							<td class=""><a href="admin/orderDetail.htm?orderId=${p4.id }"><i class="fas fa-info-circle"></i></a></td>
							<td class="text-start">${p4.date }</td>
							<td class="text-start">${p4.user.lastName } ${p4.user.firstName }</td>
							<td class=""><f:formatNumber value="${p4.totalPrice }" type="currency" /></td>
							<td class="">${p4.status.description }</td>
						</tr>	
					</c:forEach>						
				</table>
				<tg:paging pagedListHolder="${pagedListHolder4}" pagedLink="${pagedLink}" />
			</div>
			
			<div class="tab-pane ${type == 5 ? 'show active' : ''}" id="pills-canceled" role="tabpanel" aria-labelledby="pills-canceled-tab">Đã hủy
				<!-- Khai báo pagedListHolder5 với param p5 -->
				<jsp:useBean id="pagedListHolder5" scope="request"
					type="org.springframework.beans.support.PagedListHolder" />
				<c:url value="admin/listOrder/5.htm" var="pagedLink">
					<c:param name="p5" value="~" />
				</c:url>
				<table class="table table-hover mt-3">
					<tr class="table-primary text-center">
						<th class="col-1">Chi tiết</th>
						<th class="col-2 text-start">Ngày đặt</th>
						<th class="col-3 text-start">Khách hàng</th>
						<th class="col-2">Tổng tiền</th>
						<th class="col-2">Trạng thái</th>
					</tr>
					<!-- add JSTL -->
					<c:forEach var="p5" items="${pagedListHolder5.pageList}">
						<tr class="table-light text-center">
							<td class=""><a href="admin/orderDetail.htm?orderId=${p5.id }"><i class="fas fa-info-circle"></i></a></td>
							<td class="text-start">${p5.date }</td>
							<td class="text-start">${p5.user.lastName } ${p5.user.firstName }</td>
							<td class=""><f:formatNumber value="${p5.totalPrice }" type="currency" /></td>
							<td class="">${p5.status.description }</td>
						</tr>	
					</c:forEach>						
				</table>
				<tg:paging pagedListHolder="${pagedListHolder5}" pagedLink="${pagedLink}" />
			</div>
		</div>
		
	
		<!-- <div class="text-end" aria-label="Page navigation example">
			<ul class="pagination" style="display: -webkit-inline-box;">
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#"><i class="fas fa-angle-double-left fs-4"></i></a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#"><i class="fas fa-angle-left fs-4"></i></a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#">1</a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#">2</a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#">3</a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#"><i class="fas fa-angle-right fs-4"></i></a></li>
				<li class="page-item"><a class="page-link text-primary border border-primary" href="#"><i class="fas fa-angle-double-right fs-4"></i></a></li>
			</ul>
		</div> -->
	</div>	
</div>
</div>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>