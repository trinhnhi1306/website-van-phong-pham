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
		<div class="h4 text-uppercase text-center">Cập nhật sản phẩm</div>
		
		<form action="admin/editProduct.htm" method="post">
			<div class="row my-3">
	    		<label class="col-sm-3 col-form-label text-end">Mã sản phẩm: </label>
	    		<div class="col-sm-8">
	      			<input type="text" class="form-control" disabled>
	    		</div>
  			</div>
		
			<div class="row my-3">
	    		<label class="col-sm-3 col-form-label text-end">Tên sản phẩm: </label>
	    		<div class="col-sm-8">
	      			<input type="text" class="form-control">
	    		</div>
  			</div>
			
			<div class="row mb-3">
	    		<label class="col-sm-3 col-form-label text-end">Loại sản phẩm: </label>
	    		<div class="col-sm-8">
	      			<select class="form-select" aria-label="Default select example">
						<option selected>Open this select menu</option>
						<option value="1">One</option>
						<option value="2">Two</option>
						<option value="3">Three</option>
					</select>
	    		</div>
  			</div>
  			
			<div class="row mb-3">
	    		<label class="col-sm-3 col-form-label text-end">Thương hiệu: </label>
	    		<div class="col-sm-8">
	      			<select class="form-select" aria-label="Default select example">
						<option selected>Open this select menu</option>
						<option value="1">One</option>
						<option value="2">Two</option>
						<option value="3">Three</option>
					</select>
	    		</div>
  			</div>
  		
  			<div class="row my-3">
	    		<label class="col-sm-3 col-form-label text-end">Đơn giá: </label>
	    		<div class="col-sm-8">
	    			<div class="input-group">
	    				<input type="text" class="form-control">
	      				<span class="input-group-text">đ</span>
	    			</div>
	    		</div>
  			</div>
  			
  			<div class="row my-3">
	    		<label class="col-sm-3 col-form-label text-end">Quy cách: </label>
	    		<div class="col-sm-8">
	      			<input type="text" class="form-control">
	    		</div>
  			</div>
  			
  			<div class="row my-3">
	    		<label class="col-sm-3 col-form-label text-end">Số lượng thêm vào: </label>
	    		<div class="col-sm-8">
	      			<input type="text" class="form-control">
	    		</div>
  			</div>
  			
  			<div class="row my-3">
	    		<label class="col-sm-3 col-form-label text-end">Giảm giá: </label>
	    		<div class="col-sm-8">
	    			<div class="input-group">
	    				<input type="text" class="form-control">
	      				<span class="input-group-text">%</span>
	    			</div>
	    		</div>
  			</div>
  			
  			<div class="row mb-3">
	    		<label class="col-sm-3 form-label text-end">Hình ảnh:</label>
	    		<div class="col-sm-8">
	    			<input class="form-control" id="formFileSm" type="file">
	    		</div>
  			</div>
  			
  			<div class="row mb-3">
	    		<label class="col-sm-3 col-form-label text-end">Mô tả: </label>
	    		<div class="col-sm-8">
	    			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
	    		</div>
  			</div>
  			
  			<div class="text-center mb-3">
	    		<button type="submit" class="btn btn-primary bg-gradient text-white">Cập nhật</button>
  			</div>
			
		</form>
		
	</div>
		
</div>
</div>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>