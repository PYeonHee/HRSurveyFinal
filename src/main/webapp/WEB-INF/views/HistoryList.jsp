<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Survey Question History List</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.sanhak.hrsurvey.domain.HmQuestionHistory"%>
<%@ page import="java.util.List"%>
<style>
h3, table {
   margin: auto;
}
</style>
</head>
<body>
   <jsp:include page="Header.jsp" flush="true" />
   <br>
   <center>
      <h1>Survey Question Version List</h1>
   </center>
   <table border="1" width="50%" :>
      <colgroup>
         <col width="30%" />
         <col width="70%" />
      </colgroup>
      <thead>
         <tr>
            <th scope="col" style="font-size: 20px; text-align: center;">버전</th>
            <th scope="col" style="font-size: 20px; text-align: center;">수정일</th>
         </tr>
      </thead>
      <tbody>
         <%
            @SuppressWarnings(value = "unchecked")
            List<HmQuestionHistory> dtos = (List<HmQuestionHistory>) request.getAttribute("hmqhist");
            HmQuestionHistory dto = null;
            for (int i = 0; i < dtos.size(); i++) {
               dto = dtos.get(i);
         %>
         <tr>
            <td style="text-align: center;"><%=dto.getVersion()%></td>
            <td style="text-align: center;"><a
               href="showDetailHistory?idx=<%=dto.getVersion()%>"><%=dto.getModDate()%></a></td>
         </tr>
         <%
            }
         %>
      </tbody>
   </table>
   <form class="form-horizontal" method="post"
      action="openContentDetail.do" id="contentDetail">
      <input type="hidden" name="idx" id="idx" value="" />
   </form>

   <!--      <br></br>
         <a href="/wiki/openContentWrite.do" class="btn" id="write"><span>&nbsp;&nbsp;&nbsp;Write&nbsp;&nbsp;&nbsp;</span></a> -->

</body>
</html>