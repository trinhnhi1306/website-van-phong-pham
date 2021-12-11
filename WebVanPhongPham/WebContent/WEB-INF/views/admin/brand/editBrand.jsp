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
		<div class="h4 text-uppercase text-center">Hiệu chỉnh thương hiệu</div>
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
		<form:form action="admin/editBrand.htm" method="post" modelAttribute="brand">
			<div class="row my-3">
	    		<label class="col-sm-3 col-form-label text-end">Mã thương hiệu: </label>
	    		<div class="col-sm-8">
	      			<form:input path="brand_id" type="text" class="form-control" readonly="true"/>
	    		</div>
  			</div>
		
			<div class="row my-3">
	    		<label class="col-sm-3 col-form-label text-end">Tên thương hiệu: <label style="color: red;">*</label></label>
	    		<div class="col-sm-8">
	      			<form:input path="name" type="text" class="form-control" required="true"/>
	      			<label class="mb-1">
						<form:errors path="name" cssClass="errors" />
					</label>
	    		</div>
  			</div>
			
  			<div class="row mb-3">
	    		<label class="col-sm-3 col-form-label text-end">Mô tả: </label>
	    		<div class="col-sm-8">
	    			<form:textarea path="description" type="text" class="form-control" rows="3"/>	
	    			<label class="mb-1">
						<form:errors path="description" cssClass="errors" />
					</label> 
	    		</div>
  			</div>
  			
  			<div class="text-center mb-3">
	    		<button type="submit" class="btn btn-primary bg-gradient text-white">Cập nhật</button>
  			</div>
			
		</form:form>
		
	</div>
		
</div>
</div>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>