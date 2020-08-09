<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Book</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<%@ include file="header.html"%>
	<h2>Add Books</h2>
	<form action="addbook.jsp" method="post">
	Title<br>
	<input type="text" name="title" val="${param.title}"><br>
	Author<br>
	<input type="text" name="author" val="${param.author}"><br>
	Price<br>
	<input type="number" name="price" val="${param.price}"><br><br>
	<input type="submit" value="addbook">
	</form>
<c:if test="${!empty param.title}">
<sql:update dataSource="${applicationScope.oracleDataSource}" var="count">
 insert into btore values(bookdt_id_seq.nextval,?,?,?)
 <sql:param value="${param.title}"/>
 <sql:param value="${param.author}"/>
 <sql:param value="${param.price}"/>
</sql:update>

<c:if test="${count>0}">
<h1>${param.title} Successfully Added</h1>
</c:if>

<c:if test="${count==0}">
<h1>[${param.title}] Error</h1>
</c:if>
<c:redirect url="listbooks.jsp">

</c:redirect>
</c:if>	

</body>
</html>