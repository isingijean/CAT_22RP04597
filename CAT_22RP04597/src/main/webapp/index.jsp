<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>USER LOGIN</title>

</head>
<body>
<h1>EMPLOYEE MANAGEMENT SYSTEM</h1>
<form action="" method="POST">
<h2><center>Signin</center></h2>
<hr>
<input type="email" name="email" placeholder="Email"><br><br>
<input type="password" name="password" placeholder="Password"><br>
<input type="checkbox"><b>Remember Me</b><br>
<button name="submit">Login</button>
<% 
if(request.getParameter("submit")!=null){
	
	String email_22RP04597= request.getParameter("email");
	String password_22RP04597= request.getParameter("password");
	
	
	
	String url_22RP04597="jdbc:mysql://localhost:3306/emp_22rp04597";
	String user_22RP04597="root";
	String pass_22RP04597="";
	
	
	Connection conn_22RP04597=null;
	PreparedStatement pstmt_22RP04597 =null;
	ResultSet rs_22Rp04597 =null;
	
	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		conn_22RP04597 =DriverManager.getConnection(url_22RP04597,user_22RP04597,pass_22RP04597);
	
	String sql_22RP04597 ="SELECT *FROM employee WHERE email=? AND password=?";
	pstmt_22RP04597 =conn_22RP04597.prepareStatement(sql_22RP04597);
	
	pstmt_22RP04597.setString(1,email_22RP04597);
	pstmt_22RP04597.setString(2,password_22RP04597);
	
	rs_22RP04597 = pstmt_22RP04597.executeQuerry();
	
	if(rs_22RP04597.next()){
		HttpSession session = request.getSession();
		session.setAttribute(email_22RP04597,password_22RP04597);
		
		out.println("<h3>Login Successfull!</h3>");
		out.println("<p>Welcome,"+email_22RP04597+"!</p>");
		response.sendRedirect("dashbord.jsp");
	}
	else{
		out.println("<h3>Invalid Email or password!</h3>");
	}
	
	}
	
	catch(Exception e){
		out.println("<h3>Error: "+e.getMessage()+"</h3>");
	
	}
	finally{
		if(rs_22RP04597!=null) try{ rs_22RP04597.close();} catch(SQLException e){}
		if(pstmt_22RP04597!=null) try{ pstmt_22RP04597.close();} catch(SQLException e){}
		if(conn_22RP04597!=null) try{ conn_22RP04597.close();} catch(SQLException e){}
		}
		}
	
		

	%>
</form>
</body>
</html>