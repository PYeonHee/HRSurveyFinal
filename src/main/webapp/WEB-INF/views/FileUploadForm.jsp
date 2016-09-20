<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>IBM Survey</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%@ include file="Header.jsp"%>
	<h1>File Upload</h1>
	<br />
	<form action="fileUpload" method="post" enctype="multipart/form-data">

		<table>
			<tr>
				<td colspan="2" style="color: red;"><form:errors path="*"
						cssStyle="color : red;" /> ${errors}</td>
			</tr>
			<tr>
				<td>Name :</td>
				<td><input type="file" name="file" /></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="Upload File" /></td>
			</tr>
		</table>
	</form>
	<%@ include file="Footer.jsp"%>
</body>
</html>