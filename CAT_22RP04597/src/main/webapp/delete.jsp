<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Employee Details</title>
</head>
<body>
<%
String url_22RP04597 = "jdbc:mysql://localhost:3306/emp_22RP04597";
String user_22RP04597 = "root"; 
String pass_22RP04597 = "";

    Connection conn_22RP04597 = null;
    Statement stmt_22RP04597 = null;
    ResultSet rs_22RP04597 = null;
    
    String empcode =request.getParameter("emp_id");
    String message="";
    
    if(empcode!=null){
    	try{
    		Class.forName("comm.mysql.cj.jdbc.Driver");
        	conn_22RP04597 =DriverManager.getConnection(url_22RP04597,user_22RP04597,pass_22RP04597);
        	
        	String sql_22RP04597 ="SELECT *FROM employee WHERE emp_id=?";
        	
        	pstmt = conn_22RP04597.prepareStatement(sql_22RP04597);
        	pstmt.setString(1,empcode);
        	int rowsAffected = pstmt.executeUpdate();
        	
        	if(rowsAffected>0){
        		message = "Employee deleted Successfully";
        	}
        	else{
        		message = "Employee notfound";
        	}
    	}
    	catch(Exception e){
    		message ="Error:"+e.getMessage();
    		
    	}
    	finally{
    		try{
        		if(rs_22RP04597!=null) rs_22RP04597.close();
        		if(stmt_22RP04597!=null) stmt_22RP04597.close();
        		if(conn_22RP04597!=null) conn_22RP04597.close();
        	}
        	catch(SQLException e){
        		e.printStackTrave();
        	}
    		}
    	}
    
    %>
    
    <div class="message"><%=message %></div>
    <br>
    
    <button <a href="dashboard.jsp" style="text-decoration:none; color:black">Return to Dashboard</a></button>
</body>
</html>