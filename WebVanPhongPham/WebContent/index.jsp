<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<html>
<head>
<title>index</title>
</head>
<body>
  <h1>Index</h1>
  <%
    String id = request.getAttribute("id").toString();
    String name = String.valueOf(request.getAttribute("name"));
    String email = request.getAttribute("email").toString();
    out.print("Id: " + id);
    out.print("<br/>Name: " + name);
    out.print("<br/>Email: " + email);
  %>
</body>
</html>