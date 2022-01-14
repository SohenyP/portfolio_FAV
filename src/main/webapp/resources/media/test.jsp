<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String restChoiceNums = request.getParameter("restChoiceNum");
/* 	int restChoiceNum = Integer.parseInt(restChoiceNums);
 */	
	String restChoices = request.getParameter("restChoice");
/*  	int restChoice = Integer.parseInt(restChoices);
 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=restChoiceNums %></h1>
	<h1><%=restChoices%></h1>
</body>
</html>