<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: akonshina
  Date: 31.07.14
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
        ArrayList<String> mas=new ArrayList<String>();
        PreparedStatement preparedStatement = null;
        Connection connection = null;
        String url = "jdbc:mysql://127.0.0.1/cmj";
        //Имя пользователя БД
        String name = "forcmj";
        //Пароль
        String password = "superpass!23";
        try {
            //Загружаем драйвер
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Драйвер подключен");
            //Создаём соединение
            connection = DriverManager.getConnection(url, name, password);
            System.out.println("Соединение установлено");
            //Для использования SQL запросов существуют 3 типа объектов:
            //1.Statement: используется для простых случаев без параметров
            String subm= request.getParameter("submit");
            if(subm != null) {
                preparedStatement = connection.prepareStatement(
                        "INSERT INTO employee(fio,password,can_req,can_read,can_edit,can_create_user) values(?,?,?,?,?,?)");
                preparedStatement.setString(1, request.getParameter("fio"));
                preparedStatement.setString(2, request.getParameter("pass"));
                preparedStatement.setInt(3, request.getParameter("permission_register") == null ? 0 : 1);
                preparedStatement.setInt(4, request.getParameter("permission_read") == null ? 0 : 1);
                preparedStatement.setInt(5, request.getParameter("permission_edit") == null ? 0 : 1);
                preparedStatement.setInt(6, request.getParameter("permission_admin") == null ? 0 : 1);
                preparedStatement.executeUpdate();
            }
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT fio FROM employee");
            while (rs.next()) {
                mas.add(rs.getString("fio"));
            }
            pageContext.setAttribute("mas", mas);
        } catch (Exception ex) {
            ex.printStackTrace();
            //выводим наиболее значимые сообщения
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title>CompanyMedia</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/page1.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]>
    <script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Завершить администрирование</a></li>
            </ul>
        </div>
    </div>
</div>


<div class="container" style="padding: 40px 15px;">
        <div class="panel panel-default pull-left" style="width: 200px">
            <div class="panel-body">
                <form class="form" role="form">
                    <div class="form-group">
                        <label class="sr-only" for="fio">Логин</label>
                        <input class="form-control" id="fio" name="fio" placeholder="Введите логин">
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="pass">Пароль</label>
                        <input class="form-control" id="pass" name="pass" placeholder="Введите пароль">
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="permission_edit" value="1"> редактировать
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="permission_read" value="1"> читать
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="permission_register" value="1"> регистрировать
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="permission_admin" value="1">администрировать
                        </label>
                    </div>

                    <button type="submit" name="submit" value="submit" class="btn btn-primary">Добавить</button>
                </form>
            </div>
        </div>

        <div class="main col-md-8">

            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>ФИО</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${mas}" var="i">
                        <tr><td><c:out value="${i}"/></td></tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
