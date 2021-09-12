<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="index.css">
        <!-- fontAwesome -->
        <link href="https://kit-pro.fontawesome.com/releases/v5.15.3/css/pro.min.css" rel="stylesheet">
   
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@700&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@300;700&display=swap" rel="stylesheet">
        <!-- alert -->
       
</head>
<body style="background-color: rgb(233, 229, 229);" class="showCustomer">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark d-flex" >
        <div class="container-fluid">
            <a class="navbar-brand" href="#" >Basic Banking System</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav justify-content-end navItems" style="margin-left: auto;">
                    <li class="nav-item ">
                        <a class="nav-link " aria-current="page" href="index.html" >Home</a>
                    </li>
                    <li class="nav-item">
                        
                        <a class="nav-link " aria-current="page" href="AddCustomer.html">Add New Customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " aria-current="page" href="ShowCustomer.jsp">View All Customer</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link " aria-current="page" href="ShowTransactionHistory.jsp">Transaction History</a>
                    </li>
                

                </ul>
               

                
            </div>
        </div>
    </nav>
	<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="dbConnectivity.jsp" %>
<div class="container">
	<div class="row">
		<div class="col col-md-12 col-sm-12 col-lg-12">
			<form action="SearchCustomer.jsp" method="post">
				<div class="form-group searchform container" style="display:flex; width:100%;">
					
					<input type="number" name="search" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Account Number to search any customer">
					<input type="submit" value="search">
				  </div>
			
			</form>
		</div>
	</div>
</div>

<%
int count=0;
String qr="select * from Customer ";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(qr);
if(rs.next())
{%>
	<!-- %><table border="2px">
	<th>Account Number</th>
	<th>Name</th>
	<th>E-Mail</th>
	<th>Current Balance</th>
	<th>Edit Information</th>
	<th>Transaction</th>
	<th>Delete Customer</th> -->
<div class="container">
	<div class="row">
		<div class="col col-md-12 col-lg-12 col-sm-12">
			<table class=" container table table-hover table-dark">
				<thead>
				  <tr><th scope="col">Sno.</th>
					<th scope="col">Account Number</th>
					<th scope="col">Name</th>
					<th scope="col">E-Mail</th>
					<th scope="col">Current Balance</th>
					<th scope="col">Edit Information</th>
					<th scope="col">Transaction</th>
					<th scope="col">Delete Customer</th>
					
		
				  </tr>
				</thead>
			<%
			do{
				%>
				<tr><th scope="col"><%=count+=1%></th>
					<td><%=rs.getString("AccountNo")%></td>
			<td><%=rs.getString("Name")%></td>
			<td><%=rs.getString("Email")%></td>
			<td><%=rs.getString("Balance")%></td>
			<td style="text-align: center;font-size: 25px;"><a href="UpdateInfo.jsp?accno=<%=rs.getInt("AccountNo")%>"><span style="color: rgb(239,239,239);" ><i class="fas fa-user-edit"></i></span></a></td>
			<td><a href="Transaction.jsp?accno=<%=rs.getString("AccountNo")%>"><button>Transaction</button></a></td>
			<td><a href="DeleteCustomer.jsp?accno=<%=rs.getInt("AccountNo")%>"><button>Delete Customer</button></a></td>
			</tr>
				<%
			}while(rs.next());
			
		
		}%></table>
		</div>
	</div>
</div>
	



	<footer class=" container d-flex flex-wrap justify-content-between align-items-center py-3 footertext  "  style="border-top: 2px solid grey;margin-top: 150px;" >
		<p class="col-md-4 mb-0 text-muted ftext">©2021  Basic Banking System  </p>
	
		<a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
		  <i class="fas fa-university ficons text-muted"></i>
		</a>
	
		<ul class="nav col-md-4 justify-content-end socialLinks">
			<li class="nav-item"><a href="https://www.instagram.com/tinker_m.m/?r=nametag" class="nav-link px-2 text-muted"><i class="fab fa-instagram-square"></i></a></li>
            <li class="nav-item"><a href="https://www.facebook.com/people/Muskan-Mishra/100040699641422/" class="nav-link px-2 text-muted"><i class="fab fa-facebook-square"></i></a></li>
            <li class="nav-item"><a href="https://www.linkedin.com/in/muskan-mishra-5ba1b11a4/" class="nav-link px-2 text-muted"><i class="fab fa-linkedin"></i></a></li>
             <li class="nav-item"><a href="#" class="nav-link px-2 text-muted"><i class="fab fa-twitter-square"></i></a></li>
          
		</ul>
	  </footer>
	</body>