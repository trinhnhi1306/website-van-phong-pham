<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/menu.jsp"%>
	<br>
	
<div class="container">
	<div class="h4 text-uppercase">Giỏ hàng</div>

	<div class="row">
  		<div class="col-9 mbg-azure py-2">
  			<table class="table mb-0">
			<thead>
			    <tr class="table-primary">
					<th scope="col" class="col-1">
				    	<div class="input-group-prepend">
	    					<div class="checkbox py-1 px-3">
	      						<input type="checkbox" aria-label="Checkbox for following text input">
	    					</div>
	  					</div>
	  				</th>
				    <th scope="col" class="col-4">Sản phẩm</th>
				    <th scope="col" class="col-2">Đơn giá</th>
				    <th scope="col" class="col-2">Số lượng</th>
				    <th scope="col" class="col-2">Số tiền</th>
				    <th scope="col" class="text-center col-1"><i class="fas fa-trash-alt"></i></th>
			    </tr>
			</thead>
			<tbody>
			<!-- Sau lại nhét JSLT vào -->
			    <tr>
				    <th scope="col" class="col-1">
						<div class="input-group-prepend">
				    		<div class="checkbox py-1 px-3">
				      			<input type="checkbox" aria-label="Checkbox for following text input">
				    		</div>
			  			</div>
		  			</th>
				    <td class="py-1">
						<div class="row">
							<div class="col-auto">
								<img src="resources/images/products/hopbuttim.png" style="width: 70px; height: 90px;">
							</div>
				
							<div class="col py-2">
								<div>Hộp bút cute</div>
							</div>
						</div>
					</td>
				    <td class="py-3">40.000 đ</td>
				    <td class="py-3">
				    	<div class="btn-group btn-group-sm" role="group" aria-label="Basic outlined example">
		  					<button type="button" class="btn btn-outline-secondary"><i class="fas fa-minus"></i></button>
		  					<button type="button" class="btn btn-outline-secondary">1</button>
		  					<button type="button" class="btn btn-outline-secondary"><i class="fas fa-plus"></i></button>
						</div>
				    </td>
				    <td class="py-3">40.000 đ</td>
				    <td class="text-center py-3">
				    	<a class="link-dark" href="home/cart.htm" role="button"><i class="fas fa-trash-alt"></i></a>
				    </td>
			    </tr>
			 <!-- /////////////// -->
			    <tr>
				    <th scope="col" class="col-1">
						<div class="input-group-prepend">
				    		<div class="checkbox py-1 px-3">
				      			<input type="checkbox" aria-label="Checkbox for following text input">
				    		</div>
			  			</div>
		  			</th>
				    <td class="py-1">
						<div class="row">
							<div class="col-auto">
								<img src="resources/images/products/hopbuttim.png" style="width: 70px; height: 90px;">
							</div>
				
							<div class="col py-2">
								<div>Hộp bút cute</div>
							</div>
						</div>
					</td>
				    <td class="py-3">40.000 đ</td>
				    <td class="py-3">
				    	<div class="btn-group btn-group-sm" role="group" aria-label="Basic outlined example">
		  					<button type="button" class="btn btn-outline-secondary"><i class="fas fa-minus"></i></button>
		  					<button type="button" class="btn btn-outline-secondary">2</button>
		  					<button type="button" class="btn btn-outline-secondary"><i class="fas fa-plus"></i></button>
						</div>
				    </td>
				    <td class="py-3">80.000 đ</td>
				    <td class="text-center py-3">
				    	<a class="link-dark" href="home/cart.htm" role="button"><i class="fas fa-trash-alt"></i></a>
				    </td>
			    </tr>
			    <tr>
				    <th scope="col" class="col-1">
						<div class="input-group-prepend">
				    		<div class="checkbox py-1 px-3">
				      			<input type="checkbox" aria-label="Checkbox for following text input">
				    		</div>
			  			</div>
		  			</th>
				    <td class="py-1">
						<div class="row">
							<div class="col-auto">
								<img src="resources/images/products/hopbuttim.png" style="width: 70px; height: 90px;">
							</div>
				
							<div class="col py-2">
								<div>Hộp bút cute</div>
							</div>
						</div>
					</td>
				    <td class="py-3">40.000 đ</td>
				    <td class="py-3">
				    	<div class="btn-group btn-group-sm" role="group" aria-label="Basic outlined example">
		  					<button type="button" class="btn btn-outline-secondary"><i class="fas fa-minus"></i></button>
		  					<button type="button" class="btn btn-outline-secondary">1</button>
		  					<button type="button" class="btn btn-outline-secondary"><i class="fas fa-plus"></i></button>
						</div>
				    </td>
				    <td class="py-3">40.000 đ</td>
				    <td class="text-center py-3">
				    	<a class="link-dark" href="home/cart.htm" role="button"><i class="fas fa-trash-alt"></i></a>
				    </td>
			    </tr>
			</tbody>
			</table>
  		</div>
		
		<div class="col-3">
			<div class="mbg-azure p-2 mb-2"> <!-- Địa chỉ -->
				<div class="fs-6 fw-bold">Giao tới</div>
				<div class="h5 ps-3">Username</div>
				<div class="text-secondary">Số điện thoại: 0382305835</div>
				<div class="text-secondary fst-italic">Địa chỉ: 581/30A Trường Chinh, Tân Sơn Nhì, Tân Phú, Hồ Chí Minh</div>
			</div>
		
			<div class="mbg-azure p-2 mb-2"> <!-- Giảm giá -->
				<div class="fw-bold">Mừng giáng sinh 2021</div> <!-- Tiêu đề cho chương trình giảm giá -->
				<div class="fst-italic">Giảm: 10%</div>
			</div>
			
			<div class="mbg-azure p-2 mb-2"> <!-- Bảng giá -->
				<div class="row">
					<div class="col">Tạm tính:</div>
					<div class="col text-end">160.000 đ</div>
				</div>
				<div class="row">
					<div class="col">Giảm giá:</div>
					<div class="col text-end">-16.000 đ</div>
				</div>
				<hr>
				<div class="row fw-bolder">
					<div class="col">Tổng cộng:</div>
					<div class="col text-end">144.000 đ</div>
				</div>
			</div>
			
			<div class="p-2 d-grid"> <!-- Button -->
				<a class="btn btn-danger bg-gradient" href="home/checkout.htm" role="button">Mua hàng</a>
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>