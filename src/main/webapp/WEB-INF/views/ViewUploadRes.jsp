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
<style>

th, td {
    border: 1px solid black;
  }</style>
<title>Excel Upload View</title>
</head>
<body>
<jsp:include page="Header.jsp" flush="true" />
<div class="container-fluid text-center">
      <div class="row content">
<div class="form-group col-sm-12 col-md-12 text-center" >
<h2>Uploaded List</h2>
<table style="border:1px solid #ccc">
    <colgroup>
        <col width="7%"/>
        <col width="7%"/>
        <col width="7%"/>
        <col width="7%"/>
        <col width="7%"/>
        <col width="7%"/>
        <col width="7%"/>
        <col width="7%"/>
        <col width="7%"/>
        <col width="7%"/>
        <col width="7%"/>
        <col width="7%"/>
        <col width="7%"/>
        <col width="7%"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col" style="text-align:center;">Serial No.</th>
            <th scope="col" style="text-align:center;">BR No.</th>
            <th scope="col" style="text-align:center;">Hire Type</th>
            <th scope="col" style="text-align:center;">ERBP</th>
            <th scope="col" style="text-align:center;">NewHire Date</th>
            <th scope="col" style="text-align:center;">Hire Manager Name</th>
            <th scope="col" style="text-align:center;">Hire_Manager Band</th>
            <th scope="col" style="text-align:center;">Hire Manager ID</th>
            <th scope="col" style="text-align:center;">New Hire Name</th>
            <th scope="col" style="text-align:center;">New Hire Band</th>
            <th scope="col" style="text-align:center;">New Hire ID</th>
            <th scope="col" style="text-align:center;">Recruiter Name</th>
            <th scope="col" style="text-align:center;">Recruiter Band</th>
            <th scope="col" style="text-align:center;">Recruiter ID</th>
        </tr>
    </thead>
    
    <tbody>
        <c:choose>
            <c:when test="${fn:length(uploadRes) > 0}">
                <c:forEach items="${uploadRes }" var="uploadRes">
                    <tr style="text-align:center;">
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
                    <td colspan="4">No Result.</td>
                </tr>
            </c:otherwise>
        </c:choose>
         
    </tbody>
</table>
</div>
</div>
</div>
</body>
</html>