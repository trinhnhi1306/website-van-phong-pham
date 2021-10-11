<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<!-- <link href="./assets/dist/css/bootstrap.min.css" rel="stylesheet">  -->
<link href="<c:url value='resources/assets/dist/css/bootstrap.min.css'/>" rel="stylesheet">
<script type="text/javascript" src="<c:url value='resources/ckeditor/ckeditor.js'/>"></script>
<link href="<c:url value='resources/assets/dist/myCss.css'/>" rel="stylesheet">
<link href="<c:url value='resources/assets/dist/all.css'/>" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


<!-- Custom styles for this template -->
<!-- <link href="./assets/dist/starter-template.css" rel="stylesheet">  -->
<link href="<c:url value='resources/assets/dist/starter-template.css'/>" rel="stylesheet">

</head>
<body>