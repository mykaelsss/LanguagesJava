<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<nav>
		<a href="/languages">Dashboard</a>
	</nav>
	<div>
		<p><c:out value="${language.name}"/></p>
		<p><c:out value="${language.creator}"/></p>
		<p><c:out value="${language.version}"/></p>
		<a href="/languages/${language.id}/edit">Edit</a>
		<a href="/languages/${language.id}/delete">Delete</a>
	</div>
</body>
</html>