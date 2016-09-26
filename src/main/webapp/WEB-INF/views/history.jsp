<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.sanhak.hrsurvey.domain.HmQuestionHistory"%>
<%@ page import="java.util.List"%>
<style>
h1, table {
   margin: auto;
}
</style>

</head>
<body>
   <%@ include file="Header.jsp"%>
   <center>
      <h1>Survey Qeustion Version - Detail</h1>
   </center>
   <br>
   <table border="1" width="70%">
      <tbody>
         <tr>
            <td style="font-size: 20px; text-align: center;"><b>Modification
                  Date</b></td>
            <td style="font-size: 20px; text-align: center;"><b>${history.getModDate()}</b></td>
            <td style="font-size: 20px; text-align: center;"><b>Version</b></td>
            <td style="font-size: 20px; text-align: center;"><b>${history.getVersion()}</b></td>
         </tr>
         <tr>
            <td rowspan="2">HM-1</td>
            <td colspan="3">${history.KR_Q_1}</td>
         </tr>
         <tr>
            <td colspan="3">${history.EN_Q_1}</td>
         </tr>
         <tr>
            <td rowspan="2">HM-2</td>
            <td colspan="3">${history.KR_Q_2}</td>
         </tr>
         <tr>
            <td colspan="3">${history.EN_Q_2}</td>
         </tr>
         <tr>
            <td rowspan="2">HM-3</td>
            <td colspan="3">${history.KR_Q_3}</td>
         </tr>
         <tr>
            <td colspan="3">${history.EN_Q_3}</td>
         </tr>
         <tr>
            <td rowspan="2">HM-4</td>
            <td colspan="3">${history.KR_Q_4}</td>
         </tr>
         <tr>
            <td colspan="3">${history.EN_Q_4}</td>
         </tr>
         <tr>
            <td rowspan="2">HM-5</td>
            <td colspan="3">${history.KR_Q_5}</td>
         </tr>
         <tr>
            <td colspan="3">${history.EN_Q_5}</td>
         </tr>
         <tr>
            <td rowspan="2">HM-6</td>
            <td colspan="3">${history.KR_Q_6}</td>
         </tr>
         <tr>
            <td colspan="3">${history.EN_Q_6}</td>
         </tr>
         <tr>
            <td rowspan="2">HM-7</td>
            <td colspan="3">${history.KR_Q_7}</td>
         </tr>
         <tr>
            <td colspan="3">${history.EN_Q_7}</td>
         </tr>
         <tr>
            <td rowspan="2">HM-8</td>
            <td colspan="3">${history.KR_Q_8}</td>
         </tr>
         <tr>
            <td colspan="3">${history.EN_Q_8}</td>
         </tr>
         <tr>
            <td rowspan="2">HM-9</td>
            <td colspan="3">${history.KR_Q_9}</td>
         </tr>
         <tr>
            <td colspan="3">${history.EN_Q_9}</td>
         </tr>
         <tr>
            <td rowspan="2">HM-10</td>
            <td colspan="3">${history.KR_Q_10}</td>
         </tr>
         <tr>
            <td colspan="3">${history.EN_Q_10}</td>
         </tr>
         <tr>
            <td rowspan="2">HM-11</td>
            <td colspan="3">${history.KR_Q_11}</td>
         </tr>
         <tr>
            <td colspan="3">${history.EN_Q_11}</td>
         </tr>
         <tr>
            <td rowspan="2">HM-12</td>
            <td colspan="3">${history.KR_Q_12}</td>
         </tr>
         <tr>
            <td colspan="3">${history.EN_Q_12}</td>
         </tr>
         <tr>
            <td rowspan="2">HM-13</td>
            <td colspan="3">${history.KR_Q_13}</td>
         </tr>
         <tr>
            <td colspan="3">${history.EN_Q_13}</td>
         </tr>
         <tr>
            <td rowspan="2">HM-14</td>
            <td colspan="3">${history.KR_Q_14}</td>
         </tr>
         <tr>
            <td colspan="3">${history.EN_Q_14}</td>
         </tr>
         <tr>
            <td rowspan="2">HM-15</td>
            <td colspan="3">${history.KR_Q_15}</td>
         </tr>
         <tr>
            <td colspan="3">${history.EN_Q_15}</td>
         </tr>
         <tr>
            <td rowspan="2">NH-1</td>
            <td colspan="3">${history2.KR_Q_1}</td>
         </tr>
         <tr>
            <td colspan="3">${history.EN_Q_1}</td>
         </tr>
         <tr>
            <td rowspan="2">NH-2</td>
            <td colspan="3">${history2.KR_Q_2}</td>
         </tr>
         <tr>
            <td colspan="3">${history2.EN_Q_2}</td>
         </tr>
         <tr>
            <td rowspan="2">NH-3</td>
            <td colspan="3">${history2.KR_Q_3}</td>
         </tr>
         <tr>
            <td colspan="3">${history2.EN_Q_3}</td>
         </tr>
         <tr>
            <td rowspan="2">NH-4</td>
            <td colspan="3">${history2.KR_Q_4}</td>
         </tr>
         <tr>
            <td colspan="3">${history2.EN_Q_4}</td>
         </tr>
         <tr>
            <td rowspan="2">NH-5</td>
            <td colspan="3">${history2.KR_Q_5}</td>
         </tr>
         <tr>
            <td colspan="3">${history2.EN_Q_5}</td>
         </tr>
         <tr>
            <td rowspan="2">NH-6</td>
            <td colspan="3">${history2.KR_Q_6}</td>
         </tr>
         <tr>
            <td colspan="3">${history2.EN_Q_6}</td>
         </tr>
         <tr>
            <td rowspan="2">NH-7</td>
            <td colspan="3">${history2.KR_Q_7}</td>
         </tr>
         <tr>
            <td colspan="3">${history2.EN_Q_7}</td>
         </tr>
         <tr>
            <td rowspan="2">NH-8</td>
            <td colspan="3">${history2.KR_Q_8}</td>
         </tr>
         <tr>
            <td colspan="3">${history2.EN_Q_8}</td>
         </tr>
         <tr>
            <td rowspan="2">NH-9</td>
            <td colspan="3">${history2.KR_Q_9}</td>
         </tr>
         <tr>
            <td colspan="3">${history2.EN_Q_9}</td>
         </tr>
         <tr>
            <td rowspan="2">NH-10</td>
            <td colspan="3">${history2.KR_Q_10}</td>
         </tr>
         <tr>
            <td colspan="3">${history2.EN_Q_10}</td>
         </tr>
         <tr>
            <td rowspan="2">NH-11</td>
            <td colspan="3">${history2.KR_Q_11}</td>
         </tr>
         <tr>
            <td colspan="3">${history2.EN_Q_11}</td>
         </tr>
         <tr>
            <td rowspan="2">NH-12</td>
            <td colspan="3">${history2.KR_Q_12}</td>
         </tr>
         <tr>
            <td colspan="3">${history2.EN_Q_12}</td>
         </tr>
         <tr>
            <td rowspan="2">NH-13</td>
            <td colspan="3">${history2.KR_Q_13}</td>
         </tr>
         <tr>
            <td colspan="3">${history2.EN_Q_13}</td>
         </tr>
         <tr>
            <td rowspan="2">HM-14</td>
            <td colspan="3">${history2.KR_Q_14}</td>
         </tr>
         <tr>
            <td colspan="3">${history2.EN_Q_14}</td>
         </tr>
         <tr>
            <td rowspan="2">NH-15</td>
            <td colspan="3">${history2.KR_Q_15}</td>
         </tr>
         <tr>
            <td colspan="3">${history2.EN_Q_15}</td>
         </tr>
         <tr>
            <td rowspan="2">REC-1</td>
            <td colspan="3">${history3.KR_Q_1}</td>
         </tr>
         <tr>
            <td colspan="3">${history3.EN_Q_1}</td>
         </tr>
         <tr>
            <td rowspan="2">REC-2</td>
            <td colspan="3">${history3.KR_Q_2}</td>
         </tr>
         <tr>
            <td colspan="3">${history3.EN_Q_2}</td>
         </tr>
         <tr>
            <td rowspan="2">REC-3</td>
            <td colspan="3">${history3.KR_Q_3}</td>
         </tr>
         <tr>
            <td colspan="3">${history3.EN_Q_3}</td>
         </tr>
         <tr>
            <td rowspan="2">REC-4</td>
            <td colspan="3">${history3.KR_Q_4}</td>
         </tr>
         <tr>
            <td colspan="3">${history3.EN_Q_4}</td>
         </tr>
         <tr>
            <td rowspan="2">REC-5</td>
            <td colspan="3">${history3.KR_Q_5}</td>
         </tr>
         <tr>
            <td colspan="3">${history3.EN_Q_5}</td>
         </tr>
         <tr>
            <td rowspan="2">NH-6</td>
            <td colspan="3">${history3.KR_Q_6}</td>
         </tr>
         <tr>
            <td colspan="3">${history3.EN_Q_6}</td>
         </tr>
         <tr>
            <td rowspan="2">REC-7</td>
            <td colspan="3">${history3.KR_Q_7}</td>
         </tr>
         <tr>
            <td colspan="3">${history3.EN_Q_7}</td>
         </tr>
         <tr>
            <td rowspan="2">REC-8</td>
            <td colspan="3">${history3.KR_Q_8}</td>
         </tr>
         <tr>
            <td colspan="3">${history3.EN_Q_8}</td>
         </tr>
         <tr>
            <td rowspan="2">REC-9</td>
            <td colspan="3">${history3.KR_Q_9}</td>
         </tr>
         <tr>
            <td colspan="3">${history3.EN_Q_9}</td>
         </tr>
         <tr>
            <td rowspan="2">REC-10</td>
            <td colspan="3">${history3.KR_Q_10}</td>
         </tr>
         <tr>
            <td colspan="3">${history3.EN_Q_10}</td>
         </tr>
         <tr>
            <td rowspan="2">REC-11</td>
            <td colspan="3">${history3.KR_Q_11}</td>
         </tr>
         <tr>
            <td colspan="3">${history3.EN_Q_11}</td>
         </tr>
         <tr>
            <td rowspan="2">REC-12</td>
            <td colspan="3">${history3.KR_Q_12}</td>
         </tr>
         <tr>
            <td colspan="3">${history3.EN_Q_12}</td>
         </tr>
         <tr>
            <td rowspan="2">REC-13</td>
            <td colspan="3">${history3.KR_Q_13}</td>
         </tr>
         <tr>
            <td colspan="3">${history3.EN_Q_13}</td>
         </tr>
         <tr>
            <td rowspan="2">REC-14</td>
            <td colspan="3">${history3.KR_Q_14}</td>
         </tr>
         <tr>
            <td colspan="3">${history3.EN_Q_14}</td>
         </tr>
         <tr>
            <td rowspan="2">REC-15</td>
            <td colspan="3">${history3.KR_Q_15}</td>
         </tr>
         <tr>
            <td colspan="3">${history3.EN_Q_15}</td>
         </tr>


         <!-- <history2><td colspan="4"><a href="./viewhistory" ><span>&nbsp;&nbsp;&nbsp;List(목록)&nbsp;&nbsp;&nbsp;</span></a></td></tr> -->
      </tbody>
   </table>
   <%-- <td>
          <a href="modifyContentView.do?idx=${content.idx}" class="btn" id="modify"><span>&nbsp;&nbsp;&nbsp;Modify(수정)&nbsp;&nbsp;&nbsp;</span></a>
          </td>
          <td>
          <a href="deleteContent.do?idx=${content.idx}" class="btn" id="delete"><span>&nbsp;&nbsp;&nbsp;Delete(삭제)&nbsp;&nbsp;&nbsp;</span></a>
            </td> --%>
</body>
</html>