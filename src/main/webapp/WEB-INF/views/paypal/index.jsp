<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>PayPal Integration</title>
</head>
<body>
<h1>Welcome to PayPal Integration</h1>
<form action="${pageContext.request.contextPath}/pay" method="post">
    <input type="hidden" name="method" value="paypal">
    <input type="hidden" name="intent" value="sale">
    <input type="hidden" name="currency" value="USD">
    <input type="hidden" name="description" value="Product Description">
    <input type="hidden" name="price" value="10.00">
    <button type="submit">Pay with PayPal</button>
</form>
</body>
</html>
