<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="/resources/js/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>

<style>
	.cst_btn{
		width: 60px;
	    height: 27px;
	    padding: 0 !important;
	    line-height: 29px !important;
	    border: 1px solid #acacac;
	    border-radius: 5px;
	    color: #333;
	    background-color: #b8f0ff;
	    margin-left: 5px;
	}
	
</style>

<script type="text/javascript">
$(document).ready(function(){
// 	console.log(data);
// 	createTable();
	
// 	$('#addForm').reset();

	
	callAjax();
// 	var data = $('#memberform').serializeObject();
// 				console.log(data);
	$('input[name=userId]').focus();
	
});

	var searchObj = {			
// 			submitFlag : true,			
			searchAction : function(){				
				var data = $('#searchform').serializeObject();
// 				var data = "";
				console.log("loginAction");
				console.log(data);
				callAjax(data);
			}
	};
	
	function callAjax(data){
		$.ajax({
			url			: "/admin/serach.json",
			dataType	: "json", 
			type		: "POST", 
			data		: data, 
			success		: function(data, textStatus, jqXHR){
				// 결과값 처리
				console.log(data);
// 				console.log(data.test);
// 				console.log(data.testMap[0].ADMIN_ID);
				createTable(data);
			},
		
			error : function(){
				alert('에러');
			}
		});
	}
			
	
	function createTable(data){
		
// 		var col = "<tr>";
// 			col += "<td>아이디</td>";
// 			col += "<td>이름</td>";
// 			col += "</tr>";
		
// 		$("#table").find("thead").append(col);
		
		$('#table_body').empty();
		
		if(data.listAdminInfo == null || data.listAdminInfo.length == 0){
			
	 		var row = "<tr>";
	 		row += "<td colspan=\"16\" style=\"text-align:center\">조회되는 데이터가 없습니다.</td>";
	 		row += "</tr>";
		
			$("#table").append(row);
			
		} else {
			for(var i = 0; i <data.listAdminInfo.length; i++){
				
//	 			var row = "<tr>";
//	 			row += "<td>John</td>";
//	 			row += "<td>Doe</td>";
//	 			row += "<td>john@example.com</td>";
//	 			row += "</tr>";

				var row = "<tr>";
				row += "<td>"+data.listAdminInfo[i].ADMIN_ID+"</td>";
				row += "<td>"+data.listAdminInfo[i].ADMIN_PWD+"</td>";
				row += "<td>"+data.listAdminInfo[i].ADMIN_NM+"</td>";
				row += "<td>"+data.listAdminInfo[i].TEL_NO+"</td>";
				row += "<td>"+data.listAdminInfo[i].MOBILE_NO+"</td>";
				row += "<td>"+data.listAdminInfo[i].EMAIL+"</td>";
				row += "<td>"+data.listAdminInfo[i].ORG_NM+"</td>";
				row += "<td>"+data.listAdminInfo[i].USE_YN+"</td>";
				row += "<td>"+data.listAdminInfo[i].SYS_DIV_CD+"</td>";
				row += "<td>"+data.listAdminInfo[i].ADMIN_CD+"</td>";
				row += "<td>"+data.listAdminInfo[i].LOGIN_FAIL_CNT+"</td>";
				row += "<td>"+data.listAdminInfo[i].CRE_DT+"</td>";
				row += "<td>"+data.listAdminInfo[i].CRE_ID+"</td>";
				row += "<td>"+data.listAdminInfo[i].MOD_DT+"</td>";
				row += "<td>"+data.listAdminInfo[i].MOD_ID+"</td>";
				row += "<td><input type=\"checkbox\" name=\"checkMember_"+i+"\" value=\""+data.listAdminInfo[i].ADMIN_ID+"\"></td>";
// 				row += "<td><form:checkbox value=\"\"/></td>";
				row += "</tr>";
			
				$("#table").append(row);
			}
		}
	}
	
	var deleteObj = {			
			submitFlag : true,			
			deleteAction : function(){				
				var data = $('#tableform').serializeObject();
				console.log(data);
				$.ajax({
					url			: "/admin/delete.json",
					dataType	: "json", 
					type		: "POST", 
					data		: data, 
					success		: function(data, textStatus, jqXHR){
						// 결과값 처리
// 						console.log(data);
						alert('삭제 완료');
						callAjax();
					},
				
					error : function(){
						alert('에러');
					}
				});
			}
	};
	
	var addObj = {			
			submitFlag : true,			
			addAction : function(){				
				var data = $('#tableform').serializeObject();
				console.log(data);
				$.ajax({
					url			: "/admin/add.json",
					dataType	: "json", 
					type		: "POST", 
					data		: data, 
					success		: function(data, textStatus, jqXHR){
						// 결과값 처리
// 						console.log(data);
						alert('추가 완료');
						
// 						$("input[name=addId]").empty();
						$('#tableform')[0].reset();
						callAjax();
					},
				
					error : function(){
						alert('에러');
					}
				});
			}
	};
	
</script>

<div>
	<!-- 			<form class="navbar-form" style="margin-right:200px;"> -->
	<form class="navbar-form"  id="searchform" style="margin-right: 70px;">
		<ul class="nav navbar-nav navbar-right">
			<li><select name="selectItem" class="selectpicker"
				style="margin-right: 8px; height: 27px;">
					<option value="id">아이디</option>
					<option value="name">이름</option>
			</select></li>
			<li>
				<input type="text" name="keyword" class="span2"> 
				<!-- 				<a href="javascript:;" onclick = "search.searchAction();" class="btn-login">조회</a> -->
				<!-- 	<button type="button" class="btn" >조회</button> --> <!-- 					<a href="javascript:;" onclick = "loginObj.loginAction();" class="btn-login"> -->
				<!-- 						<button>조회</button>		 --> <!-- 					</a> -->
			</li>
			<li>
				<a href="javascript:;" onclick="searchObj.searchAction();" 
					class="cst_btn">조회</a>
<!-- 				<input type="checkbox" value="ab"> -->
			</li>
		</ul>
	</form>
</div>

<form id="tableform">
<div class="container" style="margin-top: 70px; text-align: left">
<div style="width:1000px;height:370px;overflow:auto">
	<table id="table" class="table table-bordered" >
	
		<thead style="background-color:#ced0d2;">
			<tr>
				<td>ADMIN_ID</td>
				<td>ADMIN_PWD</td>
				<td>ADMIN_NM</td>
				<td>TEL_NO</td>
				<td>MOBILE_NO</td>
				<td>EMAIL</td>
				<td>ORG_NM</td>
				<td>USE_YN</td>
				<td>SYS_DIV_CD</td>
				<td>ADMIN_CD</td>
				<td>LOGIN_FAIL_CNT</td>
				<td>CRE_DT</td>
				<td>CRE_ID</td>
				<td>MOD_DT</td>
				<td>MOD_ID</td>
				<td>체크</td>
			</tr>
		</thead>
		<tbody id="table_body">
		</tbody>
	</table>
	</div>
</div>

<div id="addForm">
	<ul class="nav navbar-nav navbar-right" style="margin-right: 70px;">
	
			<li>ID: <input type="text" name="addId" class="span2" style="width: 100px"></li>
			<li style="margin-left: 10px">PWD: <input type="password" name="addPass" class="span2" style="width: 100px"></li>
			<li style="margin-left: 10px">NM: <input type="text" name="addName" class="span2" style="width: 100px"></li>
			<li style="margin-left: 10px">T_NO: <input type="text" name="addTelNo" class="span2" style="width: 100px"></li>
			<li style="margin-left: 10px">M_NO: <input type="text" name="addMobileNo" class="span2" style="width: 100px"></li>

			<li><a href="javascript:;" onclick="addObj.addAction();" class="cst_btn">추가</a></li>

			<li><a href="javascript:;" onclick="deleteObj.deleteAction();" class="cst_btn">삭제</a></li>
		
	</ul>
</div>
</form>

