<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Book</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<c:if test="${!empty param.id}">
 <sql:query var="result" dataSource="${applicationScope.oracleDataSource}">
    select * from btore where id=?
    <sql:param value="${param.id}"/>
 </sql:query>
</c:if>	

<%@ include file="header.html"%>
	<h2>Edit Books</h2>
	<form action="updatebook.jsp">
	<input type="hidden" value="${param.id}" name="id">
	Title<br>
	<input type="text" name="title" value="${result.rows[0].title}"><br>
	Author<br>
	<input type="text" name="author" value="${result.rows[0].author}"><br>
	Price<br>
	<input type="number" name="price" value="${result.rows[0].price}"><br><br>
	<input type="submit" value="updatebook">
	</form>

</body>
</html>