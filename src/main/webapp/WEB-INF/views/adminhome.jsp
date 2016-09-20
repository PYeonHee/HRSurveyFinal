<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head></head>
<title>IBM HR Survey</title>
<meta charset="utf-8">

<body>

<%@ include file="Header.jsp"%>


	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<form name="mailing" id="mailing" action="mailForm">
               <p>
                  <a href="#" onclick="document.mailing.submit()">email</a>
               </p>
            </form>
				<p>
					<a href="#"></a>
				</p>
				<p>
					<a href="#"></a>
				</p>
			</div>
			<div class="form-group col-sm-8 text-left">
				<h1>User Manual</h1>
				<p>-------------------------------------------------------</p>

			</div>
			<div class="col-sm-2 sidenav"></div>
		</div>
	</div>

<%@ include file="Footer.jsp"%>



</body>
</html>