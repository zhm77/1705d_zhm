<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	function fenye(cpage){
<%-- 		location="<%=request.getContextPath()%>/list.do?cpage="+cpage --%>
			$("[name='cpage']").val(cpage);
			$("form").submit();
	}

</script>
</head>
<body>	
	<form action="<%=request.getContextPath() %>/list.do" method="post">
		<input type="hidden" name="cpage">
		用户名：<input type="text" name="mohu1" value="${map.mohu1 }">
		<input type="submit" >
	</form>
	<table>
		<tr>
			<td>编号</td>
			<td>姓名</td>
			<td>密码</td>
			<td>分数</td>
			<td>部门</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${list }" var="u">
			<tr>
				<td>${u.uid }</td>
				<td>${u.uname }</td>
				<td>${u.password }</td>
				<td>${u.score }</td>
				<td>${u.dname}</td>
				<td>操作</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="11">
				<input type="button" value="首页" onclick="fenye(1)">
				<input type="button" value="上一页" onclick="fenye(${pi.isIsFirstPage()?1:pi.getPrePage()})">
				<input type="button" value="下一页" onclick="fenye(${pi.isIsLastPage()?pi.getPages():pi.getNextPage()})">
				<input type="button" value="尾页" onclick="fenye(${pi.getPages()})">
			</td>
		
		</tr>
	</table>
</body>
</html>