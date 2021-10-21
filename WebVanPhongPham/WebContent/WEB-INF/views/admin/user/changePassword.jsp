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
		<div class="h4 text-uppercase text-center">Đổi mật khẩu</div>
		
		<form action="admin/myProfile/changePassword.htm" method="post">
			<div class="row my-3">
	    		<label class="col-sm-3 col-form-label text-end">Mật khẩu hiện tại: </label>
	    		<div class="col-sm-8 pe-5">
	      			<input type="text" class="form-control">
	    		</div>
  			</div>
			
			<div class="row mb-3">
	    		<label class="col-sm-3 col-form-label text-end">Mật khẩu mới: </label>
	    		<div class="col-sm-8 pe-5">
	      			<input type="text" class="form-control">
	    		</div>
  			</div>
  			
  			<!-- Cái này bắt chước shopee, nhưng nếu phức tạp thì bỏ cũng được :v -->
  			<div class="row mb-3">
	    		<label class="col-sm-3 col-form-label text-end">Xác nhận mật khẩu: </label>
	    		<div class="col-sm-8 pe-5">
	      			<input type="text" class="form-control">
	    		</div>
  			</div>
			
			<div class="text-center">
				<button type="submit" class="btn btn-primary bg-gradient text-white">Cập nhật</button>
			</div>
		</form>
	</div>
		
</div>
</div>

<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>