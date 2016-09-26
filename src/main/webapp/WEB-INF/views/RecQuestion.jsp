<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="com.sanhak.hrsurvey.domain.RecQKr"%>
<%@ page import="com.sanhak.hrsurvey.domain.RecQEn"%>
<%@ page import="java.util.List"%>
<html>
<head><link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<style>
#RECquestionradioWrapper label{
    padding-right: 10px;
    padding-left: 0;
    padding-top: 0;
}
#other-text1 {
   height: 30px;
   width: 588px;
   display: none;
}

#other-text2 {
   height: 30px;
   width: 588px;
   display: none;
}

#other-text3 {
   height: 30px;
   width: 588px;
   display: none;
}

#other-text4 {
   height: 30px;
   width: 588px;
   display: none;
}

input[type=text] {
   padding: 5px;
   border: 2px solid #ccc;
   -webkit-border-radius: 5px;
   border-radius: 5px;
}

input[type=text]:focus {
   border-color: #333;
}

input[type=submit] {
   padding: 5px 15px;
   background: #5596E6;
   border: 0 none;
   cursor: pointer;
   -webkit-border-radius: 5px;
   border-radius: 5px;
}
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
   margin-bottom: 0;
   border-radius: 0;
   background-color: #325C80;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
   height: 100%
}

/* Set gray background color and 100% height */
.sidenav {
   padding-top: 20px;
   background-color: white;
   height: 100%;
}

/* Set black background color, white text and some padding */
footer {
   background-color: #555;
   color: white;
   padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
   .sidenav {
      height: auto;
      padding: 15px;
   }
   .row.content {
      height: auto;
   }
}
</style>
<script>
   $(function() {
      var num = <%=request.getParameter("serial")%>;
      document.getElementById("serialnum").value = num;
      var type = <%=request.getParameter("lang")%>;
      if(type == '1'){
         Change2Kr();
      }else{
         Change2En();
      }
      history.pushState(null,"Survey for Recruiter","/HRSurveyFinal/surveying");
      $("input:text").keydown(function(evt) {
         if (evt.keyCode == 13)
            return false;
      });
   });
</script>
<title>Survey for Recruiter</title>
</head>

<body>
<%-- <form id="viewMrecQ" name="viewMrecQ" action="mRecQuestionKr" method="post" style="hidden;">
                 <input type="hidden" value="<%=request.getParameter("serial") %>" name="number">
      </form>
      <script type="text/javascript">
   
    var mobileKeyWords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android',
    'Windows CE', 'Windows CE;', 'LG', 'SAMSUNG',
    'MOT', 'SonyEricsson', 'Mobile', 'Symbian',
    'Opera Mobi', 'Opera Mini', 'IEmobile');
    for (var word in mobileKeyWords){
   if (navigator.userAgent.match(mobileKeyWords[word]) != null){
      $("#viewMrecQ").submit();
    break;
   }
    }
    
</script> --%>
   <div class="container-fluid text-center">
      <div class="row content">
         <div class="col-md-12 col-lg-12">
            <nav class="navbar navbar-fixed-top ">
               <font color="white">Please Select</font>
                  
                  <font color="white">Your <b>Language</b></font><br><br>
              <a href="#" onclick="Change2Kr();" class="w3-btn w3-dark-grey" id="RecKrTog">
               <b>Korean</b>
            </a>
            &nbsp;&nbsp;&nbsp;
            
            <a href="#" onclick="Change2En();" class="w3-btn w3-dark-grey" id="HmEnTog">
               <b>English</b>
            </a>
           <br><br>
               
          </nav>
            <br><br><br><br>
         </div>
         <div class="col-sm-2 sidenav"></div>
         <div class ="col-md-8 col-lg-8 text-center" style="background-color:#C0E6FF;"><font size="50px;">IBM Recruiting Satisfaction Survey</font></div>
         
         <div class="col-md-8 col-lg-8 text-left" style="height:auto;">
            <form class="form-horizontal" action="recSrvyAct" method="post">
               <input type="hidden" name="serialnum" id="serialnum" value="">
               
               <fieldset>
                  <legend id="RECquestionLegend">국문</legend>
                  <%
                     @SuppressWarnings (value="unchecked")
                     List<RecQKr> dtos = (List<RecQKr>) request.getAttribute("recqkr");
                     RecQKr dto = null;
                     int cnt = dtos.size();
                     int txtcnt = 0;
                     for (int i = 0; i < cnt; i++) {
                     dto = dtos.get(i);
                  %>
                        <div class="form-group text-left">
                              <div class="form-group col-md-12 col-lg-12"><label id="RECquestionLabel_<%=i+1%>" class="col-md-12 control-label" for="radios_<%=dto.getRecQNum()%>" style="text-align:left;"><%=i+1%> . <%=dto.getRecQKr()%></label></div>
                              <%
                        if (dto.getRecQType().equals("C")) {
                                 txtcnt++;
                     %>
                              <div class="form-group col-md-12 col-lg-12" style=" " id ="RECquestionradioWrapper"> 
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="radios_<%=dto.getRecQNum()%>" id="radios-1_<%=dto.getRecQNum()%>" type="radio" value="1" class="txt<%=txtcnt %>" required>
                               <label id="RECradiosLabel-1_<%=i+1%>" class="radio-inline" for="radios-1_<%=dto.getRecQNum()%>">매우 아니다</label>
                               <input type="text" id="other-text<%=txtcnt %>" name="data<%=txtcnt %>" style="display:none" style="height: 30px; width: 588px;" placeholder="Please Write down the reason." /><br>
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="radios_<%=dto.getRecQNum()%>" id="radios-2_<%=dto.getRecQNum()%>" type="radio" value="2" class="txt<%=txtcnt %>"> 
                               <label id="RECradiosLabel-2_<%=i+1%>" class="radio-inline" for="radios-2_<%=dto.getRecQNum()%>">아니다</label><br>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="radios_<%=dto.getRecQNum()%>" id="radios-3_<%=dto.getRecQNum()%>" type="radio" value="3" class="txt<%=txtcnt %>"> 
                               <label id="RECradiosLabel-3_<%=i+1%>" class="radio-inline" for="radios-3_<%=dto.getRecQNum()%>">보통이다</label><br>
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="radios_<%=dto.getRecQNum()%>" id="radios-4_<%=dto.getRecQNum()%>" type="radio" value="4" class="txt<%=txtcnt %>"> 
                               <label id="RECradiosLabel-4_<%=i+1%>" class="radio-inline" for="radios-4_<%=dto.getRecQNum()%>">그렇다</label><br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="radios_<%=dto.getRecQNum()%>" id="radios-5_<%=dto.getRecQNum()%>" type="radio" value="5" class="txt<%=txtcnt %>"> 
                        <label id="RECradiosLabel-5_<%=i+1%>" class="radio-inline" for="radios-5_<%=dto.getRecQNum()%>">매우 그렇다</label>
                           <script>
                           $(document).ready(function() 
                           { 
                              $(".txt"+<%=txtcnt %>).click(function() {
                                 //check if the selected option is others
                                 var v = <%=txtcnt%>;
                                 if ($(this).val() == "1") {
                                    $("#other-text"+<%=txtcnt %>).show();
                                 } else {
                                    $("#other-text"+<%=txtcnt %>).hide();
                                 }
                              });
                           });
                           </script>
                           
                        </div>
                     <%
                        } else if (dto.getRecQType().equals("B")) {
                     %>
                     <div class="form-group col-md-12 col-lg-12">
                        <br>&nbsp;&nbsp;&nbsp; <input type="text" id="checks-1_<%=dto.getRecQNum()%>"
                           name="radios_<%=dto.getRecQNum()%>" value=""
                           style="height: 30px; width: 588px;" placeholder="Please Write down." />
                     </div>
                     <%
                     }else if(dto.getRecQType().equals("A")){
                     %>
                           <div class="form-group col-md-12 col-lg-12" style="" id ="RECquestionradioWrapper">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="radios_<%=dto.getRecQNum()%>"    id="radios-1_<%=dto.getRecQNum()%>" type="radio" value="1"   onclick="hide()" required> 
                     <label class="radio-inline" for="radios-1_<%=dto.getRecQNum()%>" id="RECradiosLabel-1_<%=i+1%>">매우 아니다</label><br>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="radios_<%=dto.getRecQNum()%>"      id="radios-2_<%=dto.getRecQNum()%>" type="radio" value="2"   onclick="hide()"> 
                     <label class="radio-inline" for="radios-2_<%=dto.getRecQNum()%>"id="RECradiosLabel-2_<%=i+1%>">아니다</label><br>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="radios_<%=dto.getRecQNum()%>"      id="radios-3_<%=dto.getRecQNum()%>" type="radio" value="3"   onclick="hide()"> 
                     <label class="radio-inline" for="radios-3_<%=dto.getRecQNum()%>" id="RECradiosLabel-3_<%=i+1%>">보통이다</label><br>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="radios_<%=dto.getRecQNum()%>"      id="radios-4_<%=dto.getRecQNum()%>" type="radio" value="4"   onclick="hide()"> 
                     <label class="radio-inline" for="radios-4_<%=dto.getRecQNum()%>" id="RECradiosLabel-4_<%=i+1%>">그렇다</label><br>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="radios_<%=dto.getRecQNum()%>"      id="radios-5_<%=dto.getRecQNum()%>" type="radio" value="5"   onclick="hide()"> 
                     <label class="radio-inline" for="radios-5_<%=dto.getRecQNum()%>" id="RECradiosLabel-5_<%=i+1%>">매우 그렇다</label> 
                     </div>
               <%
                  }else{
                     txtcnt++;
                     %>
                     <div class="form-group col-md-12 col-lg-12" style="text-indent:0px;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="checks_<%=dto.getRecQNum()%>" id="checks-1_<%=dto.getRecQNum()%>" type="checkbox" value="1" class="txt4"/> 
                            <label class="checkbox-inline" for="checks-1_<%=dto.getRecQNum()%>" id="RECcheckboxLabel-1_<%=i+1%>" >GOM</label><br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="checks_<%=dto.getRecQNum()%>" id="checks-2_<%=dto.getRecQNum()%>" type="checkbox" value="2" class="txt4" /> 
                            <label class="checkbox-inline" for="checks-2_<%=dto.getRecQNum()%>" id="RECcheckboxLabel-2_<%=i+1%>">직원추천</label><br>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="checks_<%=dto.getRecQNum()%>" id="checks-3_<%=dto.getRecQNum()%>" type="checkbox" value="3" class="txt4" /> 
                           <label class="checkbox-inline" for="checks-3_<%=dto.getRecQNum()%>" id="RECcheckboxLabel-3_<%=i+1%>">링크드인</label><br>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="checks_<%=dto.getRecQNum()%>" id="checks-4_<%=dto.getRecQNum()%>" type="checkbox" value="4" class="txt4" /> 
                           <label class="checkbox-inline" for="checks-4_<%=dto.getRecQNum()%>" id="RECcheckboxLabel-4_<%=i+1%>">Agency</label><br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="checks_<%=dto.getRecQNum()%>" id="checks-5_<%=dto.getRecQNum()%>" type="checkbox" value="5" class="txt4" /> 
                            <label class="checkbox-inline" for="checks-5_<%=dto.getRecQNum()%>" id="RECcheckboxLabel-5_<%=i+1%>">유료잡보드 </label><br>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="checks_<%=dto.getRecQNum()%>" id="checks-6_<%=dto.getRecQNum()%>" type="checkbox" value="6" class="txt4" /> 
                           <label class="checkbox-inline" for="checks-6_<%=dto.getRecQNum()%>" id="RECcheckboxLabel-6_<%=i+1%>">Univ.잡보드 </label><br>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="checks_<%=dto.getRecQNum()%>" id="checks-7_<%=dto.getRecQNum()%>" type="checkbox" value="7" class="txt4" /> 
                              <label class="checkbox-inline" for="checks-7_<%=dto.getRecQNum()%>" id="RECcheckboxLabel-7_<%=i+1%>">기타 </label>
                           <script>
                              $(".txt4").change(function() {
                                 //check if the selected option is others
                                 if ($(this).val() == "7") {
                                    //toggle textbox visibility
                                    $("#other-text"+<%=txtcnt%>).toggle();
                                 }
                              });
                           </script>
                           <input type="text" id="other-text<%=txtcnt %>" name="data<%=txtcnt %>" placeholder="Please Write Down simply" />
                                 </div>
                     <%
                  }
                  %>
                  </div><%
                     }for (int j = cnt + 1; j <= 15; j++) {
                        %>
                        <input type="hidden" name="radios_<%=j%>" value="">
                        <%
                           }
                        %>
               </fieldset>
               <input type="hidden" name="serialnum" id="serialnumkr" value="">
               <br><button id="RECbuttonSubmit" class="btn btn-primary btn-md" onclick="submit"><b>설문제출</b></button><br><br>
               <%-- <%
                  } else {
               %>
               <fieldset>
                  <legend>English</legend>
                  <!-- Multiple Radios (inline) -->
                  <%
                     List<RecQEn> dtos2 = (List<RecQEn>) request.getAttribute("recqen");
                     RecQEn dto2 = null;
                     int cnt = dtos2.size();
                     int txtcnt = 0;
                     for (int i = 0; i < cnt; i++) {
                        dto2 = dtos2.get(i);
                  %>
                           <div class="form-group text-left">
                                 <label class="col-md-12 col-lg-12 control-label" for="radios_<%=dto2.getRecQNum()%>" style="text-align:left;"><%=dto2.getRecQNum()%> . <%=dto2.getRecQEn()%></label>
                                 <%
                        if (dto2.getRecQType().equals("C")) {
                                 txtcnt++;
                     %>
                                 <div class="form-group col-md-12 col-lg-12" style="text-indent:20px;">
                                    <label class="radio-inline" for="radios-1_<%=dto2.getRecQNum()%>">
                                    <input name="radios_<%=dto2.getRecQNum()%>" id="radios-1_<%=dto2.getRecQNum()%>" type="radio" value="1" class="txt<%=txtcnt%>" required> Strongly Disagree</label>
                                    &nbsp;&nbsp;<input type="text" id="other-text<%=txtcnt%>"
                           name="data<%=txtcnt%>" style="display:none;height: 30px; width: 588px;"
                           placeholder="Please write down the reason simply" /><br>
                                    <label class="radio-inline" for="radios-2_<%=dto2.getRecQNum()%>">
                                    <input name="radios_<%=dto2.getRecQNum()%>" id="radios-2_<%=dto2.getRecQNum()%>" type="radio" value="2" class="txt<%=txtcnt%>"> Disagree </label><br>
                           <label class="radio-inline" for="radios-3_<%=dto2.getRecQNum()%>">
                                    <input name="radios_<%=dto2.getRecQNum()%>"  id="radios-3_<%=dto2.getRecQNum()%>" type="radio" value="3" class="txt<%=txtcnt%>"> Neutral </label><br>
                                    <label class="radio-inline" for="radios-4_<%=dto2.getRecQNum()%>">
                                  <input name="radios_<%=dto2.getRecQNum()%>"  id="radios-4_<%=dto2.getRecQNum()%>" type="radio" value="4" class="txt<%=txtcnt%>"> Agree </label><br>
                                  <label class="radio-inline" for="radios-5_<%=dto2.getRecQNum()%>">
                                    <input name="radios_<%=dto2.getRecQNum()%>"  id="radios-5_<%=dto2.getRecQNum()%>" type="radio" value="5" class="txt<%=txtcnt%>"> Strongly Agree </label>
                           <script>
                              $(".txt"+<%=txtcnt%>).click(function() {
                                 //check if the selected option is others
                                 if ($(this).val() == "1") {
                                    $("#other-text"+<%=txtcnt%>).show();
                                 } else {
                                    $("#other-text"+<%=txtcnt%>).hide();
                                 }
                              });
                           </script>
                                    </div>
                     <%
                        } else if (dto2.getRecQType().equals("B")) {
                     %>
                     <div class="form-group col-md-12 col-lg-12">
                        <br> &nbsp;&nbsp;<input type="text" id="radios_<%=dto2.getRecQNum()%>"
                           name="radios_<%=dto2.getRecQNum()%>" value=""
                           style="height: 30px; width: 588px;" placeholder="Write Down" />
                     </div>
         <%
                        } else if (dto2.getRecQType().equals("A")) {
                     %>
                     <div class="form-group col-md-12 col-lg-12" style="text-indent:20px;">
                     <label class="radio-inline" for="radios-1_<%=dto2.getRecQNum()%>">
                     <input name="radios_<%=dto2.getRecQNum()%>"    id="radios-1_<%=dto2.getRecQNum()%>" type="radio" value="1"   onclick="hide()" required> Strongly Disagree</label><br>
                     <label class="radio-inline" for="radios-2_<%=dto2.getRecQNum()%>">
                     <input name="radios_<%=dto2.getRecQNum()%>"      id="radios-2_<%=dto2.getRecQNum()%>" type="radio" value="2"   onclick="hide()"> Disagree </label><br>
                     <label class="radio-inline" for="radios-3_<%=dto2.getRecQNum()%>">
                     <input name="radios_<%=dto2.getRecQNum()%>"      id="radios-3_<%=dto2.getRecQNum()%>" type="radio" value="3"   onclick="hide()"> Neutral </label><br>
                     <label class="radio-inline" for="radios-4_<%=dto2.getRecQNum()%>">
                     <input name="radios_<%=dto2.getRecQNum()%>"      id="radios-4_<%=dto2.getRecQNum()%>" type="radio" value="4"   onclick="hide()"> Agree </label><br>
                     <label class="radio-inline" for="radios-5_<%=dto2.getRecQNum()%>">
                     <input name="radios_<%=dto2.getRecQNum()%>"      id="radios-5_<%=dto2.getRecQNum()%>" type="radio" value="5"   onclick="hide()"> Strongly Agree    </label> 
                     </div>
               <%
                  }else{
                     txtcnt++;
                  %>
                  <div class="form-group col-md-12 col-lg-12" style="text-indent:20px;">
                                    <label class="checkbox-inline" for="checks-1_<%=dto2.getRecQNum()%>">
                                    <input name="checks_<%=dto2.getRecQNum()%>" id="checks-1_<%=dto2.getRecQNum()%>" type="checkbox" value="1" class="txt2"/> GOM </label><br>
                                    <label class="checkbox-inline" for="checks-2_<%=dto2.getRecQNum()%>">
                                    <input name="checks_<%=dto2.getRecQNum()%>" id="checks-2_<%=dto2.getRecQNum()%>" type="checkbox" value="2" class="txt2" /> Recommendation </label><br>
                           <label class="checkbox-inline" for="checks-3_<%=dto2.getRecQNum()%>">
                                    <input name="checks_<%=dto2.getRecQNum()%>" id="checks-3_<%=dto2.getRecQNum()%>" type="checkbox" value="3" class="txt2" /> LinkedIn </label><br>
                                    <label class="checkbox-inline" for="checks-4_<%=dto2.getRecQNum()%>">
                                    <input name="checks_<%=dto2.getRecQNum()%>" id="checks-4_<%=dto2.getRecQNum()%>" type="checkbox" value="4" class="txt2" /> Agency </label><br>
                                    <label class="checkbox-inline" for="checks-5_<%=dto2.getRecQNum()%>">
                                    <input name="checks_<%=dto2.getRecQNum()%>" id="checks-5_<%=dto2.getRecQNum()%>" type="checkbox" value="5" class="txt2" /> Paid Job Board </label><br>
                                    <label class="checkbox-inline" for="checks-6_<%=dto2.getRecQNum()%>">
                                    <input name="checks_<%=dto2.getRecQNum()%>" id="checks-6_<%=dto2.getRecQNum()%>" type="checkbox" value="6" class="txt2" /> Univ. Job Board </label><br>
                                    <label class="checkbox-inline" for="checks-7_<%=dto2.getRecQNum()%>">
                                    <input name="checks_<%=dto2.getRecQNum()%>" id="checks-7_<%=dto2.getRecQNum()%>" type="checkbox" value="7" class="txt2" /> ETC </label>
                           <script>
                              $(".txt2").change(function() {
                                 //check if the selected option is others
                                 if ($(this).val() == "7") {
                                    //toggle textbox visibility
                                    $("#other-text"+<%=txtcnt%>).toggle();
                                 }
                              });
                           </script>
                           <input type="text" id="other-text<%=txtcnt%>" name="data<%=txtcnt%>" placeholder="Please write down the other items." />
                           </div>
                  
                  <%
                  }%></div>
<%
                     }
                        for (int j = cnt + 1; j <= 15; j++) {
                  %>
                  <input type="hidden" name="radios_<%=j%>" value="">
                  <%
                     }
                  %>
               </fieldset>
               <input type="hidden" name="serialnum" id="serialnumen" value="">
               <br><button class="btn btn-primary btn-md" onclick="submit"><b>Submit</b></button><br><br>
               <%
                  }
               %>
               
            </form> --%>

         </div>
         <div class="col-sm-1 sidenav"></div>

      </div>
   </div>

   <jsp:include page="Footer.jsp" flush="true" />
<script>
   function Change2En(){
      
      var objParams={};
       $.post(
           "RecQEN", 
           objParams,
           function(retVal) {
                   var values=[];
                   values=retVal.list;
                   $('#RECquestionLegend').text('English');
                   $.each(values, function( index, value) {
                      var tmpId = "RECquestionLabel_"+(index+1);
                       $('#'+tmpId).text((index+1)+'. '+value);
                          $('#RECradiosLabel-1_'+(index+1)).text('Strongly Disagree');
                         $('#RECradiosLabel-2_'+(index+1)).text('Disagree');
                         $('#RECradiosLabel-3_'+(index+1)).text('Neutral');
                         $('#RECradiosLabel-4_'+(index+1)).text('Agree');
                         $('#RECradiosLabel-5_'+(index+1)).text('Strongly Agree');
                      $('#RECcheckboxLabel-1_'+(index+1)).text('GOM'); 
                         $('#RECcheckboxLabel-2_'+(index+1)).text('Recommendation');
                         $('#RECcheckboxLabel-3_'+(index+1)).text('LinkedIn');
                         $('#RECcheckboxLabel-4_'+(index+1)).text('Agency');
                         $('#RECcheckboxLabel-5_'+(index+1)).text('Paid Job Board');
                         $('#RECcheckboxLabel-6_'+(index+1)).text('Univ. Job Board');
                         $('#RECcheckboxLabel-7_'+(index+1)).text('ETC');
                   });
                   $('#RECbuttonSubmit').text('Submit');

               }                   
       );
   }
   </script>
   <script>
   function Change2Kr(){
      
      var objParams={};
       $.post(
           "RecQKR", 
           objParams,
           function(retVal) {
                   var values=[];
                   values=retVal.list;
                   $('#RECquestionLegend').text('국문');
                   $.each(values, function( index, value ) {
                      var tmpId = "RECquestionLabel_"+(index+1);
                       $('#'+tmpId).text((index+1)+'. '+value);
                          $('#RECradiosLabel-1_'+(index+1)).text('매우 아니다');
                         $('#RECradiosLabel-2_'+(index+1)).text('아니다');
                         $('#RECradiosLabel-3_'+(index+1)).text('보통이다');
                         $('#RECradiosLabel-4_'+(index+1)).text('그렇다');
                         $('#RECradiosLabel-5_'+(index+1)).text('매우 그렇다');
                      $('#RECcheckboxLabel-1_'+(index+1)).text('GOM'); 
                         $('#RECcheckboxLabel-2_'+(index+1)).text('직원추천');
                         $('#RECcheckboxLabel-3_'+(index+1)).text('링크드인');
                         $('#RECcheckboxLabel-4_'+(index+1)).text('Agency');
                         $('#RECcheckboxLabel-5_'+(index+1)).text('유료 잡보드');
                         $('#RECcheckboxLabel-6_'+(index+1)).text('Univ. 잡보드');
                         $('#RECcheckboxLabel-7_'+(index+1)).text('기타');

                   });
                   $('#RECbuttonSubmit').text('설문 제출');
               }                   
       );
   }
   </script>
</body>
</html>