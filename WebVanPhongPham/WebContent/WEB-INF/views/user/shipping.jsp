<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/menu.jsp"%>
	<br>
	
<div class="container">
	<div class="h4 text-uppercase">Địa chỉ giao hàng</div>
	
	<div class="col-6 border-ship border-success px-3 pb-1 bg-light bg-gradient">
		<div class="text-end text-success sizemenu">Mặc định</div>
		<div class="h5 ps-3">Username</div>
		<div class="text-secondary">Số điện thoại: 0382305835</div>
		<div class="text-secondary fst-italic">Địa chỉ: 581/30A Trường Chinh, Tân Sơn Nhì, Tân Phú, Hồ Chí Minh</div>
	</div>
	
	<div class="border my-3 p-2 bg-light bg-gradient">
	<div class="h5 text-center">Địa chỉ mới</div>
	<div class="col-6 mbg-azure py-2 px-4 mb-2 m-auto">
		<form action="home/checkout.htm" method="post">
			<div class="row my-3">
	    		<label class="col-sm-4 col-form-label">Họ tên: </label>
	    		<div class="col-sm-8">
	      			<input type="text" class="form-control">
	    		</div>
  			</div>
			
			<div class="row mb-3">
	    		<label class="col-sm-4 col-form-label">Điện thoại di động: </label>
	    		<div class="col-sm-8">
	      			<input type="text" class="form-control">
	    		</div>
  			</div>
  			
			<div class="row mb-3">
	    		<label class="col-sm-4 col-form-label">Tỉnh/Thành phố: </label>
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
	    		<label class="col-sm-4 col-form-label">Quận/Huyện: </label>
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
	    		<label class="col-sm-4 col-form-label">Phường/Xã: </label>
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
	    		<label class="col-sm-4 col-form-label">Địa chỉ: </label>
	    		<div class="col-sm-8">
	    			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
	    		</div>
  			</div>
			
			<div class="text-end">
				<button type="submit" class="btn btn-info text-white">Hoàn Thành</button>
			</div>
		</form>
	</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>