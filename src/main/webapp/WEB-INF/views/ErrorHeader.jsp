<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>   
<style>
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
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
   height: 100%
}

/* Set gray background color and 100% height */
.sidenav {
   padding-top: 20px;
   background-color: #325C80;
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
      $("input:text").keydown(function(evt) {
         if (evt.keyCode == 13)
            return false;
      });
   });
</script>

<title></title>
</head>
<body>

</body>
</html>