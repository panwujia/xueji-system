<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>
<%! ResultSet rs; //定义结果集对象%>
<%! Statement stmt;//定义SQL语句对象 %>
<%! PreparedStatement pstmt;//定义SQL语句对象 %>
<%! String id,sql,sex; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>update</title>
</head>
<body bgcolor="#FBF7EC">
<%
id=request.getParameter("id").trim();
try{
	stmt=conn.createStatement();
	sql="select * from student where id='"+id+"'";
	rs=stmt.executeQuery(sql);
	while(rs.next()){
%>
<div align="center"> <font color="#31708F" size="5">修改记录</font> </div>
<br/>
<br/>
<form name="form1" method="post" action="update query.jsp?id=<%=id%>">
<table width="35%" border="1" cellspacing="0" cellpadding="0"  align="center"    >
<tr bgcolor=#FFFFFF>
<td width="50%" align="center">学号 </td>
<td width="50%"> &nbsp;&nbsp;&nbsp;<%=rs.getObject(1) %></td>
</tr>
<tr bgcolor=#FFFFFF>
<td width="50%" align="center">姓名 </td>
<td width="50%"> &nbsp;&nbsp;&nbsp;<input type="text" name="name" style="border:none" size="8" value=<%=rs.getObject(2) %>> </td>
</tr>
<tr bgcolor=#FFFFFF>
<td width="50%" align="center">性别</td>
<td width="50%"> &nbsp;&nbsp;&nbsp;
<%
sex=rs.getString(3).trim();
if(sex.equals("男")){
%>
<select name="sex" size="1" >
<option value="男" selected>男</option>
<option value="女" >女</option>
</select> 
<%
}
else{
%>
<select name="sex" size="1">
<option value="男" >男</option>
<option value="女" selected>女</option>
</select>
<%
}
%>
</td></tr>
<tr bgcolor=#FFFFFF>
<td width="50%" align="center">年龄 </td>
<td width="50%"> &nbsp;&nbsp;&nbsp;<input type="text" name="age" style="border:none"  size="2" value=<%=rs.getObject(4) %>> </td>
</tr>
<tr bgcolor=#FFFFFF>
<td width="50%" align="center">籍贯 </td>
<td width="50%"> &nbsp;&nbsp;&nbsp;<input type="text" name="jiguan" style="border:none"  size="7" value=<%=rs.getObject(5) %>> </td>
</tr>
<tr bgcolor=#FFFFFF>
<td width="50%" align="center">专业 </td>
<td width="50%"> &nbsp;&nbsp;&nbsp;<input type="text" name="zhuanye" style="border:none"  size="7" value=<%=rs.getObject(6) %>> </td>
</tr>
<tr bgcolor=#FFFFFF>
<td width="50%" align="center">班级 </td>
<td width="50%"> &nbsp;&nbsp;&nbsp;<input type="text" name="banji" style="border:none"  size="7" value=<%=rs.getObject(7) %>> </td>
</tr>
<tr bgcolor=#FFFFFF>
<td width="50%" align="center">民族</td>
<td width="50%"> &nbsp;&nbsp;&nbsp;<input type="text" name="minzu" style="border:none"  size="7" value=<%=rs.getObject(8) %>> </td>
</tr>
<tr align="center" bgcolor=#F2F2F2>
<td  colspan="2" align="center" >
<input type="submit" name="Submit" value="提交" >&nbsp;&nbsp;
<input type="reset" name="reset" value="清空" >
</td>
</tr>

</table>
</form>
<%
}
rs.close();
stmt.close();
conn.close();
}
catch(Exception e){
	response.sendRedirect("err.jsp");
}
%>
</body>
</html>