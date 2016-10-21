<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-2.2.3.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.Page.min.js"></script>
    <script src="/js/jquery.validate.min.js"></script>
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

<div class="col-sm-offset-2 col-sm-8">

    <input type="hidden" value="<c:out value="${questionnaire.questionnaireId}" />" name="questionnaireId">

    <h1><c:out value="${questionnaire.questionnaireName}"/>
    </h1><BR>

    <h3><c:out value="${questionnaire.introduction}"/>
    </h3>

    <br>

    <div class="col-sm-12" style="height: 0; border: none; border: 3px solid #ffa54f">
    </div>

    <br>
    <br>

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

</div>

</body>
</html>
