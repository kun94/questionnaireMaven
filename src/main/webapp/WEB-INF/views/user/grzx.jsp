<%@ page import="model.sql.ConnectionMysql" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!
    public String sql = "";
    public ConnectionMysql connectionMysql = new ConnectionMysql();
    public ResultSet resultSet = null;
%>

<%
    String userName = (String) session.getAttribute("userName");
    sql = "SELECT * FROM questionnaire\n" +
            "WHERE questionnaireid IN (SELECT questionnaireid FROM connection\n" +
            "WHERE id IN (SELECT connectionid FROM answer \n" +
            "WHERE username = '" + userName + "'))";

    resultSet = connectionMysql.doSelect(sql);
%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-2.2.3.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</head>
<body>

<div class="nav navbar-default">
    <div class="container-fluid">
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="/views/user/userView.jsp">主页</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><%=userName%><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/views/user/grzx.jsp">个人中心</a></li>
                        <li><a href="/views/user/myQuestionnaire.jsp">我的问卷</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="/views/mainView.jsp">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="container-fluid">

    <h2 class="col-sm-offset-2">个人中心</h2>

    <div class="col-sm-offset-2 col-sm-8" style="height: 0; border: none; border: 3px solid #ffa54f">
    </div>

    <br>
    <br>
    <br>

    <div class="col-sm-offset-2">
        <div class="well col-sm-2">
            <div class="list-group">
                <a href="/views/user/grzx.jsp" class="list-group-item active">基本信息</a>
                <a href="/views/user/changePassWord.jsp" class="list-group-item">修改密码</a>
                <a href="/views/user/questionManager.jsp" class="list-group-item">问卷管理</a>
            </div>
        </div>
        <div class="col-sm-8">

            <div class="col-sm-offset-2">
                <div class="col-sm-4"><h3>用户名</h3></div>
                <div class="col-sm-6"><h3><%=userName%>
                </h3>
                </div>
            </div>

            <br>
            <br>
            <br>

            <table class="table table-bordered">
                <tr>
                    <td class="col-sm-8">已经填写过的问卷</td>
                    <td class="col-sm-4">操作</td>
                </tr>

                <%
                    while (resultSet.next()) {
                %>

                <tr>
                    <td><%=resultSet.getString("questionnairename")%>
                    </td>
                    <td><a href="">查看统计</a></td>
                </tr>

                <%
                    }
                %>

            </table>
        </div>
    </div>

</div>

</body>
</html>
