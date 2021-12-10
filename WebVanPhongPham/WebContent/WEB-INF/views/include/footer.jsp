<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->
<!-- <script src="./assets/dist/js/bootstrap.bundle.min.js"></script> -->
</div>
<footer class="sticky-footer p-3 mb-2 bg-info text-white mt-5">
	<div class="container my-auto">
		<div class="copyright text-center my-auto">
			<span>
				Công ty TNHH MiniStore<br>
		      	Địa chỉ: 96 Man Thiện, Quận 9, Thành phố Hồ Chí Minh<br>
		      	Hotline: (028) 3812 4124<br>
		    	Bản quyền 2021 thuộc về © MiniStore
			</span>
		</div>
	</div>
</footer>
<script src="<c:url value='resources/assets/dist/js/bootstrap.bundle.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='https://code.jquery.com/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'/>"></script>
<script type="text/javascript">
	
	function cartEmpty() {
		alert("Giỏ hàng đang trống!");
		return false;
	}
	
	/* Chỉnh sửa số lượng của item trong giỏ hàng*/
	$(".edit-cart").click(editQuantityCart);
	function editQuantityCart() {
		
		var id = $(this).attr('id');
		var quantity = $("#quantity-cart-" + id).val();
		window.location = "user/editCart.htm?id=" + id + "&quantity="+ quantity;
	}

	/* Phần này là xử lý đóng thông báo */
	$(".rem").click(rem);
	function rem() {
		$(this).parent().remove();
	}	

	/* Hàm này để preview ảnh trước khi load lên server */
	function preview() {
	    img.src=URL.createObjectURL(event.target.files[0]);
	}
	
	/*var editor = CKEDITOR.replace('messageBody'); */
	/* CKFinder.setupCKEditor(ckeditor, '${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js'); */
</script>

</body>
</html>
