<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Livewire book store</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<%@ include file="header.html"%>
	<h2>Add Books</h2>

	<sql:query var="btoree" dataSource="${applicationScope.oracleDataSource}">
      select * from btore
      order by id 
    </sql:query>

<table width="100%" border="1px solid">
<tr>
<th>title</th>
<th>author</th>
<th>price</th>
<th>edit/delete</th>

</tr>

<c:forEach var="book" items="${btoree.rows}">
<tr>
<td>${book.title}</td>
<td>${book.author}</td>
<td>${book.price}</td>
<td>
<a href="editbook.jsp?id=${book.id}">Edit</a>
&nbsp;
<a href="deletebook.jsp?id=${book.id}">Delete</a>
</td>
</tr>
</c:forEach>

</table>
</body>
</html>