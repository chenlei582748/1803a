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
</script>
<script type="text/javascript">

	$(function(){
		
	
	$.post("queryCategory",function(data){
		var str="";
		for ( var i in data) {
			str+="<option value='"+data[i].cid+"'>"+data[i].cname+"</option>";
		}
		$("#cid").append(str);
		$("#cid").val("${map.cid}");
	})
})
</script>
</head>
<body>
	 <form action="findAll" method="post">
	 	商品名称：<input type="text" name="gname" value="${map.gname }">
	 	上架时间：<input type="date" name="startTime" value="${map.startTime }">-
	 	<input type="date" name="endTime" value="${map.endTime }">
	 	类别：<select id="cid" name="cid">
	 		<option value="">请选择</option>
	 	</select>
	 	<input type="submit" value="搜索">
	 </form>
	 

 
	 <table>
	 	<tr>
	 		<td colspan="10">
	 			<a href="add.jsp"><input type="button" value="添加"></a>
	 		</td>
	 	</tr>
	 	
	 	<tr>
	 		<td>编号</td>
	 		<td>商品名称</td>
	 		<td>分类</td>
	 		<td>上架时间</td>
	 		<td>操作</td>
	 	</tr>
	 	
	 	<c:forEach items="${page.list }" var="g">
	 	<tr>
	 		<td>${g.gid }</td>
	 		<td>${g.gname }</td>
	 		<td>${g.cname }</td>
	 		<td>${g.gtime }</td>
	 		<td>
	 			<a href="toUpdate?gid=${g.gid }"><input type="button" value="修改"></a>
	 		</td>
	 	</tr>
	 	</c:forEach>
	 	
	 	<tr>
	 		<td colspan="10">
	 			当前${page.pageNum }/${page.pages }页
	 			<a href="?pageNum=1">首页</a>
	 			<a href="?pageNum=${page.pageNum-1<1?page.pageNum:page.pageNum-1 }">上一页</a>
	 			<a href="?pageNum=${page.pageNum+1>page.pages?pageNum:page.pageNum+1 }">下一页</a>
	 			<a href="?pageNum=${page.pages }">尾页</a>
	 		</td>
	 	</tr>
	 </table>
</body>
</html>