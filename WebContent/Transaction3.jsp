<%@page import="java.sql.Statement"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbConnectivity.jsp"%>
<%
int sender=Integer.parseInt(request.getParameter("sender"));
int amount=Integer.parseInt(request.getParameter("amount"));
int receiver=Integer.parseInt(request.getParameter("receiver"));
String qr="select * from Customer where AccountNo=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setInt(1,receiver);
ResultSet rs=ps.executeQuery();
if(rs.next()){
	int am=rs.getInt("Balance")+amount;
	qr="update Customer set Balance=? where AccountNo=?";
	ps=con.prepareStatement(qr);
	ps.setInt(1,am);
	ps.setInt(2,receiver);
	int i=ps.executeUpdate();
	if(i>0){

		int tid=1;
		qr="select TransactionId from TransactionHistory";
		Statement st=con.createStatement();
		ResultSet r=st.executeQuery(qr);
	    while(r.next()){
	    	tid=r.getInt("TransactionId");
	    }
	    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
		   LocalDateTime now = LocalDateTime.now();  
		   String Date=dtf.format(now);
	  String tqr="insert into TransactionHistory values(?,?,?,?,?)";
	  PreparedStatement p=con.prepareStatement(tqr);
	  tid+=1;
	  p.setInt(1,tid);
	  p.setInt(2,sender);
	  p.setInt(3,receiver);
	  p.setInt(4,amount);
	  p.setString(5,Date);
		int j=p.executeUpdate();
		if(j>0){
			%>
			<script>window.alert("Transaction done")
			location="ShowCustomer.jsp";
			</script>
			<%
		}
		
		
		
		
		
		
	}
	else{
		%>
		<script>window.alert("there may be some issue in transaction please try again ")</script>
		<%
	}
}

%>