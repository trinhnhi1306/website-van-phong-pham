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
		<form:form method="post" modelAttribute="user" enctype="multipart/form-data">
			<form:input path="password" type="hidden" class="form-control"/>
  			<form:input path="permission.id" type="hidden" class="form-control"/>
  			<form:input path="address.id" type="hidden" class="form-control"/> 
  			<form:input path="id" type="hidden" class="form-control"/> 
  			<form:input path="status" type="hidden" class="form-control"/> 
  			<form:input path="registrationDate" type="hidden" class="form-control"/> 
  			<form:input path="image" type="hidden" class="form-control"/> 
			<div class="row">
				<div class="col-8">
				
					<div class="row my-3">
			    		<label class="col-sm-3 col-form-label text-end">Tên người dùng: </label>
			    		<div class="col-sm-9">
			      			<form:input path="username" type="text" class="form-control" required="true"/>
			    		</div>
		  			</div>
				
					<div class="row my-3">
			    		<label class="col-sm-3 col-form-label text-end">Họ: </label>
			    		<div class="col-sm-9">
			      			<form:input path="lastName" type="text" class="form-control" required="true"/>
			    		</div>
		  			</div>
		  			
		  			<div class="row my-3">
			    		<label class="col-sm-3 col-form-label text-end">Tên: </label>
			    		<div class="col-sm-9">
			      			<form:input path="firstName" type="text" class="form-control" required="true"/>
			    		</div>
		  			</div>
			
					<div class="row mb-3">
			    		<label class="col-sm-3 col-form-label text-end">Điện thoại: </label>
			    		<div class="col-sm-9">
			      			<form:input path="phone" type="text" class="form-control" required="true"/>
			    		</div>
		  			</div>
	  			
					<div class="row mb-3">
			    		<label class="col-sm-3 col-form-label text-end">Email: </label>
			    		<div class="col-sm-9">
			      			<form:input path="email" type="text" class="form-control" required="true"/>
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
				            <input name="file" type='file' id="imageUpload" accept="image/*" onchange="preview()"/>
				            <label for="imageUpload" class="pt-2"><i class="fas fa-edit"></i></label>
        				</div>
	        			<div class="avatar-preview">
	        				<img id="img" src="resources/images/users/${user.image}" id="imagePreview" class="rounded-circle" style="margin: 0; width: 180px; height: 180px;">
	            			
	        			</div>
   		 			</div>
					
				</div>
			</div>
		</form:form>
	</div>
		
</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>