<%@page import="java.sql.*" %>

<% 
        if(request.getParameter("id") != null)
        {
            String pid  = request.getParameter("id");
            
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            
            Class.forName("com.mysql.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app?serverTimezone=UTC","root","");
            
            pst = con.prepareStatement("delete from patients where pid = ?");
            pst.setString(1, pid);
            
            pst.executeUpdate();  
            
            %>
            <script>
                alert("Records Deleted");
            </script>
            
            <%
            
               String redirectURL = "patient-curd.jsp";
               response.sendRedirect(redirectURL);
            
        }
%>