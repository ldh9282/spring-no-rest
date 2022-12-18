<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Customers</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
</head>
<body>

	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		
		</div>
	
	</div>
	
	<div id="container">
		<div id="content">
				
			<!-- put new button: Add Customer -->
			<button type="button" onclick="location.href='showFormForAdd';" class="add-button">Add Customer</button>
			<!-- add out html table here -->
			
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
					
				</tr>
				
				<c:forEach var="theCustomer" items="${customers}">
					<!-- construct an "update" line with customer id -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${theCustomer.id}"></c:param>
					</c:url>
					<!-- construct an "delete" line with customer id -->
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${theCustomer.id}"></c:param>
					</c:url>
					<tr>
						<td><c:out value="${theCustomer.firstName}"></c:out></td>
						<td><c:out value="${theCustomer.lastName}"></c:out></td>
						<td><c:out value="${theCustomer.email}"></c:out></td>
						<td>
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}" onclick="return confirm('Are you sure you want to delete this customer?');">Delete</a>
						</td>
					</tr>
				
				</c:forEach>
			</table>
		</div>
	
	</div>


</body>
</html>