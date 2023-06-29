<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css"></head>
<body>
<%@include file="f.jsp" %><br/>
<%
String uname=(String)session.getAttribute("s_uname");
String cat=(String)session.getAttribute("s_cat");
if(cat.equals("teach"))
{
		out.println("inside match"+cat);
		response.sendRedirect("teach_menu.jsp");
}
	else
	{
		response.sendRedirect("Stud_menu.jsp");
	}
out.println("Welcome "+uname);
%>
<%@include file="h.jsp" %>
</body>
</html>