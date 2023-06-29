<html>
<head>
<title>Registration Form</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="validate.js"></script>
</head>
<body>
<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<%@include file="f.jsp" %><br/>
<h1 align = "center">Register yourself</h1><br>
<form id="reg"  name="reg" method="post" action="Register.jsp" onsubmit="validate_reg()">
<table align="center">
<tr>
<td><label for="cat"><b>Choose a category:</b></label></td>
<td><select name="cat" id="cat">
<option value="teach">Teacher</option>
<option value="stud">Student</option>
</select></td></tr>
<tr>
<td> <label><b>Email Address</b></label> </td>
<td> <input type="text" name="Email"> </td>
</tr>
<tr>
<tr>
<td> <label><b>Username</b></label> </td>
<td> <input type="text" name="Uname"> </td>
</tr>
<tr>
<td> <label><b>Password</b></label> </td>
<td> <input type="Password" name="Pass"> </td>
</tr>
<tr>
<td> <label><b> Confirm Password</b></label> </td>
<td><input type="Password" name="Con_Pass"> </td></tr>
<tr><td colspan=2 align="center">

<input type="Submit" name="submit" value="SUBMIT" > <td></tr>
</table>
</form>
</div>
<%
String password1 = request.getParameter("Pass"); 
String password2 = request.getParameter("Con_Pass");

if (password1!=null  || password2!=null) 
{
    
    if (password1.equals(password2)) 
   {

		out.println("forward");
		if((request.getParameter("Email")!=null) && request.getParameter("Email")!=""&& (request.getParameter("Uname")!=null) &&
(request.getParameter("Pass")!=null) )
		{

			String cat = request.getParameter("cat");
			String Email = request.getParameter("Email");
			String Uname = request.getParameter("Uname");
			String Pass = request.getParameter("Pass");
			String CPass = request.getParameter("Con_Pass");
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
				String qs = "select id from quizeregister";
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
				String ins_qs = "insert into quizeregister values(?,?,?,?,?)";
				PreparedStatement psmnt = con.prepareStatement(ins_qs);
				psmnt.setInt(1,id);
				psmnt.setString(2,Uname);
				psmnt.setString(3,Pass);
				psmnt.setString(4,cat);
				psmnt.setString(5,Email);
	
				int i= psmnt.executeUpdate();

				if(i==0)
					out.println("insertion failed");

				else
					out.println("insertion success");
			}
			catch(Exception e)
			{
				out.println(e);
			}
		}
		
	}
	else
	{
		out.println("Please enter password and confirm password correct");
	}
}
%>
<br><br><br><br><br><br>
<%@include file="h.jsp" %><br/>
</body>
</html>