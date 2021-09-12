<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbConnectivity.jsp"%>
<%
int accno=Integer.parseInt(request.getParameter("accno"));
String qr="delete from Customer where AccountNo=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setInt(1,accno);
int i=ps.executeUpdate();
if(i>0){
	%>
	<script>
	window.alert("Account Deleted");
	location="ShowCustomer.jsp";
	</script>
	<%
}else{
	%>
	<script>
	window.alert("there may be some issue in deleting this account please try again");
	location="ShowCutomer.jsp";
	</script>
	<%
;
}
%>