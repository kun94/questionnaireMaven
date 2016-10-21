<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-2.2.3.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>

    <script>
        function aa() {

            var questionnaire = {
                questionnaireId: "${questionnaire.questionnaireId}",
                questionnaireName: "",
                introduction: ""
            };

            questionnaire["questionnaireName"] = $("input[name=questionnaireName]").val();
            questionnaire["introduction"] = $("textarea[name=introduction]").val();


            $.ajax({
                url: "/managerr/updateQuestionnaire",
                data: {questionnaire: JSON.stringify(questionnaire)},
                type: "post",
                success: function (data) {
                    alert(data);
                },
                error: function (data) {
                    alert(data);
                }
            });

        }

        function bb(button) {


            var connection = {
                questionnaireId: "${questionnaire.questionnaireId}",
                questionId: ""
            };

            connection["questionId"] = button.value;

            $.ajax({
                url: "/managerr/addQuestionToQuestionnaire",
                data: {connection: JSON.stringify(connection)},
                success: function (data) {
                    window.location.href("/managerr/showChangeQuestionnaire/${questionnaire.questionnaireId}")
                },
                error: function (data) {
                    alert(data);
                }
            });

        }
    </script>

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
    <div class="col-sm-5">

        <table class="table table-bordered">
            <tr>
                <td class="col-sm-6">题目</td>
                <td class="col-sm-2">类型</td>
                <td class="col-sm-4">操作</td>
            </tr>

            <c:forEach var="question" items="${questionList}">
                <tr>
                    <td class="col-sm-6">${question.question}</td>
                    <td class="col-sm-2">${question.type}</td>
                    <td class="col-sm-4">
                        <a href="/managerr/addQuestionToQuestionnaire?questionnaireId=${questionnaire.questionnaireId}&questionId=${question.questionId}">添加</a>
                    </td>
                </tr>
            </c:forEach>
        </table>


    </div>
    <div class="col-sm-7">

        <input placeholder="在这输入问卷题目" class="form-control" type="text" name="questionnaireName"
               value="${questionnaire.questionnaireName}">

        <textarea placeholder="在这输入问卷简介" class="form-control" name="introduction" rows="5">${questionnaire.introduction}
        </textarea>

        <button onclick="aa()">保存</button>

        <div>

            <c:forEach items="${questions}" var="question">
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


    </div>
</div>

</body>
</html>
