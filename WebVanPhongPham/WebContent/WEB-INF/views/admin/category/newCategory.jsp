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
		<div class="h4 text-uppercase text-center">Thêm loại sản phẩm</div>
		<c:if test="${not empty message}">			
		  	<c:choose>
				<c:when test="${message == 0}">
					<div class="col-sm-8 alert alert-danger" role="alert">
					Thêm thất bại!
					<button type="button" class="rem" data-dismiss="alert" aria-label="Close">&times;</button>
					</div>
				</c:when>
				<c:when test="${message == 1}">
					<div class="col-sm-8 alert alert-success" role="alert">
					Thêm thành công!
					<button type="button" class="rem" data-dismiss="alert" aria-label="Close">&times;</button>
					</div>
				</c:when>
				<c:when test="${message == 2}">
					<div class="col-sm-8 alert alert-danger" role="alert">
					Lưu hình ảnh thất bại!
					<button type="button" class="rem" data-dismiss="alert" aria-label="Close">&times;</button>
					</div>
				</c:when>
			</c:choose>		  	
		</c:if>
		
		<form:form action="admin/newCategory.htm" method="post" modelAttribute="category" enctype="multipart/form-data">
			<div class="row my-3">
	    		<label class="col-sm-3 col-form-label text-end">Tên loại sản phẩm: </label>
	    		<div class="col-sm-8">
	      			<form:input path="name" type="text" class="form-control" required="true"/>
	    		</div>
  			</div>
  			
  			<div class="row mb-3">
	    		<label class="col-sm-3 form-label text-end">Hình ảnh:</label>
	    		<div class="col-sm-8">
	    			<input name="file" class="form-control" id="formFileSm" type="file" accept="image/*" onchange="preview()">
	    			<img id="img" class="rounded" src="resources/images/categories/defaul.png"/>
	    		</div>
  			</div>
			
  			<div class="row mb-3">
	    		<label class="col-sm-3 col-form-label text-end">Ghi chú: </label>
	    		<div class="col-sm-8">
	    			<form:input path="note" type="text" class="form-control"/>
	    		</div>
  			</div>
  			
  			<div class="text-center mb-3">
	    		<button type="submit" class="btn btn-primary bg-gradient text-white">Lưu</button>
  			</div>
			
		</form:form>
		
	</div>
		
</div>
</div>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>