<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
    <head>
        <title>student informations</title>
    </head>
    <body>
        <h2><p>Welcome <%=request.getParameter("name")%>...<br></p></h2>
   		<TABLE  WIDTH="30%">
              <tr width="100%">
                             <tr>
                    <td width="50%">Stream</td>
                    <td width="50%"><%=request.getParameter("stream")%></td>
                </tr>
                <tr>
                    <td>Car</td>
                    <td><%=request.getParameter("s1")%></td>
                </tr>
                
				<tr><td></td><td align="right">
			 
			</td>
	    </tr>
        </table>   
    </body>
</html>