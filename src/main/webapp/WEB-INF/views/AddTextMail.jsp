<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sanhak.hrsurvey.domain.SurveyReminderDto"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   <br> <b>serialNO : </b> <input type="text" size="10"
         value="<%=request.getParameter("serialNo")%>"> <br> <br>
         
   <form id="mailing" action="mailSending" method="post">

      <div align="center">
         <!-- 받는 사람 이메일 -->

         <input type="text" name="tomail" size="120" maxlength=""
            style="width: 100%" placeholder="상대의 이메일" class="form-control"
            value="<%=request.getParameter("email")%>">

      </div>

      <div align="center">
         <!-- 내용 -->
         <textarea id="content" name="content" cols="120" rows="12"
            style="width: 100%; resize: none" placeholder="내용#"
            class="form-control"><%=request.getParameter("url")%></textarea>
      </div>
      <p>
      <input type="hidden" id="serialNo" name="serialNo"
         value="<%=request.getParameter("serialNo")%>"> <input type="hidden"
         id="type" name="type" value="<%=request.getParameter("type")%>">
      <div align="center">
         <input type="submit" value="메일 보내기" class="btn btn-warning"
            onclick="document.getElementById('mailing').submit();window.close();" />
      </div>
      
   </form>
</body>
</html>