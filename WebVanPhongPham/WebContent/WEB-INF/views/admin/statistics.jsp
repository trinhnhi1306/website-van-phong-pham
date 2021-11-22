<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/adminMenu.jsp"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-3">
			<%@include file="/WEB-INF/views/include/adminTool.jsp"%>
		</div>
		
		<div class="col-9 mbg-azure pt-2">
			<div class="h4 text-uppercase text-center">Thống kê số liệu</div>
			<canvas id="myChart1" style="width:100%;max-width:700px"></canvas>
			<canvas id="myChart2" style="width:100%;max-width:700px"></canvas>	
			<canvas id="myChart3" style="width:100%;max-width:700px"></canvas>	
		</div>		
	</div>
</div>
<script>
var barColors = ["red", "green","blue","orange","brown"];
new Chart("myChart1", {
	  type: "pie",
	  data: {
	    labels: ["Chờ xử lý", "Yêu cầu hủy", "Đang giao", "Đã giao", "Đã hủy"],
	    datasets: [{
	      backgroundColor: barColors,
	      data: [<c:forEach var="item" items="${orderStatistics}">${item.value},</c:forEach>]
	    }]
	  },
	  options: {
	    title: {
	      display: true,
	      text: "Phân loại đơn hàng"
	    }
	  }
	});

new Chart("myChart2", {
	  type: "bar",
	  data: {
	    labels: [<c:forEach var="item" items="${listOrder}">'${item.name}',</c:forEach>],
	    datasets: [{
	      backgroundColor: "orange",
	      data: [<c:forEach var="item" items="${listOrder}">${item.value},</c:forEach>]
	    }]
	  },
	  options: {
		legend: {display: false},
	    title: {
	      display: true,
	      text: "Số lượng đơn hàng trong tuần qua"
	    }
	  }
	});
	
new Chart("myChart3", {
	  type: "line",
	  data: {
	    labels: [<c:forEach var="item" items="${reportUser}">'${item.name}',</c:forEach>],
	    datasets: [{
	    	fill: false,
	        lineTension: 0,
	        backgroundColor: "rgba(0,0,255,1.0)",
	        borderColor: "rgba(0,0,255,0.1)",
	      	data: [<c:forEach var="item" items="${reportUser}">${item.value},</c:forEach>]
	    }]
	  },
	  options: {
		legend: {display: false},
	    title: {
	      display: true,
	      text: "Khách hàng đăng ký tài khoản trong tuần qua"
	    }
	  }
	});
</script>
<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>