<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbConnectivity.jsp"%>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
int balance=Integer.parseInt(request.getParameter("balance"));
int accno=Integer.parseInt(request.getParameter("accno"));
String qr="Update Customer set Name=? ,Email=?,Balance=? where AccountNo=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1,name);
ps.setString(2,email);
ps.setInt(3,balance);

ps.setInt(4,accno);
int i=ps.executeUpdate();
if(i>0){
	
	%>
	<script>window.alert("Values Updated")
	window.location="ShowCustomer.jsp"
	</script>
	<%
	
}
else{
	%>
	<script>window.alert("There may be some issue !!,Values not updated")
	window.location="ShowCustomer.jsp"
	</script>
	<%
	
}

%>