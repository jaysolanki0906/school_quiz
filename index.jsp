<html>
<head>
<title>Login Form</title>

<script type="text/javascript" src="validate.js"></script>    
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1 align="center">Login Page</h1><br>
<div class="login">
<form id="login" name="login" method="post" action="Login.jsp" onsubmit="validate_log()">
<label for="cat">Choose a category:</label>
<select name="cat" id="cat">
<option value="teach">Teacher</option>
<option value="stud">Student</option>
</select>
<br><br>
<label><b>User Name</b></label>
<input type="text" name="Uname" id="Uname" placeholder="Username">
<br><br>
<label><b>Password</b></label>
<input type="Password" name="Pass" id="Pass" placeholder="Password" >
<br><br>
<input type="submit" name="log" id="log" value="Log In Here">
<br><br>
<a href = "Register.jsp">New User </a>
<br><br>
<a href="#">Forgot Password</a>
</form>
</div>
</body>
</html>