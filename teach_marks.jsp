<html>
<head>
	<title>View_Quiz</title>
</head>
<style>
body
{
	margin:0;
	padding:0;
	background-color:#6abadeba;
}
h1
{
	text-align:center;
	color:#277582;
	padding:26px;
}
</style>
<body>
	<%@page import="java.sql.*,java.io.*,java.util.*"%>
	<%@include file="teach_menu.jsp"%>
	<h1 align="center">Question</h1><br>
	<table border=1 align="center">
	<th>Id</th>
	<th>Marks</th>
	
		<%

		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");

			String qs = "select * from result";
			Statement smnt = con.createStatement();
			ResultSet res = smnt.executeQuery(qs);
			boolean flag = res.next();
			
			while(flag)
			{
			%>
			<tr>
			<td><%=res.getString(1)%></td>
			<td><%=res.getString(2)%></td>
			
			
			</tr>
			<%
			flag=res.next();
			}
		}catch(Exception e)
		{
			out.println(e);
		}
		
	%>
	
</table>
<br><br><br><br><br><br>

<br>
<%
	
		
%>

<%@include file="h.jsp" %><br/>
</body>
</html>
	
</body>
</head>