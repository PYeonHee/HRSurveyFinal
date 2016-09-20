<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sanhak.hrsurvey.domain.HmResultDto"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hm Result View</title>
</head>
<body>



<h2>Hire Manager Survey 목록</h2>
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
            <th scope="col">HM_1</th>
            <th scope="col">HM_2</th>
            <th scope="col">HM_3</th>
            <th scope="col">HM_4</th>
            <th scope="col">HM_5</th>
            <th scope="col">HM_6</th>
            <th scope="col">HM_7</th>
            <th scope="col">HM_8</th>
            <th scope="col">HM_9</th>
            <th scope="col">HM_10</th>
            <th scope="col">HM_11</th>
            <th scope="col">HM_12</th>
            <th scope="col">HM_13</th>
            <th scope="col">HM_14</th>
            <th scope="col">HM_15</th>
            <th scope="col">HM_TEXT1</th>
            <th scope="col">HM_TEXT2</th>
            <th scope="col">HM_TEXT3</th>
        </tr>
    </thead>
    
    <tbody>
        <c:choose>
            <c:when test="${fn:length(HmResult) > 0}">
                <c:forEach items="${HmResult }" var="HmResult">
                    <tr>
                        <td>${HmResult.serialNo }</td>
                        <td>${HmResult.HM1 }</td>
                        <td>${HmResult.HM2 }</td>
                        <td>${HmResult.HM3 }</td>
                        <td>${HmResult.HM4 }</td>
                        <td>${HmResult.HM5 }</td>
                        <td>${HmResult.HM6 }</td>
                        <td>${HmResult.HM7 }</td>
                        <td>${HmResult.HM8 }</td>
                        <td>${HmResult.HM9 }</td>
                        <td>${HmResult.HM10 }</td>
                        <td>${HmResult.HM11 }</td>
                        <td>${HmResult.HM12 }</td>
                        <td>${HmResult.HM13 }</td>
                        <td>${HmResult.HM14 }</td>
                        <td>${HmResult.HM15 }</td>
                        <td>${HmResult.HMText1 }</td>
                        <td>${HmResult.HMText2 }</td>
                        <td>${HmResult.HMText3 }</td>
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