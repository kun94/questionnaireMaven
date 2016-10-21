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
    sql = "SELECT * FROM question\n" +
            "WHERE questionid = " + questionId + "";
    resultSet = connectionMysql.doSelect(sql);
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

<div class="container-fluid">

    <%
        while (resultSet.next()) {
    %>

    <form name="form1" action="upDataQuestion" method="post" class="form-horizontal">
        <input type="hidden" value="<%=questionId%>" name="question.questionId">

        <div class="form-group">
            <label class="c col-sm-2 control-label">题目</label>

            <div class="col-sm-10">
                <input name="question.question" class="form-control" value="<%=resultSet.getString("question")%>">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">选项1</label>

            <div class="col-sm-8">
                <input name="question.option1" class="form-control" value="<%=resultSet.getString("option1")%>">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">选项2</label>

            <div class="col-sm-8">
                <input name="question.option2" class="form-control" value="<%=resultSet.getString("option2")%>">
            </div>

        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">选项3</label>

            <div class="col-sm-8">
                <input name="question.option3" class="form-control" value="<%=resultSet.getString("option3")%>">
            </div>

        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">选项4</label>

            <div class="col-sm-8">
                <input name="question.option4" class="form-control" value="<%=resultSet.getString("option4")%>">
            </div>
        </div>
    </form>

    <div class="form-group">
        <div class="col-sm-offset-8">
            <a href="javascript:form1.submit()" type="submit" class="btn btn-primary">提交</a>
        </div>
    </div>

    <%
        }
    %>


</div>

</body>
</html>
