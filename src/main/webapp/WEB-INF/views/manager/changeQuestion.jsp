<%@ page import="java.sql.ResultSet" %>
<%@ page import="model.sql.ConnectionMysql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public String sql = "";
    public ConnectionMysql connectionMysql = new ConnectionMysql();
    public ResultSet resultSet = null;
%>

<%
    String questionId = request.getParameter("questionId");
    sql = "SELECT * FROM questionnaire\n" +
            "WHERE questionnaireid IN \n" +
            "      (SELECT questionnaireid FROM connection\n" +
            "      WHERE questionid = " + questionId + ")";
    resultSet = connectionMysql.doSelect(sql);

    if (!resultSet.next()) {
        response.sendRedirect("/views/manager/change.jsp?questionId="+questionId);
    }

    resultSet.beforeFirst();
%>

<html>
<head>
    <title>修改问题</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-2.2.3.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</head>
<body>

<div class="nav navbar-default">
    <div class="container-fluid">
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="/views/manager/managerView.jsp">主页</a></li>
                <li><a href="/views/manager/addQuestion.jsp">添加问题</a></li>
                <li><a href="addQuestionnaire">创建问卷</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="/views/mainView.jsp">退出登录</a></li>
            </ul>
        </div>
    </div>
</div>

<br>
<br>
<br>
<br>

<div class="container-fluid">
    <%
        while (resultSet.next()) {

    %>
    <h4>该问题已经在以下问卷中使用, 你可以继续</h4>
    <a class="btn bg-info" href="/views/manager/change.jsp?questionId=<%=questionId%>">修改</a>
    <p>修改会对所用问卷生效</p>
    <br>
    <%
            break;
        }
        resultSet.beforeFirst();
    %>

    <table class="table table-bordered">

        <tr>
            <td class="col-sm-8">问卷名称</td>
            <td class="col-sm-4">操作</td>
        </tr>

        <%
            while (resultSet.next()) {
        %>

        <tr>
            <td><%=resultSet.getString("questionnairename")%></td>
            <td></td>
        </tr>

        <%
            }
        %>

    </table>

</div>

</body>
</html>
