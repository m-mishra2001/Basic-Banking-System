<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbConnectivity.jsp"%>
<%
int tid=Integer.parseInt(request.getParameter("tid"));
String qr="delete from TransactionHistory where TransactionId=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setInt(1,tid);
int i=ps.executeUpdate();
if(i>0){
	%>
	<script>
	window.alert("Record Deleted");
	location="ShowTransactionHistory.jsp";
	</script>
	<%
}else{
	%>
	<script>
	window.alert("There may be some issue in deleting History ,Please try once again");
	location="ShowTransactionHistory.jsp";
	</script>
	<%
}
%>