<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->
<!-- <script src="./assets/dist/js/bootstrap.bundle.min.js"></script> -->
<script
	src="<c:url value='resources/assets/dist/js/bootstrap.bundle.min.js'/>"></script>

<script>
	var editor = CKEDITOR.replace('messageBody');
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