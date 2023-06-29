<html>
	<head>
	<title>Student Pannel</title>
	</head>
	<center><body>
	<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<%! int a[]=new int[12];
String name[] = new String[12];
int i;
int count=0;
%>
<%@include file="Stud_menu.jsp" %>
<h1 align = "center">Appear for quiz</h1><br>
<form id="att_quiz" method="post" action="att_quiz.jsp">
<table align="center" >
<%

try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection

con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");

String qs = "select * from QUIZQUES";
Statement smnt = con.createStatement();
ResultSet res = smnt.executeQuery(qs);
boolean flag = res.next();
i=0;
while(flag)
{
a[i]= res.getInt(1);

name[i] = "rad" + Integer.toString(a[i]);//rad1 rad2 rad3 rad4 rad5

%>

<tr>
<td><label><%= res.getString(2) %></label></td></tr>
<tr>
<td>
<input type="radio" name=<%= name[i] %> value= "opt1" />
<label for="opt1"><%=res.getString(3) %></label></td>
<tr>
<td>
<input type="radio" name=<%= name[i] %> + <%= i %> value="opt2" />
<label for="opt2"><%=res.getString(4) %></label>
</td>
</tr>
<tr>
<td>
<input type="radio" name=<%= name[i] %> value="opt3" />
<label for="opt3"><%=res.getString(5) %></label>
</td>
</tr>
<tr>
<td>
<input type="radio" name=<%= name[i] %> value="opt4" />
<label for="opt4"><%=res.getString(6) %></label>
</td>

<%

flag=res.next();
i++;
}
}
catch(Exception e)
{
out.println(e);
}

%>
<tr><td colspan=2 align="center">
<input type="Submit" name="Submit" value="confirm"> <td></tr>
</table>
</form>
<%
String x=request.getParameter("Submit");
out.println(x);
count=0;
if (x!=null)
{
int k;

int id = (Integer)session.getAttribute("s_id");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");

//inserting the answers given by students and counting the score
for(k=0;k<i;k++)
{
String ans = request.getParameter(name[k]);
String qs = "select answer from quizques where qid=" +a[k];
Statement smnt = con.createStatement();
ResultSet res = smnt.executeQuery(qs);
boolean flag = res.next();
if(flag)
{
if(res.getString(1).equals(ans))//ans is student given ans and res.getString(1) is the correct ans from db
{
count++;
}
}
String ins_ans = "insert into quiz_attempt values(?,?,?)";
PreparedStatement psmnt1 = con.prepareStatement(ins_ans);
psmnt1.setInt(1,id);
psmnt1.setInt(2,a[k]);
psmnt1.setString(3,ans);
int n = psmnt1.executeUpdate();
}
//inserting the result
String ins_score = "insert into result values(?,?)";
PreparedStatement psmnt2 = con.prepareStatement(ins_score);
psmnt2.setInt(1,id);
psmnt2.setInt(2,count);
int n= psmnt2.executeUpdate();
}
catch(Exception e)
{
out.println(e);
}
}
%>
<br><br><br><br><br><br>
<%@include file="h.jsp" %><br/>
	</body></center>
</html>