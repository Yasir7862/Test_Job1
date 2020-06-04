<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Spring MVC - Ajax Handling using JQuery</title>
<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script>
	jQuery(document).ready(function($) {

		$("#submit").click(function(){
			var developerData = {};
			developerData["id"] = ${status.index + 1};
			developerData["directorytName"] = contact.directorytName;
			developerData["fileName"] = ${contact.directoryName};
			developerData["statuss"] = ${contact.status};
			developerData["date"] = ${contact.date}
			
			
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "getDefectCount",
				data : JSON.stringify(developerData),
				dataType : 'json',				
				success : function(data) {
					$('#defectCountDiv').show();
									}
			});
		});

	});
</script>	
</head>

<body>
    	<div align="center">
	        <h1>Contact List</h1>
	        <table border="1">
	        	<th>No</th>
	        	<th>DirectoryName</th>
	        	<th>FileName</th>
	        	<th>Status</th>
	        	<th>Date</th>
	        	        	
				<c:forEach var="contact" items="${listContact}" varStatus="status">
	        	<tr>
	        		<td>${status.index + 1}</td>
					<td>${contact.directoryName}</td>
					<td>${contact.fileName}</td>
					<td>${contact.status}</td>
					<td>${contact.date}</td>
												
	        	</tr>
				</c:forEach>	        	
			</table>
		</div>
		
		  <div id="defectCountDiv" style="display:none"><h3>JSON Data returned from Server after processing</h3>
		  
</html>