<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.sanhak.hrsurvey.domain.NhQKr"%>
<%@ page import="com.sanhak.hrsurvey.domain.NhQEn"%>
<%@ page import="java.util.List"%>
<html>
<head>
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<style>
#NHquestionradioWrapper label{
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
      var num =
<%=request.getParameter("serial")%>
   ;
      document.getElementById("serialnum").value = num;
      var type = <%=request.getParameter("lang")%>;
      if(type == '1'){
         Change2Kr();
      }else{
         Change2En();
      }
      history.pushState(null, "Survey for New Hire",
            "/HRSurveyFinal/surveying");
      $("input:text").keydown(function(evt) {
         if (evt.keyCode == 13)
            return false;
      });
   });
</script>
<script>
   function Change2En() {

      var objParams = {};
      $.post("NhQEN", objParams, function(retVal) {
         var values = [];
         values = retVal.list;
         $('#NHquestionLegend').text('English');
         $.each(values, function(index, value) {
            var tmpId = "NHquestionLabel_" + (index + 1);
            $('#' + tmpId).text((index + 1) + '. ' + value);
            $('#NHradiosLabel-1_' + (index + 1)).text('Strongly Disagree');
            $('#NHradiosLabel-2_' + (index + 1)).text('Disagree');
            $('#NHradiosLabel-3_' + (index + 1)).text('Neutral');
            $('#NHradiosLabel-4_' + (index + 1)).text('Agree');
            $('#NHradiosLabel-5_' + (index + 1)).text('Strongly Agree');
         });
         $('#NHbuttonSubmit').text('Submit');

      });
   }
</script>
<script>
   function Change2Kr() {

      var objParams = {};
      $.post("NhQKR", objParams, function(retVal) {
         var values = [];
         values = retVal.list;
         $('#NHquestionLegend').text('국문');
         $.each(values, function(index, value) {
            var tmpId = "NHquestionLabel_" + (index + 1);
            $('#' + tmpId).text((index + 1) + '. ' + value);
            $('#NHradiosLabel-1_' + (index + 1)).text('매우 아니다');
            $('#NHradiosLabel-2_' + (index + 1)).text('아니다');
            $('#NHradiosLabel-3_' + (index + 1)).text('보통이다');
            $('#NHradiosLabel-4_' + (index + 1)).text('그렇다');
            $('#NHradiosLabel-5_' + (index + 1)).text('매우 그렇다');
         });
         $('#NHbuttonSubmit').text('설문 제출');
      });
   }
</script>
<title>Survey for New Hire</title>
</head>


<body>
   <%-- <form id="viewMnhQ" name="viewMnhQ" action="mNhQuestionKr"
      method="post" style="">
      <input type="hidden" value="<%=request.getParameter("serial")%>"
         name="number">
   </form>
   <script type="text/javascript">
      var mobileKeyWords = new Array('iPhone', 'iPod', 'BlackBerry',
            'Android', 'Windows CE', 'Windows CE;', 'LG', 'SAMSUNG', 'MOT',
            'SonyEricsson', 'Mobile', 'Symbian', 'Opera Mobi',
            'Opera Mini', 'IEmobile');
      for ( var word in mobileKeyWords) {
         if (navigator.userAgent.match(mobileKeyWords[word]) != null) {
            $("#viewMnhQ").submit();
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
         <div class="col-md-8 col-lg-8 text-center"
            style="background-color: #C0E6FF;">
            <font size="50px;">IBM Recruiting Satisfaction Survey</font>
         </div>
         <div class="col-md-8 col-lg-8 text-left" style="height: auto;">
            <form class="form-horizontal" action="nhSrvyAct" method="post">
                  <input type="hidden" name="serialnum" id="serialnum" value="">
                  <fieldset>
                     <legend id="NHquestionLegend">국문</legend>
                     <%
                        @SuppressWarnings(value = "unchecked")
                        List<NhQKr> dtos = (List<NhQKr>) request.getAttribute("nhqkr");
                        NhQKr dto = null;
                        int cnt = dtos.size();
                              int txtcnt = 0;
                              for (int i = 0; i < cnt; i++) {
                           dto = dtos.get(i);
                     %>
                     <div class="form-group">
                     <div class="form-group col-md-12 col-lg-12">
                        <label id="NHquestionLabel_<%=i + 1%>"
                           class="col-md-12 control-label"
                           for="radios_<%=dto.getNhQNum()%>" style="text-align: left;"><%=i + 1%>.
                           <%=dto.getNhQKr()%></label></div>
                            <%
                        if (dto.getNhQType().equals("C")) {
                                 txtcnt++;
                     %>
                        <div class="form-group col-md-12" " id="NHquestionradioWrapper">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="radios_<%=dto.getNhQNum()%>"
                              id="radios-1_<%=dto.getNhQNum()%>" type="radio" value="1"
                              class="multi<%=txtcnt %>" required> <label class="radio-inline"
                              for="radios-1_<%=dto.getNhQNum()%>"
                              id="NHradiosLabel-1_<%=i + 1%>">매우 아니다</label>
                              <input type="text" style="display:none;width:588px;" id="other-text_<%=txtcnt%>" value="" name="data<%=txtcnt%>" placeholder="직접 작성해주세요." />  
                           <br>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
                              name="radios_<%=dto.getNhQNum()%>"
                              id="radios-2_<%=dto.getNhQNum()%>" type="radio" value="2"
                              class="multi<%=txtcnt %>"> <label class="radio-inline"
                              for="radios-2_<%=dto.getNhQNum()%>"
                              id="NHradiosLabel-2_<%=i + 1%>">아니다</label> <br>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
                              name="radios_<%=dto.getNhQNum()%>"
                              id="radios-3_<%=dto.getNhQNum()%>" type="radio" value="3"
                              class="multi<%=txtcnt %>"> <label class="radio-inline"
                              for="radios-3_<%=dto.getNhQNum()%>"
                              id="NHradiosLabel-3_<%=i + 1%>">보통이다</label> <br>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
                              name="radios_<%=dto.getNhQNum()%>"
                              id="radios-4_<%=dto.getNhQNum()%>" type="radio" value="4"
                              class="multi<%=txtcnt %>"> <label class="radio-inline"
                              for="radios-4_<%=dto.getNhQNum()%>"
                              id="NHradiosLabel-4_<%=i + 1%>">그렇다</label><br> 
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
                              name="radios_<%=dto.getNhQNum()%>"
                              id="radios-5_<%=dto.getNhQNum()%>" type="radio" value="5"
                              class="multi<%=txtcnt %>"> <label class="radio-inline"
                              for="radios-5_<%=dto.getNhQNum()%>"
                              id="NHradiosLabel-5_<%=i + 1%>">매우 그렇다</label>
                           <script>
                        $(document).ready(function() 
                        { 
                            $(".multi"+<%=txtcnt %>).click(function() 
                            { 
                               var v = <%=txtcnt%>;
                               if($(this).val() == "1"){
                                  $("#other-text_"+<%=txtcnt %>).show();
                              } else {
                                 $("#other-text_"+<%=txtcnt %>).hide();
                              }
                            });
                        });
                        </script>
                     <%
                        } else if (dto.getNhQType().equals("B")) {
                     %>   
                     <div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12">
                        <br>&nbsp;&nbsp; <input type="text" id="checks-1_<%=dto.getNhQNum()%>"
                           name="radios_<%=dto.getNhQNum()%>" value=""
                           style="height: 30px; width: 588px;" placeholder="직접 작성해주세요." />
                     </div>   
                     <%
                        } else if (dto.getNhQType().equals("A")) {
                     %>
                     <!-- <div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12" style="text-indent:20px;"> -->
                        <%-- <label id="NHquestionLabel_<%=i + 1%>"
                           class="col-md-6 control-label"
                           for="radios_<%=dto.getNhQNum()%>" style="text-align: left;"><%=i + 1%>.
                           <%=dto.getNhQKr()%></label> --%>
                        <div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12"  id="NHquestionradioWrapper">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <input name="radios_<%=dto.getNhQNum()%>"
                              id="radios-1_<%=dto.getNhQNum()%>" type="radio" value="1"
                                onclick="hide()" required> <label class="radio-inline"
                              for="radios-1_<%=dto.getNhQNum()%>"
                              id="NHradiosLabel-1_<%=i + 1%>">매우 아니다</label><br>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <input
                              name="radios_<%=dto.getNhQNum()%>"
                              id="radios-2_<%=dto.getNhQNum()%>" type="radio" value="2"
                                onclick="hide()"> <label class="radio-inline"
                              for="radios-2_<%=dto.getNhQNum()%>"
                              id="NHradiosLabel-2_<%=i + 1%>">아니다</label><br>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                              <input
                              name="radios_<%=dto.getNhQNum()%>"
                              id="radios-3_<%=dto.getNhQNum()%>" type="radio" value="3"
                                onclick="hide()"> <label class="radio-inline"
                              for="radios-3_<%=dto.getNhQNum()%>"
                              id="NHradiosLabel-3_<%=i + 1%>">보통이다</label><br>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                              <input
                              name="radios_<%=dto.getNhQNum()%>"
                              id="radios-4_<%=dto.getNhQNum()%>" type="radio" value="4"
                                onclick="hide()"> <label class="radio-inline"
                              for="radios-4_<%=dto.getNhQNum()%>"
                              id="NHradiosLabel-4_<%=i + 1%>">그렇다</label>
                              <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <input
                              name="radios_<%=dto.getNhQNum()%>"
                              id="radios-5_<%=dto.getNhQNum()%>" type="radio" value="5"
                                onclick="hide()"> <label class="radio-inline"
                              for="radios-5_<%=dto.getNhQNum()%>"
                              id="NHradiosLabel-5_<%=i + 1%>">매우 그렇다</label>
                        </div>
                          <%
                        }
                     %></div>
                         <%
                     }
                        for (int j = cnt + 1; j <= 15; j++) {
                  %>
                  <input type="hidden" name="radios_<%=j%>" value="">
                  <%
                     }
                  %>
                  </fieldset>
                  <button class="btn btn-primary btn-md" onclick="submit"
                     id="NHbuttonSubmit">
                     <b>설문 완료</b><br><br>
                  </button>
               </form>
         </div>
         <div class="col-sm-2 sidenav"></div>
      </div>
   </div>

   <jsp:include page="Footer.jsp" flush="true" />

</body>
</html>