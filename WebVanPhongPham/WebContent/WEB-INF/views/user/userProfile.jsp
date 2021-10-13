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
		<div class="h4 text-uppercase">Hồ sơ của tôi</div>
		<hr>
		<form action="#" method="post">
			<div class="row">
				<div class="col-8">
					<div class="row my-3">
			    		<label class="col-sm-3 col-form-label text-end">Họ: </label>
			    		<div class="col-sm-9">
			      			<input type="text" class="form-control">
			    		</div>
		  			</div>
		  			
		  			<div class="row my-3">
			    		<label class="col-sm-3 col-form-label text-end">Tên: </label>
			    		<div class="col-sm-9">
			      			<input type="text" class="form-control">
			    		</div>
		  			</div>
			
					<div class="row mb-3">
			    		<label class="col-sm-3 col-form-label text-end">Điện thoại: </label>
			    		<div class="col-sm-9">
			      			<input type="text" class="form-control">
			    		</div>
		  			</div>
	  			
					<div class="row mb-3">
			    		<label class="col-sm-3 col-form-label text-end">Email: </label>
			    		<div class="col-sm-9">
			      			<input type="text" class="form-control">
			    		</div>
		  			</div>
					
					<div class="row mb-3">
			    		<label class="col-sm-3 col-form-label"></label>
			    		<div class="col-sm-9">
			      			<button type="submit" class="btn btn-info text-white">Cập nhật</button>
			    		</div>
		  			</div>
				</div>
				<div class="col-4 border-start text-center">
					<div class="avatar-upload">
        				<div class="avatar-edit">
				            <input type='file' id="imageUpload" accept=".png, .jpg, .jpeg" />
				            <label for="imageUpload" class="pt-2"><i class="fas fa-edit"></i></label>
        				</div>
	        			<div class="avatar-preview">
	        				<img src="resources/images/users/userDefaul.png" id="imagePreview" class="rounded-circle" style="width: 180px; height: 180px;">
	            			
	        			</div>
   		 			</div>
					
				</div>
			</div>
		</form>
	</div>
		
</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>