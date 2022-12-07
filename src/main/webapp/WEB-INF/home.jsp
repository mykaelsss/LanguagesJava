<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Languages</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>	
<div>
	<table class="table">
		<thead>
			<tr>
				<td>Name</td>			
				<td>Creator</td>			
				<td>Version</td>			
				<td>Action</td>			
			</tr>		
		</thead>
		<tbody>
			<c:forEach var="language" items="${languages}">
				<tr>
					<td><a href="/languages/${language.id}"><c:out value="${language.name}"/></a></td>
					<td><c:out value="${language.creator}"/></td>
					<td><c:out value="${language.version}"/></td>
					<td class="d-flex gap-3">
						<a href="/languages/${language.id}/edit" class="btn btn-primary">edit</a>
						<form action="/languages/${language.id}/delete" method="post">
	    					<input type="hidden" name="_method" value="delete">
	   						<input type="submit" value="Delete" class="btn btn-danger">
   						</form>
					</td>
				</tr>
				
			</c:forEach>
		</tbody>
	</table>
	<form:form action="/languages" method="post" modelAttribute="language" class="form">
		<div>
			<form:errors path="name" />
			<form:errors path="creator" />
			<form:errors path="version" />
		</div>
		<div>
			<form:label path="name">Name:</form:label>
			<form:input path="name" placeholder="" />
		</div>
		<div>	
			<form:label path="creator">Creator:</form:label>
			<form:input path="creator" placeholder="" />
		</div>
		<div>
			<form:label path="version">Version:</form:label>
			<form:input path="version" type="number" step="any"/>
		</div>
		<input type="submit" value="Submit" />
	</form:form>
</div>
</body>
</html>