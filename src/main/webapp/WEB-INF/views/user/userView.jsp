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
            "WHERE isrelease = 1";

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
    <div class="col-sm-12">
        <div class="hero-unit">
            <h1>问卷网</h1>

            <p></p>
        </div>

        <table class="table table-bordered">
            <tr>
                <td class="col-sm-10">名称</td>
                <td class="col-sm-2">操作</td>
            </tr>

            <%
                while (resultSet.next()) {

            %>
            <tr>
                <td class="col-sm-10"><%=resultSet.getString("questionnairename")%>
                </td>
                <td>
                    <a href="/views/user/questionnaireView.jsp?questionnaireId=<%=resultSet.getString("questionnaireid")%>">填写问卷</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>

    </div>
</div>

</body>
</html>
