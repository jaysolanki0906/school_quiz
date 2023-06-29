<HTML>
<BODY>
<%@ page import="java.sql.*,java.io.*,java.util.*,java.sql.*"%>
<%
	boolean log=false;
	String uname = request.getParameter("Uname");
	String pass = request.getParameter("Pass");
	String cat = request.getParameter("cat");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
		String qs="select * from Quizeregister where username=? and userpass=? and category=?";
		PreparedStatement psmnt= con.prepareStatement(qs);
		psmnt.setString(1,uname);
		psmnt.setString(2,pass);
		psmnt.setString(3,cat);
		ResultSet res = psmnt.executeQuery();
		log = res.next();
		if(log)
		{
			int id=res.getInt(1);
			session.setAttribute("s_uname",uname);
			session.setAttribute("s_cat",cat);
			session.setAttribute("s_id",id);
			
			out.println("Sucess Login moving to Quiz");
			response.sendRedirect("quiz.jsp");
			
		}
		else{
			out.println("Login Fail");
			response.sendRedirect("index.jsp");
			
		}
		
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
</BODY>
</html>