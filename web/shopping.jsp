<%-- 
    Document   : shopping
    Created on : Jun 17, 2023, 1:44:02 PM
    Author     : PHUC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Fruits Store</title>
</head>
<body>
    <h1>My Store</h1>
    <form action="MainController" method="POST">
    <input type="submit" name="action" value="View"/>
</form>

    
    <form action="MainController" method="POST">
        <table border="1">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.FRUITS_LIST}" var="fruit">
                    <tr>
                        <td>${fruit.productID}</td>
                        <td>${fruit.productName}</td>
                        <td>${fruit.price} đ</td>
                        <td>
                            <input type="number" name="quantity_${fruit.productID}" min="1" max="10" value="1"/>
                        </td>
                        <td>
                            <input type="submit" name="action" value="Add"/>
                        </td>
                    </tr>
                   
                </c:forEach>
            </tbody>
        </table>
    </form>
    <c:if test="${not empty MESSAGE}">
    <div class="alert alert-success">
        ${MESSAGE}
    </div>
</c:if>

    
    <c:if test="${not empty requestScope.cartItems}">
        <h2>Cart</h2>
        <table>
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.cartItems}" var="cartItem">
                    <tr>
                        <td>${cartItem.productID}</td>
                        <td>${cartItem.productName}</td>
                        <td>${cartItem.price}</td>
                        <td>${cartItem.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
    </c:if>
</body>
</html>
