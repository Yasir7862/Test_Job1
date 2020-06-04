<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Manager Home</title>
        <script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
    </head>
    <body>
    	<div align="center">
	        <h1>Contact List Home Page</h1>
	        <h3><a href="newContact">New Contact</a></h3>
	        <table border="1">
	        	<th>No</th>
	        	<th>DirectoryName</th>
	        	<th>FileName</th>
	        	<th>Status</th>
	        	<th>Date</th>
	        	<th>Action</th>
	        	
				<c:forEach var="contact" items="${listContact}" varStatus="status">
	        	<tr>
	        		<td>${status.index + 1}</td>
					<td>${contact.directoryName}</td>
					<td>${contact.fileName}</td>
					<td>${contact.status}</td>
					<td>${contact.date}</td>
					<td>
						<a href="editContact?id=${contact.id}">Edit</a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="deleteContact?id=${contact.id}">Delete</a>
					</td>							
	        	</tr>
				</c:forEach>	        	
			</table>
			
		</div>		
		<input type="button" id="submit" value="Submit" />
		<h2>Display Json here</h2>
		  <div id="displayDiv" style="display:none"><h3>JSON Data returned from Server after processing</h3>
		<div id="processedData"></div>
		<p>Hello</p>
	</div>
 			<script>
 			jQuery(document).ready(function($) {

 				$("#submit").click(function(){
 					//alert("The paragraph was clicked.");
 					
 					$.ajax({
 						type : "POST",
 						contentType : "application/json",
 						url : "getDefectCount",
 						//data: JSON.stringify( { "first-name": ${status.index + 1}, "last-name": ${contact.directoryName} }),
 						data : JSON.stringify(listContact),
 						dataType : 'json',				
 						success : function(data) {
 							$("#displayDiv").html(result);
 						}
 						});	
 				

 		
			</script>
  </body>
</html>
