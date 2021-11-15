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
				    <th class="col-2">Chỉnh sửa</th>
					<th class="col-1 text-center">Xóa</th>				    
			    </tr>
			</thead>
			<tbody>
			<!-- Sau lại nhét JSLT vào -->
			<c:forEach var="c" items="${cart }">
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
								<a href="home/product.htm?id=${c.products.id }" target="_blank">
									<img src="resources/images/products/${c.products.image }" style="width: 70px; height: 90px;">
								</a>
							</div>
				
							<div class="col py-2">
								<div>${c.products.name }</div>
							</div>
						</div>
					</td>
				    <td class="py-3"><f:formatNumber value="${c.products.price - (c.products.price * c.products.discount / 100) }" type="currency" /></td>
				    <td class="py-3">				    	
	  					<input type="number" value="${c.quantity }" min="1" max="1000" class="form-control" id="quantity-cart-${c.products.id }"/>
					</td>
				    <td class="py-3"><f:formatNumber value="${(c.products.price - (c.products.price * c.products.discount / 100)) * c.quantity}" type="currency" /></td>
				    <td class="text-center py-3 edit-product">
				    	<button id="${c.products.id}" class="edit link-dark" role="button"><i class="fas fa-edit"></i></button>
				    </td>
				    <td class="text-center py-3">
				    	<a class="link-dark" href="user/deleteCart.htm?id=${c.products.id }" role="button"><i class="fas fa-trash-alt"></i></a>
				    </td>
			    </tr>			 
		    </c:forEach>
			</tbody>
			</table>
  		</div>
		
		<div class="col-3">
			<div class="mbg-azure p-2 mb-2"> <!-- Địa chỉ -->
				<div class="fs-6 fw-bold">Giao tới</div>
				<div class="h5 ps-3">${sessionScope.user.lastName } ${sessionScope.user.firstName }</div>
				<div class="text-secondary">Số điện thoại: ${sessionScope.user.phone }</div>
				<div class="text-secondary fst-italic">Địa chỉ: ${sessionScope.user.address.specificAddress }, ${sessionScope.user.address.ward.prefix} ${sessionScope.user.address.ward.name}, ${sessionScope.user.address.ward.district.prefix} ${sessionScope.user.address.ward.district.name}, ${sessionScope.user.address.ward.district.province.name}</div>
			</div>
		
			<div class="mbg-azure p-2 mb-2"> <!-- Giảm giá -->
				<div class="fw-bold">Chưa có chương trình giảm giá</div> <!-- Tiêu đề cho chương trình giảm giá -->
				<div class="fst-italic">Giảm: 0%</div>
			</div>
			
			<div class="mbg-azure p-2 mb-2"> <!-- Bảng giá -->
				<div class="row">
					<div class="col">Tạm tính:</div>
					<div class="col text-end"><f:formatNumber value="${totalMoney }" type="currency" /></div>
				</div>
				<div class="row">
					<div class="col">Giảm giá:</div>
					<div class="col text-end">-0 đ</div>
				</div>
				<hr>
				<div class="row fw-bolder">
					<div class="col">Tổng cộng:</div>
					<div class="col text-end"><f:formatNumber value="${totalMoney }" type="currency" /></div>
				</div>
			</div>
			
			<div class="p-2 d-grid"> <!-- Button -->
				<a class="btn btn-danger bg-gradient" href="home/checkout.htm" role="button">Mua hàng</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
		
</script>
<%@include file="/WEB-INF/views/include/footer.jsp"%>