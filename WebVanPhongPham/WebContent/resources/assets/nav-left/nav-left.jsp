<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="a-open" onclick="controlMenu()" cursor="pointer";>&#9776 Click here</div>
	<div class="left-menu" id="div-left-menu">
			<a href="/PTITHCMS1L4" target="_PARENT">Home</a> 
			<a href="/PTITHCMS1L4/lab1.htm" target="_PARENT">Lab1</a> 
			<a href="/PTITHCMS1L4/lab2.htm" target="_PARENT">Lab2</a> 
			<a href="/PTITHCMS1L4/lab3.htm" target="_PARENT">Lab3</a>
			<a href="/PTITHCMS1L4/lab4.htm" target="_PARENT">Lab4</a>
	</div>
</body>
</html>
<script>
	function controlMenu() {

		var menuWidth = document.getElementById('div-left-menu').offsetWidth;
		if (menuWidth > 0) {
			document.getElementById('a-open').innerHTML = "&#9776 Click here";
			document.getElementById("div-left-menu").style.width = "0";
		} else {
			document.getElementById('a-open').innerHTML = "&times";
			document.getElementById("div-left-menu").style.width = "200px";
		}

	}
</script>
<style>
.left-menu {
	width: 0;
	height: 1080px;
	background: #8ED1ED;
	position: fixed;
	overflow-x: hidden;
	transition: 0.5s;
	z-index: 1;
	top: 0;
	left: 0;
}

.left-menu a {
	display: block;
	color: #f1f1f1;
	text-decoration: none;
	font-size: 25px;
	margin-bottom: 20px;
	border-bottom: 1px white solid;
}

.left-menu a:nth-child(1) {
	margin-top: 50px;
}

.left-menu a:hover {
	color: #76ABC1;
}

#a-open {
	z-index: 2;
	position: absolute;
	display: block;
	color: black;
	font-size: 25px;
	cursor: pointer;
}

#a-open:hover {
	color: blue;
}
</style>
</style>