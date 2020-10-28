<%@page import="java.sql.*" %>

<% 
        if(request.getParameter("submit") != null)
        {
            String pname  = request.getParameter("fullname");
            String paddress = request.getParameter("address");
            String pdate = request.getParameter("date");
            String ptest = request.getParameter("test");
            String ptech = request.getParameter("tech");
            String pdocter = request.getParameter("doctor");
            String pemail = request.getParameter("email");
            
            int bill = 0 ;
            
            if(request.getParameter("test").equals("Blood"))
            {
                bill = 1000;
            }
            else if(request.getParameter("test").equals("Urine"))
            {
                bill = 2000;
            }
            else if(request.getParameter("test").equals("ECG"))
            {
                bill = 3000;
            }
            
            
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            
            Class.forName("com.mysql.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app?serverTimezone=UTC","root","");
            
            pst = con.prepareStatement("INSERT INTO `patients`( `pname`, `paddress`, `pappoinment`, `ptypetest`, `ptechnician`, `pdoctor`, `pbill`, `pemail`) VALUES (?,?,?,?,?,?,?,?)");
            
            String sbill = Integer.toString(bill);
            
            pst.setString(1,pname);
            pst.setString(2, paddress);
            pst.setString(3,pdate);
            pst.setString(4,ptest);
            pst.setString(5,ptech);
            pst.setString(6,pdocter);
            pst.setString(7, sbill);
            pst.setString(8, pemail);
            
            pst.executeUpdate();  
            
            %>
            <script>
                alert("Record Added");
            </script>
            
            <%
            
            
        }
%>

<jsp:include page="../sub-main/header.jsp" />  
<body>
  <!-- container section start -->
  <section id="container" class="">


    <header class="header dark-bg">
      <div class="toggle-nav">
        <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"><i class="icon_menu"></i></div>
      </div>

      <!--logo start-->
      <a href="../index.jsp" class="logo">LAB <span class="lite">DISK</span></a>
      <!--logo end-->

      


    </header>
    <!--header end-->

    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu">
          <li >
            <a class="" href="../index.jsp">
                          <i class="icon_house_alt"></i>
                          <span>Dashboard</span>
                      </a>
          </li>
          
          <li class="active">
            <a class="" href="patient-curd.jsp">
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
            <h3 class="page-header"><i class="fa fa-laptop"></i> Patient</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="../index.jsp">Home</a></li>
              <li><i class="fa fa-laptop"></i>Patient</li>
            </ol>
          </div>
        </div>
        </div>
        <div class="row">
            
          <div class="col-lg-4">
            <section class="panel">
              <header class="panel-heading">
                Add Records
              </header>
              <div class="panel-body">
                <div class="form" method="post">
                  <form class="form-validate form-horizontal" id="feedback_form" method="get" action="">
                    <div class="form-group ">
                      <label for="cname" class="control-label col-lg-2">Full Name <span class="required">*</span></label>
                      <div class="col-lg-10">
                        <input class="form-control" id="cname" name="fullname" minlength="5" type="text" required />
                      </div>
                    </div>
                    <div class="form-group ">
                      <label for="cname" class="control-label col-lg-2">Address <span class="required">*</span></label>
                      <div class="col-lg-10">
                        <input class="form-control" id="caddress" name="address" minlength="5" type="text" required />
                      </div>
                    </div>
                    <div class="form-group ">
                      <label for="cname" class="control-label col-lg-2">Appointment Date<span class="required">*</span></label>
                      <div class="col-lg-10">
                        <input class="form-control" id="caddress" name="date"  type="date" required />
                      </div>
                    </div>
                      
                    <div class="form-group ">
                      <label for="cname" class="control-label col-lg-2">Test Type<span class="required">*</span></label>
                      <div class="col-lg-10">
                       <select name="test" class="form-control">
                            <option selected disabled>Choose here</option>
                              <option value="Blood"> Blood </option>
                              <option value="Urine"> Urine </option>
                              <option value="ECG"> ECG </option>
                          </select>
                      </div>
                    </div>
                      
                      
                     <div class="form-group ">
                      <label for="cname" class="control-label col-lg-2">Technician<span class="required">*</span></label>
                      <div class="col-lg-10">
                       <select name="tech" class="form-control"> 
                            <option selected disabled>Choose here</option>
                              <option value="Raja"> Raja </option>
                              <option value="Charu"> Charu </option>
                              <option value="Nishan"> Nishan </option>
                          </select>
                      </div>
                    </div>
                      
                      
                     <div class="form-group ">
                      <label for="cname" class="control-label col-lg-2">Doctor <span class="required">*</span></label>
                      <div class="col-lg-10">
                       <select name="doctor" class="form-control"> 
                              <option selected disabled>Choose here</option>
                              <option value="Mr.Karan"> Mr.Karan </option>
                              <option value="Mrs.Nima"> Mrs.Nima </option>
                              <option value="Mr.Muhilan"> Mr.Muhilan </option>
                          </select>
                      </div>
                    </div>
                      
                      
                    <div class="form-group ">
                      <label for="email" class="control-label col-lg-2">E-Mail <span class="required">*</span></label>
                      <div class="col-lg-10">
                        <input class="form-control " id="cemail" type="email" name="email" required />
                      </div>
                    </div>
                    
       
                    
                    <div class="form-group">
                      <div class="col-lg-offset-2 col-lg-10">
                        <input class="btn btn-primary"  name="submit" type="submit" value="Save">
                        <input class="btn btn-default" type="button" value="Cancel">
                      </div>
                    </div>
                  </form>
                </div>

              </div>
            </section>
          </div>
            
           <div class="col-lg-8">
            <section class="panel">
              <header class="panel-heading">
                ALL Details 
              </header>

              <table class="table table-striped table-advance table-hover">
                <tbody>
                  <tr>
                    <th><i class="icon_profile"></i> Patient ID</th>
                    <th><i class="icon_calendar"></i> Name</th>
                    <th><i class="icon_mail_alt"></i> Appointment </th>
                    <th><i class="icon_pin_alt"></i> Technician</th>
                    <th><i class="icon_mobile"></i> Amount</th>
                    <th><i class="icon_cogs"></i> Action</th>
                  </tr>
                  <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                      <div class="btn-group">
                        <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                        <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                        <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </section>
          </div>
        </div>
        <!-- project team & activity end -->

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

  <jsp:include page="../sub-main/footer.jsp" />  