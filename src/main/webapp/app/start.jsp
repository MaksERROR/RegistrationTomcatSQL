<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Мой проект</title>
    `    <link rel="stylesheet" type="text/css" href="../css/start.css">
    `    <link rel="stylesheet" type="text/css" href="css/start.css">
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Добро пожаловать ${name}</h1>
        <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
            <input type="submit" value="Logout" name="action">
        </form>
    </div>
    <h2>О проекте</h2>
    <p>Данный проект реализует регистрацию с добвлением информации в базу данных,<br>а также вход с проверкой наличия аккаунта в базе данных.</p>
    <h2>Обо мне</h2>
    <p>Я студент третьего курса группы 10702421 Заяц Максим Викторович.</p>
    <p> Программист. Не в ладах с версткой.</p>
    <div class="footer">
        <p>© 2023 Мой сайт</p>
        <p>Этот сайт создан в рамках учебного проекта.</p>
        <p>Контактная информация: maksim198765432az@gmail.com</p>
    </div>
</div>
</body>
</html>