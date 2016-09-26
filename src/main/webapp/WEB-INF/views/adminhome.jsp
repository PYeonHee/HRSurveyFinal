<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.sanhak.hrsurvey.domain.HomeReminderDto"%>
<%@ page import="java.util.List"%>
<html>
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>IBM HR Survey</title>
<meta charset="utf-8">
</head>
<body>

<%@ include file="Header.jsp"%>

   <div class="container-fluid text-center">
      <div class="row content">
         <div class="form-group col-sm-8 text-left">
         
            <table
               style="border: 1px solid #ccc; table-layout: fixed; word-break: break-all;"
               height="auto">
               <colgroup>
                  <col width="15%" />
                  <col width="15%" />
                  <col width="15%" />
                  <col width="15%" />
                  <col width="15%" />
                  <col width="15%" />
               </colgroup>
               <thead style="text-align: center;">
                  <tr>
                     <th scope="col" style="text-align: center;">이름</th>
                     <th scope="col" style="text-align: center;">Survey_YN</th>
                     <th scope="col" style="text-align: center;">입사일</th>
                     <th scope="col" style="text-align: center;">Serial No</th>
                     <th scope="col" style="text-align: center;">SendMail</th>
                  </tr>
               </thead>
               <tbody>
                  <c:choose>
                     <c:when test="${fn:length(showHomeList)> 0}">
                        <c:forEach items="${showHomeList }" var="showHomeList">
                           <tr>
                              <td>${showHomeList.newHireName }</td>
                              <td>${showHomeList.resultCheckNH }</td>
                              <td>${showHomeList.newHireDate }</td>
                              <td>${showHomeList.serialNo }</td>
                              <%-- <td><input type="button" value="메일전송"
                              onclick="window.open('./mailForm?'+'serialNo='
                              +${showHomeList.serialNo}+'&n='+${showHomeList.serialNo }, '메일전송', 'width=200', 'height=150')" /></td> --%>
                              <td><input type="button" value="메일전송"
                                 onclick="window.open('./AddTextMail?type=NH&serialNo=${showHomeList.serialNo}&email=${showHomeList.newHireID }&url=http://localhost/HRSurvey1/HmQuestionKr?serialNo=${showHomeList.serialNo }', '메일전송', 'width=200', 'height=150');" /></td>
                           </tr>
                        </c:forEach>

                        <c:forEach items="${showHomeList }" var="showHomeList">
                           <tr>
                              <td>${showHomeList.hiringManagerName }</td>
                              <td>${showHomeList.resultCheckHM }</td>
                              <td>${showHomeList.newHireDate }</td>
                              <td>${showHomeList.serialNo }</td>
                              <%-- <td><input type="button" value="메일전송"
                              onclick="window.open('./mailForm?'+'serialNo='
                              +${showHomeList.serialNo}+'&n='+${showHomeList.serialNo }, '메일전송', 'width=200', 'height=150')" /></td> --%>
                              <td><input type="button" value="메일전송"
                                 onclick="window.open('./AddTextMail?type=HM&serialNo=${showHomeList.serialNo}&email=${showHomeList.hiringManagerID }&url=http://localhost/HRSurvey1/HmQuestionKr?serialNo=${showHomeList.serialNo }', '메일전송', 'width=200', 'height=150');" /></td>
                           </tr>
                        </c:forEach>


                        <c:forEach items="${showHomeList }" var="showHomeList">
                           <tr>
                              <td>${showHomeList.recruiterName }</td>
                              <td>${showHomeList.resultCheckREC }</td>
                              <td>${showHomeList.newHireDate }</td>
                              <td>${showHomeList.serialNo }</td>
                              <%-- <td><input type="button" value="메일전송"
                              onclick="window.open('./mailForm?'+'serialNo='
                              +${showHomeList.serialNo}+'&n='+${showHomeList.serialNo }, '메일전송', 'width=200', 'height=150')" /></td> --%>
                              <td><input type="button" value="메일전송"
                                 onclick="window.open('./AddTextMail?type=REC&serialNo=${showHomeList.serialNo}&email=${showHomeList.recruiterID }&url=http://localhost/HRSurvey1/HmQuestionKr?serialNo=${showHomeList.serialNo }', '메일전송', 'width=200', 'height=150');" /></td>
                           </tr>
                        </c:forEach>

                     </c:when>
                     <c:otherwise>
                        <tr>
                           <td colspan="6">조회된 결과가 없습니다.</td>
                        </tr>
                     </c:otherwise>
                  </c:choose>
               </tbody>
            </table>

         </div>
         <div class="col-sm-2 sidenav"></div>
      </div>
   </div>

<%@ include file="Footer.jsp"%>



</body>
</html>