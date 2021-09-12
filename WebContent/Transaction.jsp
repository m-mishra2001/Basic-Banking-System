<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
<body style="background-color: rgb(233, 229, 229);">
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
    <div class="container-fluid px-1 py-5 mx-auto" >
        <div class="row d-flex justify-content-center">
            <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
                <!-- <h3>Request a Demo</h3> -->
                <!-- <p class="blue-text">Just answer a few questions<br> so that we can personalize the right experience for you.</p> -->
                
                <%@include file="dbConnectivity.jsp"%>
<%
int accno=Integer.parseInt(request.getParameter("accno"));
%>  
                <div class="card bg-dark" >
                    <h5 class="text-center mb-4" style="color: white;">Enter The customer's Details Here</h5>
                    <form class="form-card" action="Transaction2.jsp"  method="post">
                        <div class="row justify-content-between text-left">
                            <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3" style="color: white;">Money Transfered from Account No.<span class="text-danger"> *</span></label> <input type="number" name="saccno" value=<%=accno %> id="fname"  placeholder="Enter sender's account number" onblur="validate(1)"> </div>
                            <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3" style="color: white;">Money Transfer To Account No.<span class="text-danger"> *</span></label> <select name="raccno" id="lname" class="racc" placeholder="select receiver's account number" onblur="validate(2)">
                            <option ></option>
                            <%
                            String qr="select AccountNo from Customer";
                            Statement st=con.createStatement();
                            ResultSet rs=st.executeQuery(qr);
                            if(rs.next()){
                            	
                            	do{
                            		if(rs.getInt("AccountNo")!=accno){
                            		%>
                            		<option><%=rs.getInt("AccountNo") %></option>
                            		<% 
                            		}}while(rs.next());
                            }
                            %>
                            </select> </div>
                        </div>
                        <div class="row  text-left" style="margin-left: auto;margin-right: auto; width: 70%;">
                            <div class="form-group col-12 flex-column d-flex"> <label class="form-control-label px-3" style="color: white;">Amount<span class="text-danger"> *</span></label> <input type="number" name="amount" id="email"  placeholder="" onblur="validate(3)"> </div>
                              </div>
                        
                          
                        
                        <div class="row justify-content-center">
                            <div class="form-group col-sm-6"> <button type="submit" class="btn-block  addbutton" >Perform Transaction</button> </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <footer class=" container d-flex flex-wrap justify-content-between align-items-center py-3 my-4 footertext" style="border-top: 2px solid grey;" >
        <p class="col-md-4 mb-0 text-muted ftext">©2021 Basic Banking System </p>
    
        <a href="/" class="col-md-4 d-flex align-itecenter justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
          <i class="fas fa-university ficons text-muted"></i>
        </a>
    
        <ul class="nav col-md-4 justify-content-end socialLinks">
         <li class="nav-item"><a href="https://www.instagram.com/tinker_m.m/?r=nametag" class="nav-link px-2 text-muted"><i class="fab fa-instagram-square"></i></a></li>
            <li class="nav-item"><a href="https://www.facebook.com/people/Muskan-Mishra/100040699641422/" class="nav-link px-2 text-muted"><i class="fab fa-facebook-square"></i></a></li>
            <li class="nav-item"><a href="https://www.linkedin.com/in/muskan-mishra-5ba1b11a4/" class="nav-link px-2 text-muted"><i class="fab fa-linkedin"></i></a></li>
             <li class="nav-item"><a href="#" class="nav-link px-2 text-muted"><i class="fab fa-twitter-square"></i></a></li>
          
        </ul>
      </footer>
    <script>
        
        function validate(val) {
    v1 = document.getElementById("fname");
    v2 = document.getElementById("lname");
    v3 = document.getElementById("email");
    v4 = document.getElementById("mob");
    
    
    flag1 = true;
    flag2 = true;
    flag3 = true;
    flag4 = true;
   
    
    if(val>=1 || val==0) {
    if(v1.value == "") {
    v1.style.borderColor = "red";
    flag1 = false;
    }
    else {
    v1.style.borderColor = "green";
    flag1 = true;
    }
    }
    
    if(val>=2 || val==0) {
    if(v2.value == "") {
    v2.style.borderColor = "red";
    flag2 = false;
    }
    else {
    v2.style.borderColor = "green";
    flag2 = true;
    }
    }
    if(val>=3 || val==0) {
    if(v3.value == "") {
    v3.style.borderColor = "red";
    flag3 = false;
    }
    else {
    v3.style.borderColor = "green";
    flag3 = true;
    }
    }
    if(val>=4 || val==0) {
    if(v4.value == "") {
    v4.style.borderColor = "red";
    flag4 = false;
    }
    else {
    v4.style.borderColor = "green";
    flag4 = true;
    }
    }
   
    
    
    flag = flag1 && flag2 && flag3 && flag4 ;
    
    return flag;
    }
    </script> 
</body>
</html>