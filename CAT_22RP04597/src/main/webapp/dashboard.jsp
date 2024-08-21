<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to our dashboard</title>

</head>
<body>
<h2>Welcome sir!</h2>

<table border="1">
<tr>Employee Id</tr>
<tr>Username</tr>
<tr>Employee Password</tr>
<%
String url_22RP04597 = "jdbc:mysql://localhost:3306/emp_22RP04597";
String user_22RP04597 = "root"; 
String pass_22RP04597 = "";

    Connection conn_22RP04597 = null;
    Statement stmt_22RP04597 = null;
    ResultSet rs_22RP04597 = null;
    
    try{
    	Class.forName("comm.mysql.cj.jdbc.Driver");
    	conn_22RP04597 =DriverManager.getConnection(url_22RP04597,user_22RP04597,pass_22RP04597);
    	stmt_22RP04597 =conn_22RP04597.createStatement();
    	String sql_22RP04597 ="SELECT *FROM employee";
    	rs_22RP04597 =stmt_22RP04597.executeQuery(sql_22RP04597);
    	
    	while(rs_22RP04597.next()){
    		int id_22RP04597 =rs_22RP04597.getInt("emp_id");
    		String name_22RP04597 =rs_22RP04597.getString("emp_email");
    		String pas_22RP04597 =rs_22RP04597.getString("emp_pass");
    	
    	%>
    <tr>
    	
    	 <td><%=id_22RP04597 %></td>
    	 <td><%=name_22RP04597 %></td>
    	 <td><%=pass_22RP04597 %></td>
    	 <td><a href="update.jsp?emp_id=<%= id_22RP04597 %>">Update</a></td>
    	 <td><a href="delete.jsp?emp_id=<%= id_22RP04597 %>">Delete</a></td>
    </tr>
    	
    	<% 
    	}
    	}
    	catch(Exception e){
    		e.printStackTrace();
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
    

%>
</table>
</body>
</html>