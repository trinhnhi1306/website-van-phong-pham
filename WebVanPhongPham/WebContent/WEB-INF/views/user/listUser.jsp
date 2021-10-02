<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>

<style>
.main_div {
	width: 900px; 
	
	text-align: center;
	margin: 0;
	padding: 5px;
	border: 1px dotted orangered;
	border-radius: 5px;
	display: inline-block;
}

img {
	width: 220px;
	height: 200px;
}

.iframe-nav {
	height: 100%;
	width: 200px;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 1;
}

@keyframes leftTo{
	0%{
		opacity: 0;
		transform: translate(400%, 0);
	}
	100%{
		opacity: 1;
		transform: translate(0, 0);
	}
}
	.div-animation{
        animation-name: leftTo;
        animation-duration: 1s;
        animation-fill-mode: both;
    }
    .firstDiv{
        animation-delay: 0.5s;
        display : inline-block;
        margin: 0 10px 0 0;
    }
    .secondDiv{
        animation-delay: 1s;
        display : inline-block;
        margin: 0 10px 0 0;
    }
    .thirdDiv{
        animation-delay: 1.5s;
        display : inline-block;
        margin: 0 10px 0 0;
    }
</style>
<%@include file="/WEB-INF/views/include/menu.jsp"%>


<main class="container  ">
	<div class="row justify-content-md-center">

		<div class="d-flex justify-content-center mt-4">

			<div class="div-animation firstDiv text-center">
				<h1>WELCOME TO MY BLOG</h1>
		</div>



	</div>




</main>

<%@include file="/WEB-INF/views/include/footer.jsp"%>



