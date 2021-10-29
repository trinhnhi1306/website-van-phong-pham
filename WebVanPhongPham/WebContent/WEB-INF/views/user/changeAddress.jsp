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
			<div class="h4 text-uppercase">Chỉnh sửa địa chỉ</div>
			<hr>
			<c:if test="${not empty message}">			
			  	<c:choose>
					<c:when test="${message == 0}">
						<div class="col-sm-8 alert alert-danger" role="alert">
						Cập nhật thất bại!
						<button type="button" class="rem" data-dismiss="alert" aria-label="Close">&times;</button>
						</div>
					</c:when>
					<c:when test="${message == 1}">
						<div class="col-sm-8 alert alert-success alert-dismissible" role="alert">
						Cập nhật thành công!
						<button type="button" class="rem" data-dismiss="alert" aria-label="Close">&times;</button>
						</div>
					</c:when>
					<c:when test="${message == 2}">
						<div class="col-sm-8 alert alert-danger alert-dismissible" role="alert">
						Lưu hình ảnh thất bại!
						<button type="button" class="rem" data-dismiss="alert" aria-label="Close">&times;</button>
						</div>
					</c:when>
				</c:choose>		  	
			</c:if>
			<form:form action="user/changeAddress.htm" method="post" modelAttribute="address">
				<form:input path="id" type="hidden" class="form-control"/> 
				<div class="row mb-3">
					<label class="col-sm-3 col-form-label text-end">Tỉnh/Thành
						phố: </label>
					<div class="col-sm-8">
						<form:select path="ward.district.province.id" class="form-select" aria-label="Default select example">
							<form:options items="${provinces }" itemValue="id" itemLabel="name" />
						</form:select>
					</div>
				</div>

				<div class="row mb-3">
					<label class="col-sm-3 col-form-label text-end">Quận/Huyện:
					</label>
					<div class="col-sm-8">
						<form:select path="ward.district.id" class="form-select" aria-label="Default select example">
							<form:options items="${districts }" itemValue="id" itemLabel="name" />
						</form:select>
					</div>
				</div>

				<div class="row mb-3">
					<label class="col-sm-3 col-form-label text-end">Phường/Xã:
					</label>
					<div class="col-sm-8">
						<form:select path="ward.id" class="form-select" aria-label="Default select example">
							<form:options items="${wards }" itemValue="id" itemLabel="name" />
						</form:select>
					</div>
				</div>

				<div class="row mb-3">
					<label class="col-sm-3 col-form-label text-end">Địa chỉ: </label>
					<div class="col-sm-8">
						<form:textarea path="specificAddress" class="form-control" id="exampleFormControlTextarea1" rows="3"/>
					</div>
				</div>

				<div class="row mb-3">
					<label class="col-sm-3 col-form-label"></label>
					<div class="col-sm-8">
						<button type="submit" class="btn btn-info text-white">Cập nhật</button>
					</div>
				</div>

			</form:form>
		</div>

	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>