<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head></head>
<title>Error Page</title>
<meta charset="utf-8">

<body>

   <%@ include file="ErrorHeader.jsp"%>
   <div class="container-fluid text-center">
      <div class="row content">
         <div class="form-group col-sm-8 text-left"
            style="text-align: center; vertical-align: middle;">
            <h1>Error Page</h1>
            <br> <br> <br> <br> <br>

            <p style="font-size:10pt;color:red;">
               <b>오류 이유 : ${errors}</b>
            </p>
         </div>
         <div class="col-sm-2 sidenav"></div>
      </div>
   </div>

   <%@ include file="Footer.jsp"%>



</body>
</html>