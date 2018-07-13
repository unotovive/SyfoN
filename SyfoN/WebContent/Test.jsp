<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="org.json.JSONObject" %>
    <%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Map<String,String> map=new HashMap<String,String>();
map.put("zenki1", "Tuesday");
JSONObject jsonTest=new JSONObject(map);
session.setAttribute("jsonTest",jsonTest);
%>
<script>
var jsonTest='<%= session.getAttribute("jsonTest")%>';
jsonTest=JSON.parse(jsonTest);
document.write(jsonTest.zenki1)
</script>
</body>
</html>