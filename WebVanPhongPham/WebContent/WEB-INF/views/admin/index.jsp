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

			<div class="card-group">
				<div class="card">
					<img class="card-img-top" src="resources/images/users/user1.png" width="250" height="260" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Thành viên 1</h5>
						<p class="card-text">Hà Thị Mơ</p>
						<p class="card-text">MSSV: N18DCCN126</p>
						<p class="card-text">Lớp: D18CQCP01-N</p>
					</div>
				</div>
				<div class="card">
					<img class="card-img-top" src="resources/images/users/user1.png" width="250" height="260" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Thành viên 2</h5>
						<p class="card-text">Nguyễn Ngọc Phương Trinh</p>
						<p class="card-text">MSSV: N18DCCN231</p>
						<p class="card-text">Lớp: D18CQCP02-N</p>
					</div>
				</div>
				<div class="card">
					<img class="card-img-top" src="resources/images/users/user1.png" width="250" height="260" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Thành viên 3</h5>
						<p class="card-text">Nguyễn Ngọc Lâm Như</p>
						<p class="card-text">MSSV: N18DCCN144</p>
						<p class="card-text">Lớp: D18CQCP02-N</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>