<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Contact Manager Home</title>
      <script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
</head>
<body>
	<h3>This is ajax.jsp called page</h3> 
	
			    <form:hidden path="id"/>
			
				<form:input path="directoryName" id ="directoryName"/>
			
				
				<form:input path="fileName" id ="fileName"/>
			
				<form:input path="status" id ="status"/>
			
				<form:input path="date" id ="directoryName"/>
			
				<input type="submit" value="Save">
			
		    	
	<div id="displayDiv" style="display:none"><h3>JSON Data returned from Server after processing</h3>
	<div id="processedData"></div>
	</div>
<script>
	jQuery(document).ready(function($) {			
						$.ajax({
						type : "POST",
						contentType : "application/json",
						url : "data",
						data : contactDAO.list(),
						dataType : 'json',				
						success : function(data) {
						$('#processedData').html(JSON.stringify(data));
						$('#displayDiv').show();
				}
			});
		});

	
</script>
	
  </body>
</html>
