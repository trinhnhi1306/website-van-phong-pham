<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<html>
<head>
<title>index</title>
</head>
<body>
  <h1>Index</h1>
  <%
    String id = request.getAttribute("idGoogle").toString();
    String picture = String.valueOf(request.getAttribute("pictureGoogle"));
    String email = request.getAttribute("emailGoogle").toString();
    out.print("Id: " + id);
    out.print("<br/>Email: " + email);
  %>
  <img alt="" src="${pictureGoogle }">
  <form action="register1.htm" method="post">
	  <input name="email" value="${emailGoogle }">
	  <input name="picture" value="${pictureGoogle }">
	  <button type="submit">Đăng nhập</button>
  </form>
</body>
</html>