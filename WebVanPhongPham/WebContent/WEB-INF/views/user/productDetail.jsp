<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/menu.jsp"%>
	<br>
	
<div class="container">
	<div class="row">
  		<div class="col-6 text-center">
			<img class="img-product rounded card-img-top mb-5 mb-md-0 border border-info" src="resources/images/products/${product.image }" alt="...">
		</div>
		
  		<div class="col-6">
	  		<div class="mt-5">
	  			<h3 class="fw-bolder">${product.name }</h3>
	  			
	  			<div class="text-muted my-2">Đã bán: ${product.sold_quantity } </div>
	  			
	  			<div class="fs-5 mb-4 mt-4 p-2 mbg-price">
	            	<span class="text-decoration-line-through fs-6 text-muted"><f:formatNumber value="${product.price }" type="currency" /></span>
	            	<span class="fs-3"><f:formatNumber value="${product.price - (product.price * product.discount / 100) }" type="currency" /></span>
	            </div>
            
				<hr>            
            
            	<div class="my-2 fs-5">Số lượng: </div>
            	
            	<div class="btn-group" role="group" aria-label="Basic outlined example">
  					<button type="button" class="btn btn-outline-secondary"><i class="fas fa-minus"></i></button>
  					<button type="button" class="btn btn-outline-secondary px-4">1</button>
  					<button type="button" class="btn btn-outline-secondary"><i class="fas fa-plus"></i></button>
				</div>
				
				<span class="text-muted px-3 my-2 fs-6">${product.quantity - product.sold_quantity } sản phẩm có sẵn </span>
				
				<div class="my-4">
					<button type="button" class="btn btn-outline-info"><i class="fas fa-cart-plus"></i> Thêm vào giỏ hàng</button>
				</div>
            </div>
  		</div>
	</div>
	
	<div class="card border border-info mx-5 my-3" style="width: 65rem;">
		<div class="m-1 p-2 mbg-azure h5">MÔ TẢ SẢN PHẨM</div> <!-- Mấy cái chưa có show ở trên như brand, category... nhét vô đây hết nha  -->
		<div class="m-1 p-2 ">
		<p>Nhãn hàng: ${product.brands.name }</p>
		<p>Thể loại: ${product.categories.name }</p>
		<p>Quy cách: ${product.specification }</p>
		<p>Đơn vị tính: ${product.calculation_unit }</p>
		<p>Mô tả: ${product.description }</p>
		<!-- 🌟 FREE SHIP: Vào giỏ hàng, xem ở ô "Mã giảm giá." Khi nhấn vào ô đó, bạn sẽ tìm thấy mã Miễn phí vận chuyển. Chọn mã Miễn phí vận chuyển và tiến hành đặt hàng để được hỗ trợ từ 20k tiền ship cho đơn hàng 50k.
-----------------------
🍀 Set Tranh Ảnh Decor Vintage 💖 POSTCARD DREAM TRAVERLER Trang Trí Phòng Bàn Học Treo Tường Phụ Kiện Chụp Ảnh Hàn Quốc

📐  Kích thước: 143mm*93mm
🍀 Số lượng: 30 tấm / set (không trùng mẫu)
🍑 Chất liệu: giấy cứng (định lượng 350gsm), mặt ảnh bóng nhẹ 

😍 Hãy làm bừng sáng góc học tập, bàn học, căn phòng của bạn với set Giấy Ảnh Postcard Decor Vintage sáng tạo căng tràn năng lượng này nhé 
💖 Set xịn lắm nha gồm rất nhiều chi tiết có thể decor tất tần tật mọi thứ trên đời nhé từ sổ tay | góc học tập 
💖 Giấy Ảnh Postcard Decor Vintage sử dụng nhiều mục đích khác nhau có thể làm phụ kiện chụp ảnh quay tiktok đến trang trí decor bàn học phòng ngủ treo tường tất tần tật nhé
💖Dễ dàng làm phông nền decor trang trí làm phụ kiện chụp ảnh unbox quay tiktok
💖Trọn bộ Giấy Ảnh Postcard  Decor Vintage dán tường trang trí có rất nhiều mẫu đa dạng, hình in sắc nét, dễ sử dụng và đặc biệt tiết kiệm chi phí rất nhiều so với các phương pháp trang trí không gian khác như giấy dán tường hay vẽ lên tường.
💖 CỰC KỲ SIÊU TIẾT KIỆM nữa nhé mua bộ Giấy Ảnh Decor Vintage này nhiều vậy xài khi nào cho hết nhỉ
Sticker dán tường được dùng để trang trí, làm đẹp nhà cửa, phòng ngủ, phòng làm việc, văn phòng, công ty và các không gian kinh doanh như: trang trí decor shop thời trang, quán cà phê,...

📦 Toàn bộ các món trong shop của Thỏ Bảy Màu là hàng có sẵn - Giao hàng từ 2-3 ngày
💌Các bạn ơy, đừng quên nhấn vào "Xem Shop“ và ”Theo dõi" để khám phá thêm nhiều bé trang trí sổ planner xinh xinh, cực vi diệu, giá cả phải chăng từ Thỏ Bảy Màu nhé.💌
		 -->
		 </div>
	</div>
	
	<div class="card border border-info mx-5 my-3" style="width: 65rem;">
		<div class="m-1 p-2 mbg-azure h5">ĐÁNH GIÁ SẢN PHẨM</div>
		
		<!-- Sau dùng JSTL để xuất -->
		<c:forEach var="s" items="${product.feedback}">
			<div class="mx-5 my-2 p-2 border-bottom">
				<div class="row">
					<div class="col-auto">
						<img src="resources/images/users/user1.png" class="rounded-circle" style="width: 50px; height: 50px;">
					</div>
					
					<div class="col">
						<div class="h6">${s.user.firstName } ${s.user.lastName }</div>
						<div>${s.date }</div>
						<div>
							<c:choose>
								<c:when test="${s.vote == 1}">
									<i class="fas fa-star"></i>
								</c:when>
								<c:when test="${s.vote == 2}">
									<i class="fas fa-star"></i><i class="fas fa-star"></i>
								</c:when>
								<c:when test="${s.vote == 3}">
									<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
								</c:when>
								<c:when test="${s.vote == 4}">
									<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
								</c:when>
								<c:when test="${s.vote == 5}">
									<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
								</c:when>
							</c:choose>
						</div>
						<div>${s.comment }</div>						
					</div>
				</div>
			</div>
		</c:forEach>
		<!--  -->
		<!-- 
		<div class="mx-5 my-2 p-2 border-bottom">
			<div class="row">
				<div class="col-auto">
					<img src="resources/images/users/userDefaul.png" class="rounded-circle" style="width: 50px; height: 50px;">
				</div>
				
				<div class="col">
					<div class="h6">Username</div>
					<div>//Chỗ để rating nhưng chưa biết làm :v</div>
					<div>Sản phẩm cute phô mai que *tym*</div>
				</div>
			</div>
		</div>

		<div class="mx-5 my-2 p-2"> 
			<div class="text-end" aria-label="Page navigation example">
				<ul class="pagination" style="display: -webkit-inline-box;">
					<li class="page-item"><a class="page-link text-info border border-info" href="#"><i class="fas fa-angle-left fs-4"></i></a></li>
					<li class="page-item"><a class="page-link text-info border border-info" href="#">1</a></li>
					<li class="page-item"><a class="page-link text-info border border-info" href="#">2</a></li>
					<li class="page-item"><a class="page-link text-info border border-info" href="#">3</a></li>
					<li class="page-item"><a class="page-link text-info border border-info" href="#"><i class="fas fa-angle-right fs-4"></i></a></li>
				</ul>
			</div>
		</div> -->
		
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>