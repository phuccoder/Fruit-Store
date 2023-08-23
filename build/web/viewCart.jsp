<%-- 
    Document   : viewCart
    Created on : Jun 17, 2023, 1:55:02 PM
    Author     : PHUC
--%>

<%@page import="sample.shopping.Fruits"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping cart</title>
    </head>
    <body>
        <h1>Your selected product</h1>
        <%
            Cart cart= (Cart) session.getAttribute("CART");
            if(cart !=null){
                if(cart.getCart().size()>0){
        %>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Edit</th>
                                <th>Remove</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                int count =1;
                                double total = 0;
                                for( Fruits elem : cart.getCart().values()){
                                    total += elem.getQuantity() * elem.getPrice();
                                   
                            %>
                        <form action="MainController" method="POST">
                            <tr>
                                <td><%= count++ %> </td>
                                <td>
                                    <input type="text" name="id" value="<%= elem.getProductID() %>" readonly=""/>
                                </td>
                                <td><%= elem.getProductName() %></td>
                                <td><%= elem.getPrice() %></td>
                                <td>
                                    <input type="number" name="quantity" value="<%= elem.getQuantity() %>" min="1" required=""/>
                                </td>
                                <!--Edit here---->
                                <td>
                                    <input type="submit" name="action" value="Edit"/>
                                </td>
                                
                                <!--Remove here-->
                                <td>
                                    <input type="submit" name="action" value="Remove"/>
                                </td>
                                <td><%= elem.getQuantity()* elem.getPrice() %></td>
                            </tr>
                        </form>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                                <h1> Total: <%= total %> $</h1>
        <%
            }
        } 
            %>
            <form action="MainController" method="POST">
                   <input type="submit" name="action" value="Logout"/>
            </form>
            <a href ="shopping.jsp">Add more </a>    
            
    </body>
</html>
