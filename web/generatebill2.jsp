

<%@page import="java.util.ArrayList"%>
<%@page import="vmm.BillDetails"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                <%
                    int id = 0;

                    ArrayList<BillDetails> al = (ArrayList<BillDetails>) session.getAttribute("al");
                    String grandtotal = request.getParameter("grandtotal");
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Driverloaded successfully");
                    Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
                    System.out.println("Connection build");
                    Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    System.out.println("statement created");
                    ResultSet rs1 = stmt.executeQuery("select * from bill");
                    rs1.moveToInsertRow();

                    rs1.updateDouble("totalprice", Double.parseDouble(grandtotal));
                    rs1.updateString("supervisor", (String) session.getAttribute("un"));

                    rs1.insertRow();
                    Statement stmt1 = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs2 = stmt1.executeQuery("select max(billid)as max from bill");
                    if (rs2.next()) {
                        id = rs2.getInt("max");
                    }

                    Statement stmt2 = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs3 = stmt2.executeQuery("select * from billdetail ");

                    for (int i = 0; i < al.size(); i++) {
                        rs3.moveToInsertRow();
                        rs3.updateInt("bill_id", id);
                        rs3.updateString("barcode", al.get(i).barcode);
                        rs3.updateInt("quantity", al.get(i).qty);
                        rs3.updateDouble("price", al.get(i).price);
                        rs3.insertRow();
                    }
                
                %>
                <center>
                      <h3 class="heading">Search</h3>
                <form action="addpoint.jsp">
                  
                    <table style="margin-top: 40px" >
                        <tr>
                          
                            <td><input type="text" name="phone" placeholder="Enter mobile no." class="textsearch"/></td>
                    <input type="hidden" name="bid" value="<%=id%>"/>
                    <input type="hidden" name="gt" value="<%=grandtotal%>"/>
                    <td> <input type="submit" value="Check" class="submitstyle"/> </td>
                   
                    <td>  </form>
                    <form action="printbill.jsp" target="_blank">                                                 
                        <input type="submit" value="Skip" class="submitstyle"/> 
                    </form></td>
                    </tr>
                </table>
               </center>

         </div>
            <%@include file="footer.jsp" %>
        </div>  
    </body>
</html>
