<!DOCTYPE html>
<html>
<head>
<title>
	Faculty Panel
</title>
<style>
	body
	{
		margin: 0;
		padding: 0;
		background-color:#6abadeba;
	}
	h1{
		text-align: center;
		color: #277582;
		padding: 26px;
	}
</style>
</head>
<body>
	<%@ page import="java.sql.*,java.io.*,java.util.*"%>
	<%@include file="teach_menu.jsp" %>
	<h1 align = "center">ADD QUESTIONS OVER HERE</h1><br>
	<form id="frm" method="post" action="new_quiz.jsp">
	<table align="center">
	<tr>
		<td> <label><b>Question</b></label> </td>
		<td> <input type="text" name="ques" id="ques" size="100"> </td>
	</tr>
	<tr>
		<td> <label><b>Option 1</b></label> </td>
		<td> <input type="text" name="opt1" id="opt1" size="100"> </td>
	</tr>
	<tr>
		<td><label><b>Option 2</b></label> </td>
		<td><input type="text" name="opt2" id="opt2" size="100"> </td>
	</tr>
	<tr>
		<td><label><b>Option 3</b></label> </td>
		<td><input type="text" name="opt3" id="opt3"size="100"> </td>
	</tr>
	<tr>
		<td> <label><b>Option 4</b></label> </td>
		<td><input type="text" name="opt4" id="opt4"size="100"> </td>
	</tr>
	<tr>
	
	<td>
		<label><b>Choose Correct Ans</b></label> </td>
	<td>
	<select name="ans" id="ans">
	<option value="opt1">Option 1</option>
	<option value="opt2">Option 2</option>
	<option value="opt3">Option 3</option>
	<option value="opt4">Option 4</option>
	</select>
	</td>
	<tr>
		<td colspan=2 align="center">
		<input type="submit" name="sub" id="sub" value="Submit"> </td>
	</tr>
	</table>
	</form>
	<%
		boolean ins=false;
		String ques = request.getParameter("ques");
		String opt1 = request.getParameter("opt1");
		String opt2 = request.getParameter("opt2");
		String opt3 = request.getParameter("opt3");
		String opt4 = request.getParameter("opt4");
		String ans = request.getParameter("ans");
		if(ques!="" && opt1!="" && opt2!="" && opt3!="" && opt4!="")
		{
			if(ques!=null && opt1!=null && opt2!=null && opt3!=null && opt4!=null)
			ins=true;
	
		}
		if(ins)
		{
			boolean log=false;
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");

				String qs = "select qid from QUIZQUES";
				Statement smnt = con.createStatement();
				ResultSet res = smnt.executeQuery(qs);
				boolean flag = res.next();
				int id=0;
				if(flag)
				{
					while(flag)
					{
						id = res.getInt(1);
						flag=res.next();
					}
					id=id+1;
				}
				else
				{
					id=1;
				}
				String ins_qs = "insert into QUIZQUES values(?,?,?,?,?,?,?)";
				PreparedStatement psmnt = con.prepareStatement(ins_qs);
				psmnt.setInt(1,id);
				psmnt.setString(2,ques);
				psmnt.setString(3,opt1);
				psmnt.setString(4,opt2);
				psmnt.setString(5,opt3);
				psmnt.setString(6,opt4);
				psmnt.setString(7,ans);
				int i= psmnt.executeUpdate();
				if(i==0)
					out.println("insertion failed");
				else
				{
					out.println("insertion success");
					response.sendRedirect("view_quiz.jsp");
				}
			}
			catch(Exception e)
			{
				out.println(e);
			}
		}
	%>
<br><br><br><br><br><br>
<%@include file="h.jsp" %><br/>
</body>
</html>