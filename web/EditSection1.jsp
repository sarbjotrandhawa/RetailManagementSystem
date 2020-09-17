

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>edit section</title>
    </head>
     <link href="all1.css" rel="stylesheet" type="text/css">
    <body>
            
             <div id="all">
            <%@include file="header.jsp" %>
              <%
                String s = (String) session.getAttribute("type");
                
                if (s != null && s.equals("employee")) {%>
            <%@include file="index.html" %>
            <%} else if (s != null && s.equals("admin")){
            %>
            <%@include file="index_1.html" %>

            <%    
                }
            %>
           <div id="main" >
               <center>
                   <h3 class="heading">EDIT SECTION</h3>
        
         <%  
             String sectionname = request.getParameter("secnm");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale","root","12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from sections where section_name='"+sectionname+"'");
            if(rs.next())
            {
         %>
    
          <form action="EditSection2.jsp" method="post">
            <table border ="0" style="margin-top: 30px" cellspacing="7">
                
                <tr>
                    <td>SECTION NAME</td>
                    <td><input type="text" name="secnm" value= "<%=rs.getString("section_name")%>" class="textbox"/></td>
                </tr>
                <tr>
                    <td>DESCRIPTION</td>
                    <td><input type="text" name="description" value="<%=rs.getString("description")%>" class="textbox"/></td>
                </tr>
                <tr>
                    <td>location</td>
                      <td><input type="text" name="location" value="<%=rs.getString("location")%>" class="textbox"/></td>
                </tr>
                <%
                System.out.println("Connection build");
                Statement stmt1 = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                System.out.println("statement created");
                ResultSet rs1 = stmt1.executeQuery("select * from adminlogin");
               
            %> 
                <tr>
                    <td>INCHARGE</td>
                    <td><select name="incharge" class="textbox" required>
                            <%
                                while (rs1.next()) {%>
                                <option value="<%=rs1.getString("username")%>"><%=rs1.getString("username")%></option> 
                            <%}%> </select></td>
                </tr> 
              
                <tr>
                    <td></td>
                    <td><input type="submit" value="save" class="submitstyle"/></td>
                </tr>
            </table>
            </form>
                <%
            }
           
                %>
              
                  </div>
            <%@include file="footer.jsp" %>
        </div>  
           
        </center>
    </body>
</html>
