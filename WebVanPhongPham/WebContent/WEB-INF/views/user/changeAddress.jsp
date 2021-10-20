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
		<form action="user/changeAddress.htm" method="post">
			<div class="row my-3">
	    		<label class="col-sm-3 col-form-label text-end">Họ: </label>
	    		<div class="col-sm-8">
	      			<input type="text" class="form-control">
	    		</div>
  			</div>
  			
  			<div class="row my-3">
	    		<label class="col-sm-3 col-form-label text-end">Tên: </label>
	    		<div class="col-sm-8">
	      			<input type="text" class="form-control">
	    		</div>
  			</div>
			
			<div class="row mb-3">
	    		<label class="col-sm-3 col-form-label text-end">Điện thoại di động: </label>
	    		<div class="col-sm-8">
	      			<input type="text" class="form-control">
	    		</div>
  			</div>
  			
			<div class="row mb-3">
	    		<label class="col-sm-3 col-form-label text-end">Tỉnh/Thành phố: </label>
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
	    		<label class="col-sm-3 col-form-label text-end">Quận/Huyện: </label>
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
	    		<label class="col-sm-3 col-form-label text-end">Phường/Xã: </label>
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
	    		<label class="col-sm-3 col-form-label text-end">Địa chỉ: </label>
	    		<div class="col-sm-8">
	    			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
	    		</div>
  			</div>
  			
  			<div class="row mb-3">
	    		<label class="col-sm-3 col-form-label"></label>
	    		<div class="col-sm-8">
	    			<button type="submit" class="btn btn-info text-white">Cập nhật</button>
	    		</div>
  			</div>
			
		</form>
	</div>
		
</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>