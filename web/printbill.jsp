

<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vmm.BillDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>
        function   go()
        {
            window.print();
        }
    </script>

    <body onload="go()">

        <%

            double grandtotal = 0;
            int id = 0;
            ArrayList<BillDetails> al = (ArrayList<BillDetails>) session.getAttribute("al");

            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");

            Statement stmt1 = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs2 = stmt1.executeQuery("select date, max(billid)as max from bill");
            if (rs2.next()) {
                id = rs2.getInt("max");

            }

        %>
    <center>
        <h4 class="heading">WELLCOME TO OUR STORE</h4>
        <table class="CSSTableGenerator">
            <tr>
                <td>Bill no.</td>
                <td><%=id%></td>
            </tr>
            <tr>
                <td>date</td>
                <td><%=rs2.getString("date")%></td>
            </tr>
            <tr>
                <td>supervisor</td>
                <td><%=session.getAttribute("un")%></td>
            </tr>
        </table>
        <table border="4">
            <tr>
                <td>SR.NO</td>
                <td>PRODUCT NAME</td>
                <td>QUANTITY</td>
                <td>PRICE</td>
                <td>TOTAL PRICE</td>
            </tr>
            <%
                for (int i = 0; i < al.size(); i++) {%>
            <tr>
                <td><%=i + 1%></td>
                <td><%=al.get(i).productname%></td>
                <td><%=al.get(i).qty%></td>
                <td><%=al.get(i).price%></td>
                <td><%=al.get(i).tprice%></td>
            </tr>
            <%}%> 

        </table>


        <%

            for (int j = 0; j < al.size(); j++) {
                grandtotal = grandtotal + al.get(j).tprice;
            }
            String s = request.getParameter("points");
            String bid = request.getParameter("bid");
            if (s != null && bid != null) {
                grandtotal = grandtotal - Integer.parseInt(s);
                Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                System.out.println("statement created");
                ResultSet rs1 = stmt.executeQuery("select * from bill where billid='" + bid + "'");
                if (rs1.next()) {
                    rs1.updateDouble("totalprice", grandtotal);
                    rs1.updateRow();
                }
            }
        %>
        <h4>Grand total   <%=grandtotal%></h4>
       
    </center>
    <%session.setAttribute("al",null);%>
    <%@include file="footer.jsp" %>
</div>  
</body>
</html>
