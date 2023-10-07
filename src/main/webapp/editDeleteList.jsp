
<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="header.html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
span{
text-align:center;
}
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<br>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{%>
<center><font color="red" size="5">Successfully Updated</font></center>
<%
}
%>
<%

if("invalid".equals(msg))
{%>
<center><font color="red" size="5">Some thing went Wrong! Try Again!</font></center>
<%
}
%>
<%

if("deleted".equals(msg))
{%>
<center><font color="red" size="5">Successfully Deleted</font></center>
<%
}
%>
<span>
<table id="customers">
<tr>
<th>ID</th>
<th>Name</th>
<th>Father Name</th>
<th>Mother Name</th>
<th>Mobile Number</th>
<th>Gender</th>
<th>Email</th>
<th>Blood group</th>
<th>Address</th>
<th>Edit</th>
<th>Delete</th>
</tr>
<tr>
<%
try{
	Connection con= ConnectionProvider.getCon();
	Statement st=con.createStatement();
	String sql="SELECT * FROM donor";
	ResultSet rs=st.executeQuery(sql); 
	while(rs.next())
	{
%>
<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(8) %></td>
<td><%=rs.getString(9) %></td>
<td><a href="updateDonor.jsp?id=<%=rs.getString(1)%>">Edit</a></td>
<td><a href="deleteDonor.jsp?id=<%=rs.getString(1)%>">Delete</a></td>
</tr>
<%
	}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</table></span>
<br>
<br>
<br>
<br>
<h3><center>All Right Reserved @ BTech Boys :: 2023  </center></h3>

</body>
</html>