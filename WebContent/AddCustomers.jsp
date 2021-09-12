<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<%@page import="java.sql.ResultSet"%>
<%@page import="javax.xml.ws.Response"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbConnectivity.jsp" %>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String a=request.getParameter("AccNo");
int accno=Integer.parseInt(a);
int balance=Integer.parseInt(request.getParameter("balance"));
String qr="select AccountNo from Customer where Accountno=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setInt(1,accno);
ResultSet rs=ps.executeQuery();
if(rs.next()){
	%>
		<script>window.alert("account already exist")
		location="AddCustomer.html"
		
		</script>
		
		<%
}
else{
	qr="insert into Customer values(?,?,?,?)";
	ps=con.prepareStatement(qr);
	ps.setInt(1,accno);
	ps.setString(2,name);
	ps.setString(3,email);
	ps.setInt(4,balance);
	int i=ps.executeUpdate();
	if(i>0){
		%>
		<script>window.alert("Customer added")
		location="index.html"
		
		</script>
		
		<%
	}
}

%>
	
</body>
</html>