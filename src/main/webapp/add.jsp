<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- css -->
<link href="<%=request.getContextPath() %>/css/css.css" rel="stylesheet">
<!-- js -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		$.post("queryCategory",function(data){
			var str="";
			for ( var i in data) {
				str+="<option value='"+data[i].cid+"'>"+data[i].cname+"</option>";
			}
			$("#cid").append(str);
		})
	})

</script>

<script type="text/javascript">
	function add(){
		$.post("addGoods",$("form").serialize(),function(data){
			if(data){
				alert("添加成功");
				location.href="findAll";
			}else{
				alert("添加失败");
			}
		})
	}
</script>
</head>
<body>
	<form action="#">
		商品名称：<input type="text" name="gname"><br>
		生产日期：<input type="date" name="gtime"><br>
		类别：<select id="cid" name="cid">
			<option value="">请选择</option>
		</select><br>
		<input type="button" value="添加" onclick="add()">
	</form>
</body>
</html>