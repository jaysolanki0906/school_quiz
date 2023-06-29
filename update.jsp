<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<%@include file="teach_menu.jsp" %>
<%
	String id = request.getParameter("id");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
		String qs = "select * from QUIZQUES where qid ="+id;
		Statement statement = con.createStatement();
		ResultSet resultSet = statement.executeQuery(qs);
		while(resultSet.next())
		{
%>
<html>
<body>
<h1>Update data from database in jsp</h1>
<form method="post" action="update-process.jsp">

<input type="hidden" name="id" value="<%=resultSet.getString("QID") %>">
Question:<input type="text" name="ques" value="<%=resultSet.getString("QUESTION") %>"><br>
Option 1:<input type="text" name="opt1" value="<%=resultSet.getString("OPTION1") %>"><br>
Option 2:<input type="text" name="opt2" value="<%=resultSet.getString("OPTION2") %>"><br>
Option 3:<input type="text" name="opt3" value="<%=resultSet.getString("OPTION3") %>"><br>
OPtion 4:<input type="text" name="opt4" value="<%=resultSet.getString("OPTION4") %>"><br>
Answer:<input type="text" name="ans" value="<%=resultSet.getString("ANSWER") %>"><br>
<br><br>
<input type="submit" value="submit">
</form>
<%
}
con.close();
} catch (Exception e) 
{
	e.printStackTrace();
}
%>
</body>
</html>