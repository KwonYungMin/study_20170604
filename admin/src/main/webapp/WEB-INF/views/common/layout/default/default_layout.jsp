

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="resources/bootstrap/css/bootstrap.css"> -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="~/Content/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css"  />
<!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->
<!-- <script src="/Content/bootstrap-select/bootstrap-select.min.js" ></script> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<title><tiles:insertAttribute name="title" ignore="true" /></title>

 <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
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
      .row.content {height:auto;} 
    }
  </style>

</head>

<body>
	<div>
		<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
			<div class="navbar-header">
		      <p class="navbar-text" style="font-size:2em;"><tiles:insertAttribute name="title" /></P>
		    </div>
<!-- 				<div style="float:left;width:150px;font-size:2em;"> -->
<%-- 					<tiles:insertAttribute name="title" /> --%>
<!-- 				</div> -->
				<div>
					<tiles:insertAttribute name="header" />
				</div>
			</div>
		</nav>
	</div>
	<div class="container-fluid text-center"> 
		<div class="row content">
			<tiles:insertAttribute name="left" />
<!-- 			<div class="col-sm-12 text-left" style="background-color:#000"> -->
<!-- 			<div class="pull-left"> -->
				<tiles:insertAttribute name="body" />
<!-- 			</div> -->
		</div>
	</div>
	
<!-- 	<div> -->
<%-- 		<tiles:insertAttribute name="left" /> --%>
<!-- 	</div> -->
		<tiles:insertAttribute name="footer" />

</body>
</html>
