<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sanhak.hrsurvey.domain.RecResultDto"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rec Result View</title>
</head>
<body>



<h2>Recruiter Survey 목록</h2>
<table style="border:1px solid #ccc">
    <colgroup>
        <col width="2%"/>
        <col width="*"/>
        <col width="3%"/>
        <col width="4%"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col">Serial_No</th>
            <th scope="col">Rec_1</th>
            <th scope="col">Rec_2</th>
            <th scope="col">Rec_3</th>
            <th scope="col">Rec_4</th>
            <th scope="col">Rec_5</th>
            <th scope="col">Rec_6</th>
            <th scope="col">Rec_7</th>
            <th scope="col">Rec_8</th>
            <th scope="col">Rec_9</th>
            <th scope="col">Rec_10</th>
            <th scope="col">Rec_11</th>
            <th scope="col">Rec_12</th>
            <th scope="col">Rec_13</th>
            <th scope="col">Rec_14</th>
            <th scope="col">Rec_15</th>
            <th scope="col">Rec_TEXT1</th>
            <th scope="col">Rec_TEXT2</th>
            <th scope="col">Rec_TEXT3</th>
        </tr>
    </thead>
    
    <tbody>
        <c:choose>
            <c:when test="${fn:length(RecResult) > 0}">
                <c:forEach items="${RecResult }" var="RecResult">
                    <tr>
                        <td>${RecResult.serialNo }</td>
                        <td>${RecResult.REC1 }</td>
                        <td>${RecResult.REC2 }</td>
                        <td>${RecResult.REC3 }</td>
                        <td>${RecResult.REC4 }</td>
                        <td>${RecResult.REC5 }</td>
                        <td>${RecResult.REC6 }</td>
                        <td>${RecResult.REC7 }</td>
                        <td>${RecResult.REC8 }</td>
                        <td>${RecResult.REC9 }</td>
                        <td>${RecResult.REC10 }</td>
                        <td>${RecResult.REC11 }</td>
                        <td>${RecResult.REC12 }</td>
                        <td>${RecResult.REC13 }</td>
                        <td>${RecResult.REC14 }</td>
                        <td>${RecResult.REC15 }</td>
                        <td>${RecResult.REC_TEXT1 }</td>
                        <td>${RecResult.REC_TEXT2 }</td>
                        <td>${RecResult.REC_TEXT3 }</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4">조회된 결과가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
         
    </tbody>
</table>



</body>
</html>