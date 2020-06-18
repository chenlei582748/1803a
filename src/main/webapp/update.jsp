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
		$("#cid").val("${goods.cid}");
	})
})
</script>

<script type="text/javascript">
function update(){
	
	$.post("updateGoods",$("form").serialize(),function(data){
			
		if(data){
			alert("修改成功!");
			location.href="http://localhost:8080/findAll";
		}else{
			alert("修改失败!");
		}
			
	})
	
}
</script>
</head>
<body>
	<form action="#">
		<input type="hidden" name="gid" value="${goods.gid }">
		商品名称:<input type="text" name="gname" value="${goods.gname }"><br><br>
		
		生产日期:<input type="date" name="gtime" value="${goods.gtime }"><br><br>
		
		类别:<select id="cid" name="cid">
				<option value="">请选择</option>
			</select><br><br>
		<input type="button" value="修改" onclick="update()">
	</form>
</body>
</html>