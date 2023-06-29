<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html> 
    <head> 
        <title>Create table in mysql database using jsp</title>
    </head> 
    <body >
        <form action="show_data.jsp" method="get">
            <TABLE  >
               
                <tr>
                    <td >Color</td>
                    <td ><input type="radio" name="stream" 
                        value="Green">green</td>
                    <td width="30%"><input type="radio" name="stream" value="Red" 
					    checked>Red</td>
                    <td ><input type="radio" name="stream" value="Blue">
					    Blue</td>
                </tr>
				<tr>
					<td>CAR</td>
					<td ><input type="radio" name="s1" 
                        value="Wagnor">Wagnor</td>
                    <td ><input type="radio" name="s1" value="ertiga" 
					    >ertiga</td>
                    <td ><input type="radio" name="s1" value="mercidies">
					   mercidies</td>
					
				</tr>
                
                
				<tr><td></td><td></td>
				<td><input type="submit" name="submit" value="submit"></td></tr>
            </TABLE>
        </form>
    </body> 
</html>