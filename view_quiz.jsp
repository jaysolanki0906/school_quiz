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
	<th>Question</th>
	<th>Option1</th>
	<th>Option2</th>
	<th>Option3</th>
	<th>Option4</th>
	<th>Answer</th>
	
		<%

		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");

			String qs = "select * from QUIZQUES";
			Statement smnt = con.createStatement();
			ResultSet res = smnt.executeQuery(qs);
			boolean flag = res.next();
			
			while(flag)
			{
			%>
			<tr>
			<td><%=res.getString(2)%></td>
			<td><%=res.getString(3)%></td>
			<td><%=res.getString(4)%></td>
			<td><%=res.getString(5)%></td>
			<td><%=res.getString(6)%></td>
			<td><%=res.getString(7)%></td>
			<td><a href="delete.jsp?id=<%=res.getString("Qid")%>"><button type="button" class="delete">delete</button></a>
			<td><a href="update.jsp?id=<%=res.getString("Qid")%>"><button type="button" class="delete">Update</button></a>
			
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