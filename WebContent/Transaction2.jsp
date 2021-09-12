<%@page import="java.sql.Statement"%>
<%@page import="java.util.Random"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbConnectivity.jsp"%>
<%
int sender=Integer.parseInt(request.getParameter("saccno"));
int receiver=Integer.parseInt(request.getParameter("raccno"));
int amount=Integer.parseInt(request.getParameter("amount"));
String qr="select * from Customer where AccountNo=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setInt(1,sender);
ResultSet rs=ps.executeQuery();
if(rs.next()){
	int am=rs.getInt("Balance")-amount;
	qr="update Customer set Balance=? where AccountNo=?";
	ps=con.prepareStatement(qr);
	ps.setInt(1,am);
	ps.setInt(2,sender);
	int i=ps.executeUpdate();
	if(i>0){
		%>
		<script>window.alert("money deducted from sender's account")
		location="Transaction3.jsp?sender=<%=sender%>&&amount=<%=amount%>&&receiver=<%=receiver%>"
		</script>
		<% 
				    	
	}else{
		
		%>
		<script>window.alert("There may be some issue while Transaction please try again")</script>
		<%
	}
	
}


%>