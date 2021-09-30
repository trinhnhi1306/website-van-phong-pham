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