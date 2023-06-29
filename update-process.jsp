<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<%@include file="teach_menu.jsp" %>
<%
String id = request.getParameter("id");
String ques=request.getParameter("ques");
String opt1=request.getParameter("opt1");
String opt2=request.getParameter("opt2");
String opt3=request.getParameter("opt3");
String opt4=request.getParameter("opt4");
String ans=request.getParameter("ans");
if(id != null)
{
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
		String sql="Update QUIZQUES set QUESTION=?,OPTION1=?,OPTION2=?,OPTION3=?,OPTION4=?, ANSWER=? where QID="+id;
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, ques);
		ps.setString(2, opt1);
		ps.setString(3, opt2);
		ps.setString(4, opt3);
		ps.setString(5, opt4);
		ps.setString(6, ans);
		int i = ps.executeUpdate();
		if(i > 0)
		{
			out.print("Record Updated Successfully");
			response.sendRedirect("view_quiz.jsp");
		}
		else
		{
			out.print("There is a problem in updating Record.");
		}
	}
	catch(SQLException sql)
	{
		request.setAttribute("error", sql);
		out.println(sql);
	}
}
%>