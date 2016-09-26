<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sanhak.hrsurvey.domain.NhResultDto"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style> th, td {
    border: 1px solid #bcbcbc;
  }</style>
<title>Nh Result View</title>
</head>
<body>

<jsp:include page="Header.jsp" flush="true" />
      <div class="form-group"> <!-- Date input -->
      <form id="pickdate" name="pickdate" action="hmpickDate" method="post">
        <label class="control-label" for="date">Date</label>
        <input  id="fdate" name="fdate" placeholder="YYYY/MM/DD" type="text"/>
        <input  id="tdate" name="tdate" placeholder="YYYY/MM/DD" type="text"/>
        <input type="submit" value="검색"></form>
      </div>
   
     
      <script>
    $(document).ready(function(){
      var fdate_input=$('input[name="fdate"]'); //our date input has the name "date"
      var tdate_input=$('input[name="tdate"]'); 
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'yyyy/mm/dd',
        container: container,
        todayHighlight: true,
        autoclose: true,
        orientation : "bottom right",
           todayBtn: true
      };
      fdate_input.datepicker(options);
      tdate_input.datepicker(options);
      
    });
</script>
<div class="container-fluid text-center">
		<div class="row content">
<div class="form-group col-sm-12 col-md-12 text-left">

<h2>New Hire Survey 결과</h2>
<table width="1550" style="border:1px solid #ccc ;table-layout:fixed; word-break:break-all;" height="auto" >
    <colgroup>
       <col width="5%"/>
        <col width="2%"/>
        <col width="2%"/>
        <col width="2%"/>
        <col width="2%"/>
        <col width="2%"/>
        <col width="2%"/>
        <col width="2%"/>
        <col width="2%"/>
        <col width="2%"/>
        <col width="2%"/>
        <col width="2%"/>
        <col width="2%"/>
        <col width="2%"/>
        <col width="2%"/>
        <col width="2%"/>
        <col width="8%"/>
        <col width="8%"/>
        <col width="8%"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col">Serial_No</th>
            <th scope="col">NH_1</th>
            <th scope="col">NH_2</th>
            <th scope="col">NH_3</th>
            <th scope="col">NH_4</th>
            <th scope="col">NH_5</th>
            <th scope="col">NH_6</th>
            <th scope="col">NH_7</th>
            <th scope="col">NH_8</th>
            <th scope="col">NH_9</th>
            <th scope="col">NH_10</th>
            <th scope="col">NH_11</th>
            <th scope="col">NH_12</th>
            <th scope="col">NH_13</th>
            <th scope="col">NH_14</th>
            <th scope="col">NH_15</th>
            <th scope="col">NH_TEXT1</th>
            <th scope="col">NH_TEXT2</th>
            <th scope="col">NH_TEXT3</th>
        </tr>
    </thead>
    
    <tbody>
        <c:choose>
            <c:when test="${fn:length(NhResult ) > 0}">
                <c:forEach items="${NhResult }" var="NhResult">
                    <tr>
                        <td>${NhResult.serialNo }</td>
                        <td>${NhResult.NH1 }</td>
                        <td>${NhResult.NH2 }</td>
                        <td>${NhResult.NH3 }</td>
                        <td>${NhResult.NH4 }</td>
                        <td>${NhResult.NH5 }</td>
                        <td>${NhResult.NH6 }</td>
                        <td>${NhResult.NH7 }</td>
                        <td>${NhResult.NH8 }</td>
                        <td>${NhResult.NH9 }</td>
                        <td>${NhResult.NH10 }</td>
                        <td>${NhResult.NH11 }</td>
                        <td>${NhResult.NH12 }</td>
                        <td>${NhResult.NH13 }</td>
                        <td>${NhResult.NH14 }</td>
                        <td>${NhResult.NH15 }</td>
                        <td>${NhResult.NHText1 }</td>
                        <td>${NhResult.NHText2 }</td>
                        <td>${NhResult.NHText3 }</td>
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

</div>
</div>
</div>
<jsp:include page="Footer.jsp" flush="true" />


</body>
</html>