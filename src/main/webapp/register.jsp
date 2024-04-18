<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
    <h2>Registration</h2>
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br>
    <label>Email:</label><br>
    <input type="email" name="email" required><br>
    <label>Password:</label><br>
    <input type="password" name="password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required><br>
    <label>Repeat password:</label><br>
    <input type="password" name="confirm_password" id="confirm_password" placeholder="Repeat your password"
           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required><br>
    <p>${status}</p>
    <input type="submit" value="Register" name="action">
</form>
<script>
    function validatePassword(){
        var password = document.getElementById("password");
        var confirm_password = document.getElementById("confirm_password");
        if(password.value !== confirm_password.value) {
            confirm_password.setCustomValidity("Пароли не совпадают");
        } else
            confirm_password.setCustomValidity('');
    }
    var password = document.getElementById("password");
    var confirm_password = document.getElementById("confirm_password");
    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;

    password = hashPassword(password);

    const crypto = require('crypto');

    function hashPassword(password) {
        const hash = crypto.createHash('sha256');
        hash.update(password);
        const hashedPassword = hash.digest('hex');
        return hashedPassword;
    }
</script>
<p>Already have an account? <a href="login.jsp">Login here</a>.</p>
</body>
</html>