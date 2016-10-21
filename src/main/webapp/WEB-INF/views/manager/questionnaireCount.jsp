<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-2.2.3.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/Chart.min.js"></script>
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

<div class="col-sm-12">

    <%--<%--%>
    <%--String sql1 = "SELECT * FROM questionnaire\n" +--%>
    <%--"WHERE questionnaireid = " + questionnaireId;--%>
    <%--ResultSet resultSet1 = connectionMysql.doSelect(sql1);--%>

    <%--while (resultSet1.next()) {--%>
    <%--%>--%>
    <h1>${questionnaire.questionnaireName}
    </h1><BR>

    <h3>${questionnaire.introduction}
    </h3>

    <div class="col-sm-7">

        <c:forEach items="${questionList}" var="question">
            <c:if test="${question.type == '单选'}">

                <div class="answer">
                    <span class="label label-info">${question.type}</span>

                    <input type="hidden" value="${question.questionId}">

                    <br>

                    <p class="bg-primary">${question.question}
                    </p>

                    <c:if test="${!(question.option1 == '')}">
                        <label class="radio">
                            <input type="radio" value="1" name="${question.questionId}">
                        </label>

                        <p>${question.option1}
                        </p>
                    </c:if>

                    <c:if test="${!(question.option2 == '')}">
                        <label class="radio">
                            <input type="radio" value="2" name="${question.questionId}">
                        </label>

                        <p>${question.option2}
                        </p>
                    </c:if>

                    <c:if test="${!(question.option3 == '')}">
                        <label class="radio">
                            <input type="radio" value="3" name="${question.questionId}">
                        </label>

                        <p>${question.option3}
                        </p>
                    </c:if>

                    <c:if test="${!(question.option4 == '')}">
                        <label class="radio">
                            <input type="radio" value="4" name="${question.questionId}">
                        </label>

                        <p>${question.option4}
                        </p>
                    </c:if>

                    <br>
                </div>
            </c:if>

            <c:if test="${question.type == '多选'}">

                <div class="answer">
                    <span class="label label-info">${question.type}</span>

                    <input type="hidden" value="${question.questionId}">

                    <br>

                    <p class="bg-primary">${question.question}
                    </p>

                    <c:if test="${!(question.option1 == '')}">

                        <label class="checkbox">
                            <input type="checkbox" value="1" name="${question.questionId}">
                        </label>

                        <p>${question.option1}
                        </p>
                    </c:if>

                    <c:if test="${!(question.option2 == '')}">
                        <label class="checkbox">
                            <input type="checkbox" value="2" name="${question.questionId}">
                        </label>

                        <p>${question.option2}
                        </p>
                    </c:if>

                    <c:if test="${!(question.option3 == '')}">
                        <label class="checkbox">
                            <input type="checkbox" value="3" name="${question.questionId}">
                        </label>

                        <p>${question.option3}
                        </p>
                    </c:if>

                    <c:if test="${!(question.option4 == '')}">
                        <label class="checkbox">
                            <input type="checkbox" value="4" name="${question.questionId}">
                        </label>

                        <p>${question.option4}
                        </p>
                    </c:if>

                    <br>
                </div>
            </c:if>
        </c:forEach>


        <%--<%--%>
        <%--if (resultSet.getString("type").equals("单选")) {--%>
        <%--%>--%>
        <%--<h4><%=resultSet.getString("question")%>--%>
        <%--</h4>--%>

        <%--<%--%>
        <%--for (int i = 1; i <= 4; i++) {--%>

        <%--if (!(resultSet.getString("option" + i) == "")) {--%>

        <%--%>--%>
        <%--<label class="radio">--%>
        <%--<input type="radio" value="option1" name="<%=resultSet.getInt("questionid")%>">--%>
        <%--</label>--%>

        <%--<p><%=resultSet.getString("option" + i)%>--%>
        <%--</p>--%>
        <%--<%--%>
        <%--}--%>
        <%--}--%>
        <%--%>--%>
        <%--<%--%>

        <%--} else {--%>
        <%--%>--%>
        <%--<h4><%=resultSet.getString("question")%>--%>
        <%--</h4>--%>

        <%--<%--%>
        <%--for (int i = 1; i <= 4; i++) {--%>

        <%--if (!(resultSet.getString("option" + i) == "")) {--%>

        <%--%>--%>
        <%--<label class="checkbox">--%>
        <%--<input type="checkbox" value="option1" name="<%=resultSet.getInt("questionid")%>">--%>
        <%--</label>--%>

        <%--<p><%=resultSet.getString("option" + i)%>--%>
        <%--</p>--%>
        <%--<%--%>
        <%--}--%>
        <%--}--%>
        <%--}--%>
        <%--%>--%>

    </div>

    <div class="col-sm-5">

        <c:set var="option1" value="0"></c:set>
        <c:set var="option2" value="0"></c:set>
        <c:set var="option3" value="0"></c:set>
        <c:set var="option4" value="0"></c:set>

        <c:forEach items="${answerList}" var="answer">

            <c:if test="${answer.answer1 == '1'}">
                <c:set var="option1" value="${option1 + 1}"></c:set>
            </c:if>

            <c:if test="${answer.answer1 == '2'}">
                <c:set var="option2" value="${option1 + 1}"></c:set>
            </c:if>

            <c:if test="${answer.answer1 == '3'}">
                <c:set var="option3" value="${option1 + 1}"></c:set>
            </c:if>

            <c:if test="${answer.answer1 == '4'}">
                <c:set var="option4" value="${option1 + 1}"></c:set>
            </c:if>

            <canvas id="${answer.questionId}" width="250" height="250"></canvas>


            <script>
                var ctx = document.getElementById("${answer.questionId}");
                var myChart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: ["选项1", "选项2", "选项3", "选项4"],
                        datasets: [{
                            label: '# of Votes',
                            data: [${option1}, ${option2}, ${option3}, ${option4}],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                            ],
                            borderColor: [
                                'rgba(255,99,132,1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: false
                    }
                });
            </script>
        </c:forEach>

        <%--<%--%>
        <%--String sql2 = "SELECT * FROM answer WHERE connectionid IN\n" +--%>
        <%--"(SELECT id FROM connection\n" +--%>
        <%--"WHERE questionnaireid = " + questionnaireId +--%>
        <%--" AND questionid = " + resultSet.getInt("questionid") + ")";--%>
        <%--ResultSet resultSet2 = connectionMysql.doSelect(sql2);--%>

        <%--int option1 = 0;--%>
        <%--int option2 = 0;--%>
        <%--int option3 = 0;--%>
        <%--int option4 = 0;--%>


        <%--while (resultSet2.next()) {--%>
        <%--if (resultSet2.getString("answer1").equals("1")) {--%>
        <%--option1++;--%>
        <%--}--%>

        <%--if (resultSet2.getString("answer2").equals("1")) {--%>
        <%--option2++;--%>
        <%--}--%>

        <%--if (resultSet2.getString("answer3").equals("1")) {--%>
        <%--option3++;--%>
        <%--}--%>

        <%--if (resultSet2.getString("answer4").equals("1")) {--%>
        <%--option4++;--%>
        <%--}--%>

        <%--}--%>

        <%--%>--%>

        <%--<canvas id="${ans}" width="250" height="250"></canvas>--%>
        <%--<script>--%>
        <%--var ctx = document.getElementById("<%=resultSet.getInt("questionid")%>");--%>
        <%--var myChart = new Chart(ctx, {--%>
        <%--type: 'pie',--%>
        <%--data: {--%>
        <%--labels: ["选项1", "选项2", "选项3", "选项4"],--%>
        <%--datasets: [{--%>
        <%--label: '# of Votes',--%>
        <%--data: [<%=option1%>, <%=option2%>, <%=option3%>, <%=option4%>],--%>
        <%--backgroundColor: [--%>
        <%--'rgba(255, 99, 132, 0.2)',--%>
        <%--'rgba(54, 162, 235, 0.2)',--%>
        <%--'rgba(255, 206, 86, 0.2)',--%>
        <%--'rgba(75, 192, 192, 0.2)',--%>
        <%--],--%>
        <%--borderColor: [--%>
        <%--'rgba(255,99,132,1)',--%>
        <%--'rgba(54, 162, 235, 1)',--%>
        <%--'rgba(255, 206, 86, 1)',--%>
        <%--'rgba(75, 192, 192, 1)',--%>
        <%--],--%>
        <%--borderWidth: 1--%>
        <%--}]--%>
        <%--},--%>
        <%--options: {--%>
        <%--responsive: false--%>
        <%--}--%>
        <%--});--%>
        <%--</script>--%>
    </div>
    <%--<%--%>
    <%--}--%>
    <%--%>--%>
</div>
</body>
</html>
