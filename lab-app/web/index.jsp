<%@page import="java.sql.*" %>

<%
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            
            Class.forName("com.mysql.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app?serverTimezone=UTC","root","");
            
            Statement st = con.createStatement();
            String strquery = "select count(pid) from patients";
            rs = st.executeQuery(strquery);
            String count = "";
            
            while(rs.next())
            {
                count = rs.getString(1);
            }
            
            
            

         %>





<jsp:include page="main/header.jsp" />  
<body>
  <!-- container section start -->
  <section id="container" class="">


    <header class="header dark-bg">
      <div class="toggle-nav">
        <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"><i class="icon_menu"></i></div>
      </div>

      <!--logo start-->
      <a href="index.jsp" class="logo">LAB <span class="lite">DISK</span></a>
      <!--logo end-->

      


    </header>
    <!--header end-->

    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu">
          <li class="active">
            <a class="" href="index.jsp">
                          <i class="icon_house_alt"></i>
                          <span>Dashboard</span>
                      </a>
          </li>
          
          <li>
            <a class="" href="patient/patient-curd.jsp">
                          <i class="icon_document_alt"></i>
                          <span>Patient</span>
                      </a>
          </li>
          
          
          
         
          <li>
            <a class="" href="logout.jsp">
                         <i class="icon_key_alt"></i> 
                          <span>Logout</span>
                      </a>
          </li>
          

       
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->

    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <!--overview start-->
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-laptop"></i> Dashboard</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
              <li><i class="fa fa-laptop"></i>Dashboard</li>
            </ol>
          </div>
        </div>
        
        

        <div class="row">
          <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
            <div class="info-box blue-bg">
              <i class="fa fa-users"></i>
              <div class="count"><% out.println(count);  %></div>
              <div class="title">Patients</div>
            </div>
            <!--/.info-box-->
          </div>
          <!--/.col-->
          
          <%
           
            
            ResultSet rs1;
            
           
            Statement st1 = con.createStatement();
            String strquery1 = "select count(distinct(pdoctor)) from patients";
            rs1 = st1.executeQuery(strquery1);
            String countd = "";
            
            while(rs1.next())
            {
                countd = rs1.getString(1);
            }
           
         %>


          
          
          <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
            <div class="info-box brown-bg">
              <i class="fa fa-shopping-cart"></i>
              <div class="count"><% out.println(countd); %></div>
              <div class="title">Doctors</div>
            </div>
            <!--/.info-box-->
          </div>
          <!--/.col-->
          
          <%
           
            
            ResultSet rs2;
            
            
            
            Statement st2 = con.createStatement();
            String strquery2 = "select sum(pbill) from patients";
            rs2 = st2.executeQuery(strquery2);
            String counttot = "";
            
            while(rs2.next())
            {
                counttot = rs2.getString(1);
            }
           
         %>
          <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
            <div class="info-box dark-bg">
              <i class="fa fa-thumbs-o-up"></i>
              <div class="count">Rs. <% out.println(counttot); %></div>
              <div class="title">Bill Amount</div>
            </div>
            <!--/.info-box-->
          </div>
          <!--/.col-->
              
          <!--/.col-->

        </div>
        <!--/.row-->


        <div class="row">
          <div class="col-lg-12 col-md-12">

            <div class="panel panel-default">
              
               
                 
            <section class="panel">
              <header class="panel-heading">
                Last 10 Details 
              </header>

              <table class="table table-striped table-advance table-hover">
                <tbody>
                  <tr>
                    <th> Patient ID</th>
                    <th> Name</th>
                    <th>Appointment </th>
                    <th>Technician</th>
                    <th>Amount</th>
                    <th><i class="icon_cogs"></i> Action</th>
                  </tr>
                   <%
                      
                   
                    ResultSet  rsa;
                    String Querya = "Select * from patients order by pid desc limit 10";
                    Statement sta = con.createStatement();
                    
                    rsa = sta.executeQuery(Querya);
                    
                    while(rsa.next())
                    {
                            String id = rsa.getString("pid");
                  %>
                  <tr>
                  <td> <%=rsa.getString("pid") %></td>
                    <td><%=rsa.getString("pname") %></td>
                    <td><%=rsa.getString("pappoinment") %></td>
                    <td><%=rsa.getString("ptechnician") %></td>
                    <td><%=rsa.getString("pbill") %></td>
                    <td>
                      <div class="btn-group">
                          <a class="btn btn-primary" href="patient/update.jsp?id=<%=id %>"><i class="icon_pencil-edit_alt"></i></a>
                        <a class="btn btn-success" href="patient/view.jsp?id=<%=id %>"><i class="arrow_expand_alt3"></i></a>
                        <a class="btn btn-danger" href="patient/delete.jsp?id=<%=id %>"><i class="icon_close_alt2"></i></a>
                      </div>
                    </td>
                  </tr>
                  
                  <%
                      }
                  %>
                </tbody>
              </table>
            </section>
          </div>
        </div>
              
          </div>
        


        </div>


        <!-- Today status end -->



      

        <!-- statics end -->




      
        

      </section>
      <div class="text-right">
        <div class="credits">
          <!--
            All the links in the footer should remain intact.
            You can delete the links only if you purchased the pro version.
            Licensing information: https://bootstrapmade.com/license/
            Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
          -->
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
      </div>
    </section>
    <!--main content end-->
  </section>
  <!-- container section start -->

  <jsp:include page="main/footer.jsp" />  