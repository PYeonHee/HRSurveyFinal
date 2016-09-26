<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.List"%>

<html>
<head>
<title>Saved Successfully!</title>
</head>

<body>
   <div class="container-fluid text-center">
      <div class="row content">
         <div class="col-sm-2 sidenav">
            <p><a href="#"></a></p>
            <p><a href="#"></a></p>
            <p><a href="#"></a></p>
         </div>
         <h3>수정이 완료되었습니다. 수정이 추가적으로 필요합니까?</h3>
         <form id="yes" name="yes" action="" method="post">             
                  <button style="background-color:white;" onclick="opener.parent.location='./hmQAct'; window.close();"><b>YES</b></button>
            </form>
            <form id="no" name="no" action="" method="post">
                  <button style="background-color:white;" onclick="opener.parent.location='./setHistory'; window.close();"><b>NO</b></button>
            </form>
         </div>
         <div class="col-sm-2 sidenav"></div>
      </div>
</body>

</html>