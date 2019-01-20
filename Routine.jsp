<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "ChestRoutine">
		<input type = "submit" value = "제출">
	</form>
	<ul>
		<%ArrayList<String> arr = (ArrayList<String>)session.getAttribute("arr");
		if (arr==null){%>
			<li><h1>없다</h1></li>
		<%} else { 
		for (int i = 0; i<arr.size(); i++) {%>
			<li><%=arr.get(i) %></li>
		<%}}%>	
		
		
		
	
	</ul>
</body>
</html>