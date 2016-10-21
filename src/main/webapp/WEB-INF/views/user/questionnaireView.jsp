<%@ page import="model.sql.ConnectionMysql" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!
    public ConnectionMysql connectionMysql = new ConnectionMysql();
    public String questionnaireId;
    public String sql;
    public ResultSet resultSet = null;
    public String userName;
%>
<%
    userName = (String) session.getAttribute("userName");

    questionnaireId = request.getParameter("questionnaireId");
    sql = "SELECT * FROM question\n" +
            "WHERE question.questionid IN \n" +
            "(SELECT connection.questionid FROM connection \n" +
            "WHERE " + questionnaireId + " = connection.questionnaireid)";
    resultSet = connectionMysql.doSelect(sql);
%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-2.2.3.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.validate.min.js"></script>


</head>
<body>

<div class="nav navbar-default">
    <div class="container-fluid">
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="/views/user/userView.jsp">主页</a></li>
                <li><a href="addQuestionnaire">创建问卷</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="javascript:form1.submit()">提交问卷</a></li>
                <li><a href="/views/mainView.jsp">退出登录</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="col-sm-offset-2 col-sm-8">
    <form name="form1" action="addAnswer" id="form1">
        <input type="hidden" value="<%=questionnaireId%>" name="questionnaireId">
        <input type="hidden" value="<%=userName%>" name="userName">
        <%
            String sql1 = "SELECT * FROM questionnaire\n" +
                    "WHERE questionnaireid = " + questionnaireId;
            ResultSet resultSet1 = connectionMysql.doSelect(sql1);

            while (resultSet1.next()) {
        %>
        <h1><%=resultSet1.getString("questionnairename")%>
        </h1><BR>

        <h3><%=resultSet1.getString("introduction")%>
        </h3>
        <%
            }
        %>

        <br>

        <div class="col-sm-12" style="height: 0; border: none; border: 3px solid #ffa54f">
        </div>

        <br>
        <br>

        <%
            resultSet = connectionMysql.doSelect(sql);

            while (resultSet.next()) {

                if (resultSet.getString("type").equals("单选")) {

        %>

        <input type="hidden" name="questionId" value="<%=resultSet.getInt("questionId")%>">

        <span class="label label-info"><%=resultSet.getString("type")%></span>

        <br>

        <p class="bg-primary"><%=resultSet.getString("question")%>
        </p>

        <%
            for (int i = 1; i <= 4; i++) {

                if (!(resultSet.getString("option" + i) == "")) {

        %>
        <label class="radio">
            <input type="radio" value="<%=i-1%>" name="<%=resultSet.getInt("questionid")%>">
        </label>

        <p><%=resultSet.getString("option" + i)%>
        </p>

        <%
                }
            }

        } else {
        %>

        <input type="hidden" name="questionId" value="<%=resultSet.getInt("questionId")%>">

        <span class="label label-info"><%=resultSet.getString("type")%></span>

        <br>

        <p class="bg-primary"><%=resultSet.getString("question")%>
        </p>

        <%
            for (int i = 1; i <= 4; i++) {

                if (!(resultSet.getString("option" + i) == "")) {

        %>
        <label class="checkbox">
            <input type="checkbox" value="<%=i-1%>" name="<%=resultSet.getInt("questionid")%>">
        </label>

        <p><%=resultSet.getString("option" + i)%>
        </p>

        <%
                        }
                    }
                }
            }
        %>
    </form>
</div>


</body>
</html>
