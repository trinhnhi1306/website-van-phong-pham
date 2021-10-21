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
		
		<form action="admin/newCategory.htm" method="post">
			<div class="row my-3">
	    		<label class="col-sm-3 col-form-label text-end">Tên loại sản phẩm: </label>
	    		<div class="col-sm-8">
	      			<input type="text" class="form-control">
	    		</div>
  			</div>
  			
  			<div class="row mb-3">
	    		<label class="col-sm-3 form-label text-end">Hình ảnh:</label>
	    		<div class="col-sm-8">
	    			<input class="form-control" id="formFileSm" type="file">
	    		</div>
  			</div>
			
  			<div class="row mb-3">
	    		<label class="col-sm-3 col-form-label text-end">Ghi chú: </label>
	    		<div class="col-sm-8">
	    			<input type="text" class="form-control">
	    		</div>
  			</div>
  			
  			<div class="text-center mb-3">
	    		<button type="submit" class="btn btn-primary bg-gradient text-white">Lưu</button>
  			</div>
			
		</form>
		
	</div>
		
</div>
</div>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>