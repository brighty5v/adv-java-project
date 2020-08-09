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
	<h2>Search Books</h2>
	<form action="search.jsp" method="post">
	Search<br>
	<input type="text" name="title" val="${param.title}"><br>
	<input type="submit" value="searchbook">
	</form>
    <c:if test="${!empty param.title}">
	<sql:query var="btoree" dataSource="${applicationScope.oracleDataSource}">
      select * from btore
      where instr(upper(title),?)>=1
      order by id 
      <sql:param value="${param.title.toUpperCase()}"></sql:param>
    </sql:query>
    <c:if test="${btoree.rowCount==0 }">
    <h3>No book found</h3>
    </c:if>
    <c:if test="${btoree.rowCount>0 }">
    <h3>book found</h3>
   

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
 </c:if>
    </c:if>
</table>

</body>
</html>