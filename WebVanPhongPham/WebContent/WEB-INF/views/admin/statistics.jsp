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
			<canvas id="myChart" style="width:100%;max-width:700px"></canvas>			
		</div>
	</div>
</div>
<script>
var barColors = ["red", "green","blue","orange","brown"];
new Chart("myChart", {
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
      text: "World Wide Wine Production 2018"
    }
  }
});
</script>
<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>