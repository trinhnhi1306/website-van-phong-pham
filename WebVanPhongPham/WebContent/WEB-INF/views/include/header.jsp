<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.80.0">
<title>Môn Lập Trình Web Spring MVC - PTITHCM</title>

<base href="${pageContext.servletContext.contextPath}/">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/starter-template/">

<!-- Bootstrap core CSS -->
<!-- <link href="./assets/dist/css/bootstrap.min.css" rel="stylesheet">  -->
<link href="<c:url value='resources/assets/dist/css/bootstrap.min.css'/>" rel="stylesheet">
<script src="<c:url value='resources/assets/dist/js/bootstrap.min.js'/>"></script>
<%-- <script type="text/javascript" src="<c:url value='resources/ckeditor/ckeditor.js'/>"></script> --%>
<link href="<c:url value='resources/assets/dist/myCss.css'/>" rel="stylesheet">
<link href="<c:url value='resources/assets/dist/main.css'/>" rel="stylesheet">
<link href="<c:url value='resources/assets/dist/ImageUpload.css'/>" rel="stylesheet">
<!-- Font Awesome -->
<!-- <link href="<c:url value='resources/assets/dist/all.css'/>" rel="stylesheet"> -->
<link href="<c:url value='resources/assets/dist/fontawesome.min.css'/>" rel="stylesheet"/> 
<link rel="stylesheet" href="<c:url value='resources/assets/dist/all.min.css'/>" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<style>

a.disabled {
  pointer-events: none;
  cursor: default;
}

.alert {
    margin-left: 16rem;
}
.rem {
	position: absolute;
    right: 5px;
    font-size: 2rem;
    top: 0px;
    opacity: 0.6;
}
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}
form img {
	margin: 2rem;
	width: 200px;
	height: 200px;
}
@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

<script>
	function ConfirmDelete() {
     	if (confirm("Are you sure you want to delete?")) {
    	  	return true;
      	} else {
    	  	return false;
      	}
    }
</script>

<!-- Custom styles for this template -->
<!-- <link href="./assets/dist/starter-template.css" rel="stylesheet">  -->
<link href="<c:url value='resources/assets/dist/starter-template.css'/>" rel="stylesheet">

</head>
<body>