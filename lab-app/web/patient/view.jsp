
<%
  if( session.getAttribute("username") == null)
  {
               String redirectURL = "../index.jsp";
               response.sendRedirect(redirectURL);
  }

%> 

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Details View</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        
        <style>
            body {
    margin-top: 20px;
}
        </style>
<!------ Include the above in your HEAD tag ---------->
    </head>
    <body>
        <div class="container">
    <div class="row">
        <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
            <%
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            
            Class.forName("com.mysql.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app?serverTimezone=UTC","root","");
            
            String id  = request.getParameter("id");
            
            pst = con.prepareStatement("Select * from patients where pid = ?" );
            pst.setString(1, id);
            

            rs  = pst.executeQuery();
            
            while( rs.next())
            {   

         %>
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <address>
                        <strong>Testing Center</strong>
                        <br>
                        30, New Kalminai Road,
                        <br>
                        Kallady, Batticaloa,
                        <br>
                        <abbr title="Phone">P:</abbr> (94) 75 41 144 87
                    </address>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                    <p>
                        <em>Date: <%= (new java.util.Date()).toLocaleString()%></em>
                    </p>
                    <p>
                        <em>Receipt #: 3452267<%=rs.getString("pid") %></em>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="text-center">
                    <h1>Receipt</h1>
                </div>
                </span>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Patient Name</th>
                            <th>Test</th>
                            <th class="text-center">Price</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="col-md-9"><em><%=rs.getString("pname") %></em></h4></td>
                            <td class="col-md-1" style="text-align: center"> <%=rs.getString("ptypetest") %> </td>
                            <td class="col-md-1 text-center">Rs. <%=rs.getString("pbill") %></td>
                           
                        </tr>
                        
                        
                        <tr>
                            
                            <td>   </td>
                            <td class="text-right">
                            <p>
                                <strong>Subtotal: </strong>
                            </p>
                            <p>
                                <strong>Tax: </strong>
                            </p></td>
                            <td class="text-center">
                            <p>
                                <strong>Rs. <%=rs.getString("pbill") %></strong>
                            </p>
                            <p>
                                <strong>No</strong>
                            </p></td>
                        </tr>
                        <tr>
                           
                            <td>   </td>
                            <td class="text-right"><h4><strong>Total: </strong></h4></td>
                            <td class="text-center text-danger"><h4><strong>Rs. <%=rs.getString("pbill")   %></strong></h4></td>
                        </tr>
                    </tbody>
                </table>
                <input type="submit" value="print" onClick="window.print()" class="btn btn-success btn-lg btn-block"/> </td>
            </div>
        </div>
    </div>
            
              <%
                      }
              %>
              
              <a  href="patient-curd.jsp" ><p class="text-center" > HOME </p></a>
    </body>
</html>