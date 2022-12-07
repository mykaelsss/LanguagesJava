<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="p-4">
<a href="/">Delete</a> - <a href="/">Dashboard</a>
<br>
<form:form action="/languages/${language.id}" method="post" modelAttribute="language">
	<input type="hidden" name="_method" value="put">

	<div>
		<form:label path="name">Language Name: </form:label><br />
		<form:errors path="name" class="text-danger"/>
		<form:input path="name"/>
	</div>

	<div>
		<form:label path="creator">Creator: </form:label><br />
		<form:errors path="creator" class="text-danger"/>
		<form:input path="creator"/>
	</div>
	
	<div>
		<form:label path="version">Version: </form:label><br />
		<form:errors path="version" class="text-danger"/>
		<form:input type="double" path="version"/>
	</div>
	
	<div>
		<input class="btn btn-primary" type="submit" value="Submit"/>
	</div>
</form:form>
</body>
</html>