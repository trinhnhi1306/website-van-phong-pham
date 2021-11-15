<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->
<!-- <script src="./assets/dist/js/bootstrap.bundle.min.js"></script> -->

<script
	src="<c:url value='resources/assets/dist/js/bootstrap.bundle.min.js'/>"></script>
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	/* Chỉnh sửa số lượng của item trong giỏ hàng*/
	function editQuantityCart() {
		
		//alert($('input[name=idProductNeedTake]').val());
		//alert($('input[type=hidden]').val());
		//alert($(':hidden#idProductNeedTake').val());
		//alert($('input:hidden[name=idProductNeedTake]').val());
		var btn = $(this),
        row = btn.parents('td').first();
        itemId = row.find('.idProductNeedTake').val(),
        
      
        console.log(itemId);
		
		var id2 =  $(this).closest('tr').find('input[type="hidden"]').val();
		console.log(id2);
		//var quantity = $("#quantity-cart-" + id).val();
		//alert(id);
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