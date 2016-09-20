<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sanhak.hrsurvey.domain.UploadResDto"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Excel Upload View</title>
</head>
<body>

<h2>엑셀 업로드 목록</h2>
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
            <th scope="col">BR_No</th>
            <th scope="col">Hire_Type</th>
            <th scope="col">ERBP</th>
            <th scope="col">NewHire_Date</th>
            <th scope="col">Hire_Manager_Name</th>
            <th scope="col">Hire_Manager_Band</th>
            <th scope="col">HM_ID</th>
            <th scope="col">New_Hire_Name</th>
            <th scope="col">New_Hire_Band</th>
            <th scope="col">New_Hire_ID</th>
            <th scope="col">Recruiter_Name</th>
            <th scope="col">Recruiter_Band</th>
            <th scope="col">Recruiter_ID</th>
        </tr>
    </thead>
    
    <tbody>
        <c:choose>
            <c:when test="${fn:length(uploadRes) > 0}">
                <c:forEach items="${uploadRes }" var="uploadRes">
                    <tr>
                        <td>${uploadRes.serialNo }</td>
                        <td>${uploadRes.BRNo }</td>
                        <td>${uploadRes.hireType }</td>
                        <td>${uploadRes.ERBP }</td>
                        <td>${uploadRes.newHireDate }</td>
                        <td>${uploadRes.hireManagerName }</td>
                        <td>${uploadRes.hireManagerBand }</td>
                        <td>${uploadRes.HMID }</td>
                        <td>${uploadRes.newHireName }</td>
                        <td>${uploadRes.newHireBand }</td>
                        <td>${uploadRes.newHireID }</td>
                        <td>${uploadRes.recruiterName }</td>
                        <td>${uploadRes.recruiterBand }</td>
                        <td>${uploadRes.recruiterID }</td>
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