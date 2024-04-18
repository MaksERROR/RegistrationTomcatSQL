<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Lo gin</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<form action="${pageContext.request.contextPath}/LoginServlet" method="post" class="LoginServlet">
    <h2>Login</h2>
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br><br>
    <input type="submit" value="Login" name="action">
    <p>${status}</p>
</form>
<p>Don't have an account? <a href="register.jsp">Register here</a>.</p>
</body>
<script>
    var formElements = document.querySelectorAll('form input');
    var errorMessage = document.getElementById('errorMessage');
    for (var i = 0; i < formElements.length; i++) {
        formElements[i].addEventListener('input', function() {
            errorMessage.style.display = 'none';
        });
    }
    var password = hashPassword(document.getElementById('password');

    const crypto = require('crypto');

    function hashPassword(password) {
        const hash = crypto.createHash('sha256');
        hash.update(password);
        const hashedPassword = hash.digest('hex');
        return hashedPassword;
    }
    <</script>
</html>