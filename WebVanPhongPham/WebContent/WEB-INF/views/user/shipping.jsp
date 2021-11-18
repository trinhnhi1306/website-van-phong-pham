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
		<div class="h5 ps-3">${sessionScope.user.lastName } ${sessionScope.user.firstName }</div>
		<div class="text-secondary">Số điện thoại: ${sessionScope.user.phone }</div>
		<div class="text-secondary fst-italic">Địa chỉ: ${sessionScope.user.address.specificAddress }, ${sessionScope.user.address.ward.prefix} ${sessionScope.user.address.ward.name}, ${sessionScope.user.address.ward.district.prefix} ${sessionScope.user.address.ward.district.name}, ${sessionScope.user.address.ward.district.province.name}</div>
	</div>
	
	<div class="border my-3 p-2 bg-light bg-gradient">
	<h1>${message1 }</h1>
	<h2>${message2 }</h2>
	<div class="h5 text-center">Địa chỉ mới</div>
	<div class="col-6 mbg-azure py-2 px-4 mb-2 m-auto">
		<form:form action="user/shipping.htm" method="post" modelAttribute="address" enctype="multipart/form-data">
			<div class="row mb-3">
	    		<label class="col-sm-4 col-form-label">Điện thoại di động: </label>
	    		<div class="col-sm-8">
	      			<input name="phone" value="${phone }" type="text" class="form-control">
	    		</div>
  			</div>
  			
			<div class="row mb-3">
	    		<label class="col-sm-4 col-form-label">Tỉnh/Thành phố: </label>
	    		<div class="col-sm-8">
	      			<form:select path="ward.district.province.id" class="form-select" aria-label="Default select example">
						<form:options items="${provinces }" itemValue="id" itemLabel="name" />
					</form:select>
	    		</div>
  			</div>
  			
  			<div class="row mb-3">
	    		<label class="col-sm-4 col-form-label">Quận/Huyện: </label>
	    		<div class="col-sm-8">
	      			<form:select path="ward.district.id" class="form-select" aria-label="Default select example">
						<form:options items="${districts }" itemValue="id" itemLabel="name" />
					</form:select>
	    		</div>
  			</div>
  			
  			<div class="row mb-3">
	    		<label class="col-sm-4 col-form-label">Phường/Xã: </label>
	    		<div class="col-sm-8">
	      			<form:select path="ward.id" class="form-select" aria-label="Default select example">
						<form:options items="${wards }" itemValue="id" itemLabel="name" />
					</form:select>
	    		</div>
  			</div>
  			
  			<div class="row mb-3">
	    		<label class="col-sm-4 col-form-label">Địa chỉ: </label>
	    		<div class="col-sm-8">
	    			<form:textarea path="specificAddress" class="form-control" id="exampleFormControlTextarea1" rows="3"></form:textarea>
	    		</div>
  			</div>
			<input name="file" type="file" class="visually-hidden">
			<form:input path="id" type="hidden" class="form-control"/> 
			<div class="text-end">
				<button type="submit" class="btn btn-info text-white">Hoàn Thành</button>
			</div>
		</form:form>
	</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>