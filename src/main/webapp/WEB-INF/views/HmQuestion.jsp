<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.sanhak.hrsurvey.domain.HmQKr"%>
<%@ page import="com.sanhak.hrsurvey.domain.HmQEn"%>
<%@ page import="java.util.List"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Survey for Hiring Manager</title>
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<style>
#HMquestionradioWrapper label{
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
      history.pushState(null,"Survey for Hiring Manager","/HRSurveyFinal/surveying");
      var num = <%=request.getParameter("serial")%>;
      document.getElementById("serialnum").value = num;
      var type = <%=request.getParameter("lang")%>;
      if(type == '1'){
         Change2Kr();
      }else{
         Change2En();
      }
      $("input:text").keydown(function(evt) {
         if (evt.keyCode == 13)
            return false;
      });
     /*  $("#HmEnTog").click(function() {
         
         aler("asd");
         $.pjax('#HmEnTog','#wellEn');
      });
      $("#HmKrTog").click(function() {
         
               $.pjax('#HmKrTog','#wellKr');
     }); */
   });
      </script>
      
      
</head>
<title>Survey for Hiring Manager</title>

<body oncontextmenu="return false" ondragstart="return false"
   onselectstart="return false">
   
      <script type="text/javascript">
   
    var mobileKeyWords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android',
    'Windows CE', 'Windows CE;', 'LG', 'SAMSUNG',
    'MOT', 'SonyEricsson', 'Mobile', 'Symbian',
    'Opera Mobi', 'Opera Mini', 'IEmobile');
    for (var word in mobileKeyWords){
   if (navigator.userAgent.match(mobileKeyWords[word]) != null){
   var width = 300;   
   }
   else var width=588;
    }
</script> 
   <div class="container-fluid text-center">
      <div class="row content">
      
         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <nav class="navbar navbar-fixed-top ">
               <font color="white">Please Select</font>
                  
                  <font color="white">Your <b>Language</b></font><br><br>
               <a href="#" onclick="Change2Kr()" class="w3-btn w3-dark-grey" id="HmKrTog">
               <b>Korean</b>
            </a>
            &nbsp;&nbsp;
            <a href="#" onclick="Change2En()" class="w3-btn w3-dark-grey" id="HmEnTog">
               <b>English</b>
            </a>
            <br><br>
          </nav>
            <br><br><br><br>
         </div>
         <div class="col-md-2 col-lg-2 col-xs-0 col-sm-0 sidenav"></div><br><br><br><br>
         <div class ="col-md-8 col-lg-8 col-xs-12 col-sm-12 text-center" style="background-color:#C0E6FF;"><font size="50px;">IBM Recruting Satisfaction Survey</font></div>
         <div class="col-md-8 col-lg-8 text-left" style="height:auto;">

            <form id="toggled" class="form-horizontal" action="hmSrvyAct" method="post">
                <input type="hidden" name="serialnum" id="serialnum" value="">
               <fieldset>
                  <!-- Form Name -->
                  <legend id="HMquestionLegend">국문</legend>
                  <%
                  @SuppressWarnings(value = "unchecked")
                  List<HmQKr> dtos = (List<HmQKr>) request.getAttribute("hmqkr");
                  HmQKr dto = null;
                  int cnt = dtos.size();
                  int txtcnt=0;
                  for (int i = 0; i < cnt; i++) {
                     dto = dtos.get(i);
            %>
                  <div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
                  <label id="HMquestionLabel_<%=i+1%>" class="control-label"   for="radios_<%=dto.getHmQNum()%>" style="text-align:left;"><%=i+1%> . <%=dto.getHmQKr()%></label>
                   <%
                        if (dto.getHmQType().equals("C")) {
                                 txtcnt++;
                     %>
                              <div id ="HMquestionradioWrapper" class="form-group col-md-12 col-lg-12" style="text-indent:20px;">
                               <input name="radios_<%=dto.getHmQNum()%>" id="radios-1_<%=dto.getHmQNum()%>" type="radio" value="1" class="txt<%=txtcnt %>" required>
                               <label id="HMradiosLabel-1_<%=i+1%>" class="radio-inline" for="radios-1_<%=dto.getHmQNum()%>">매우 아니다</label>
                               &nbsp;&nbsp;<input type="text" id="other-text<%=txtcnt %>" name="data<%=txtcnt %>" style="display:none;height: 30px; width: 588px;" placeholder="Write Down Please." /><br>
                               <input name="radios_<%=dto.getHmQNum()%>" id="radios-2_<%=dto.getHmQNum()%>" type="radio" value="2" class="txt<%=txtcnt %>"> 
                               <label id="HMradiosLabel-2_<%=i+1%>" class="radio-inline" for="radios-2_<%=dto.getHmQNum()%>">아니다</label><br>
                               <input name="radios_<%=dto.getHmQNum()%>" id="radios-3_<%=dto.getHmQNum()%>" type="radio" value="3" class="txt<%=txtcnt %>"> 
                               <label id="HMradiosLabel-3_<%=i+1%>" class="radio-inline" for="radios-3_<%=dto.getHmQNum()%>">보통이다</label><br>
                               <input name="radios_<%=dto.getHmQNum()%>" id="radios-4_<%=dto.getHmQNum()%>" type="radio" value="4" class="txt<%=txtcnt %>"> 
                               <label id="HMradiosLabel-4_<%=i+1%>" class="radio-inline" for="radios-4_<%=dto.getHmQNum()%>">그렇다</label><br>
                        <input name="radios_<%=dto.getHmQNum()%>" id="radios-5_<%=dto.getHmQNum()%>" type="radio" value="5" class="txt<%=txtcnt %>"> 
                        <label id="HMradiosLabel-5_<%=i+1%>" class="radio-inline" for="radios-5_<%=dto.getHmQNum()%>">매우 그렇다</label>
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
                        }else if (dto.getHmQType().equals("A")) {
                     %>
                  </div>
                  <div id ="HMquestionradioWrapper" class="form-group col-md-12 col-lg-12" style="text-indent:20px;" >
                       <input name="radios_<%=dto.getHmQNum()%>"    id="HMradios-1_<%=dto.getHmQNum()%>" type="radio" value="1" onclick="hide()" required>  
                       <label class="radio-inline" for="radios-1_<%=dto.getHmQNum()%>" id="HMradiosLabel-1_<%=i+1%>" >매우 아니다</label><br>
                       <input name="radios_<%=dto.getHmQNum()%>"      id="HMradios-2_<%=dto.getHmQNum()%>" type="radio" value="2" onclick="hide()">
                       <label class="radio-inline" for="radios-2_<%=dto.getHmQNum()%>" id="HMradiosLabel-2_<%=i+1%>">아니다</label><br>
                       <input name="radios_<%=dto.getHmQNum()%>"      id="HMradios-3_<%=dto.getHmQNum()%>" type="radio" value="3" onclick="hide()"> 
                       <label class="radio-inline" for="radios-3_<%=dto.getHmQNum()%>" id="HMradiosLabel-3_<%=i+1%>">보통이다</label>   <br>
                       <input name="radios_<%=dto.getHmQNum()%>"      id="HMradios-4_<%=dto.getHmQNum()%>" type="radio" value="4" onclick="hide()"> 
                         <label class="radio-inline" for="radios-4_<%=dto.getHmQNum()%>" id="HMradiosLabel-4_<%=i+1%>">그렇다</label> <br>
                       <input name="radios_<%=dto.getHmQNum()%>"      id="HMradios-5_<%=dto.getHmQNum()%>" type="radio" value="5" onclick="hide()"> 
                       <label class="radio-inline" for="radios-5_<%=dto.getHmQNum()%>" id="HMradiosLabel-5_<%=i+1%>">매우 그렇다</label> 
               </div>   
            <%
                        } else if (dto.getHmQType().equals("B")) {
            %>
            <div class="col-md-12">
                        <br> <input type="text" id="radios_<%=dto.getHmQNum()%>"
                           name="radios_<%=dto.getHmQNum()%>" value=""
                           style="height: 30px; width: 588px;" placeholder="Please.." />
                     </div>
                     <%
                        }
                     %>
               
               <%
                     }
                        for (int i = cnt + 1; i <= 15; i++) {
                  %>
                  <input type="hidden" name="radios_<%=i%>" value="">
                  <%
                     }
                  %>
                  </fieldset>
                  <input type="hidden" name="serialnum" id="serialnumkr" value="">
               <br><button id="HMbuttonSubmit" class="btn btn-primary btn-md" onclick="submit"><b>설문 완료</b></button><br><br>
               <%-- <%
                  } else {
               %>
               <fieldset>
                  <legend>English</legend>
                  <!-- Multiple Radios (inline) -->
                  <%
                  List<HmQEn> dtos2 = (List<HmQEn>) request.getAttribute("hmqen");
                  HmQEn dto2 = null;
                  int cnt = dtos2.size();
                  int txtcnt=0;
                  for (int j = 0; j < cnt; j++) {
                     dto2 = dtos2.get(j);
               %>
                     <div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 " >
                     <label class="control-label"   for="radios_<%=dto2.getHmQNum()%>" style="text-align:left;"><%=dto2.getHmQNum()%> . <%=dto2.getHmQEn()%></label>
                     </div>
                     <%
                        if (dto2.getHmQType().equals("C")) {
                                 txtcnt++;
                     %>
                     <div class="form-group col-md-12" style="text-indent:20px;">
                        <label class="radio-inline" for="radios-1_<%=dto2.getHmQNum()%>"><input class="multi<%=txtcnt %>" name="radios_<%=dto2.getHmQNum()%>" id="radios-1_<%=dto2.getHmQNum()%>" type="radio" value="1" required>Strongly Disagree</label>
                        &nbsp;&nbsp;<input type="text" style="display:none;width:588px;" id="other-text_<%=txtcnt%>" value="" name="data<%=txtcnt%>" placeholder="Please write down the reason simply." /><br> 
                        <label class="radio-inline" for="radios-2_<%=dto2.getHmQNum()%>"><input class="multi<%=txtcnt %>" name="radios_<%=dto2.getHmQNum()%>" id="radios-2_<%=dto2.getHmQNum()%>" type="radio" value="2"> Disagree</label> <br>
                        <label class="radio-inline" for="radios-3_<%=dto2.getHmQNum()%>"><input class="multi<%=txtcnt %>" name="radios_<%=dto2.getHmQNum()%>" id="radios-3_<%=dto2.getHmQNum()%>" type="radio" value="3"> Neutral</label> <br>
                        <label class="radio-inline" for="radios-4_<%=dto2.getHmQNum()%>"><input class="multi<%=txtcnt %>" name="radios_<%=dto2.getHmQNum()%>" id="radios-4_<%=dto2.getHmQNum()%>" type="radio" value="4"> Agree</label> <br>
                        <label class="radio-inline" for="radios-5_<%=dto2.getHmQNum()%>"><input class="multi<%=txtcnt %>" name="radios_<%=dto2.getHmQNum()%>" id="radios-5_<%=dto2.getHmQNum()%>" type="radio" value="5"> Strongly Agree</label> 
                        
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
                        
                     </div>
                        <%
                        } else if (dto2.getHmQType().equals("A")) {
                     %>
                     <div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 " style="text-indent:20px;">
                     <label class="radio-inline" for="radios-1_<%=dto2.getHmQNum()%>">
                     <input name="radios_<%=dto2.getHmQNum()%>"    id="radios-1_<%=dto2.getHmQNum()%>" type="radio" value="1" onclick="hide()" required> Strongly Disagree </label><br>
                     <label class="radio-inline" for="radios-2_<%=dto2.getHmQNum()%>">
                     <input name="radios_<%=dto2.getHmQNum()%>"   id="radios-2_<%=dto2.getHmQNum()%>" type="radio" value="2"   onclick="hide()"> Disagree </label><br>
                     <label class="radio-inline" for="radios-3_<%=dto2.getHmQNum()%>">
                     <input name="radios_<%=dto2.getHmQNum()%>"   id="radios-3_<%=dto2.getHmQNum()%>" type="radio" value="3" onclick="hide()"> Neutral </label><br>
                     <label class="radio-inline" for="radios-4_<%=dto2.getHmQNum()%>">
                     <input name="radios_<%=dto2.getHmQNum()%>"   id="radios-4_<%=dto2.getHmQNum()%>" type="radio" value="4" onclick="hide()"> Agree </label><br>
                     <label class="radio-inline" for="radios-5_<%=dto2.getHmQNum()%>">
                     <input name="radios_<%=dto2.getHmQNum()%>"   id="radios-5_<%=dto2.getHmQNum()%>" type="radio" value="5" onclick="hide()">Strongly Agree</label>
                     </div>
                     
               <%
                        } else if (dto2.getHmQType().equals("B")) {
                     %>
                  <div class="col-md-12">
                        <br> <input type="text" id="text_<%=dto2.getHmQNum()%>"
                           name="text_<%=dto2.getHmQNum()%>" value=""
                           style="height: 30px; width: 588px;" placeholder="Write Down" />
                     </div>
                     <%
                        }
                     %>
                     <%
                     }
                        for (int j = cnt + 1; j <= 15; j++) {
                  %>
                  <input type="hidden" name="radios_<%=j%>" value="">
                  <%
                     }
                  %>
               </fieldset>
               <input type="hidden" name="serialnum" name="serialnumen" value="">
               <br><button class="btn btn-primary btn-md" onclick="submit"><b>Submit</b></button><br><br>
               <%
                  }
               %>
             
            <!-- <button type="submit"name = "survey_finish">survey 완료</button> -->
 --%>            </form>

         </div>
         
<div class="col-sm-0 col-md-2 col-lg-2 col-xs-0 sidenav"></div>
      </div>
   </div>

   <jsp:include page="Footer.jsp" flush="true" />
<script>
   function Change2En(){
      
      var objParams={};
       $.post(
           "HmQEN", 
           objParams,
           function(retVal) {
                   var values=[];
                   values=retVal.list;
                   /* $('#HMquestionLegend').text('English'); */
                   $.each(values, function( index, value) {
                      var tmpId = "HMquestionLabel_"+(index+1);
                      $('#'+tmpId).text((index+1)+'. '+value);
                          $('#HMradiosLabel-1_'+(index+1)).text('Strongly Disagree');
                         $('#HMradiosLabel-2_'+(index+1)).text('Disagree');
                         $('#HMradiosLabel-3_'+(index+1)).text('Neutral');
                         $('#HMradiosLabel-4_'+(index+1)).text('Agree');
                         $('#HMradiosLabel-5_'+(index+1)).text('Strongly Agree');
                   });
                   $('#HMbuttonSubmit').text('Submit');
               }
       );
   }
   </script>
   <script>
   function Change2Kr(){
      
      var objParams={};
       $.post(
           "HmQKR", 
           objParams,
           function(retVal) {
                   var values=[];
                   values=retVal.list;
                  /*  $('#HMquestionLegend').text('국문'); */
                   $.each(values, function( index, value ) {
                      var tmpId = "HMquestionLabel_"+(index+1);
                     $('#'+tmpId).text((index+1)+'. '+value);
                          $('#HMradiosLabel-1_'+(index+1)).text('매우 아니다');
                         $('#HMradiosLabel-2_'+(index+1)).text('아니다');
                         $('#HMradiosLabel-3_'+(index+1)).text('보통이다');
                         $('#HMradiosLabel-4_'+(index+1)).text('그렇다');
                         $('#HMradiosLabel-5_'+(index+1)).text('매우 그렇다');
                   });
                   $('#HMbuttonSubmit').text('설문 제출');
               }                   
       );
   }
   </script>
</body>
</html>