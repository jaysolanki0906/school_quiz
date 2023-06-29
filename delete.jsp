<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, java.util.*"%>
<%
String id= request.getParameter("id");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system", "manager");
Statement st=con.createStatement();
int i=st.executeUpdate("DELETE FROM quizques WHERE qid="+id);
response.sendRedirect("view_quiz.jsp");
//out.println("Data Deleted successfully!");
}
catch(Exception e)
{
out.println(e);
e.printStackTrace();
}
%>