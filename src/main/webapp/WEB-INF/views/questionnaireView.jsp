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

            var answers = new Array();

//            var answer = {
//                question: {
//                    0: "0",
//                    1: "0",
//                    2: "0",
//                    3: "0"
//                },
//            };

            var answer = {
                answer1: "0",
                answer2: "0",
                answer3: "0",
                answer4: "0",
                questionId: "0",
                questionnaireId: "${questionnaire.questionnaireId}",
            }

            for (var i = 0; i < $(".answer").length; i++) {
//                if (($("input[name='20']:checked").val());
//                var name = $(".answer")[i].children("input:hidden").value;
                var name = $(".answer")[i].children[1].value;
                answer["questionId"] = name;
                name = parseInt(name);
//                alert(name);
//                if ($(".answer")[i].children("span").innerHTML == "单选") {
                if ($(".answer")[i].children[0].innerHTML == "单选") {
//                    alert($("input[name=" + name + "]:checked").val());
                    answer["answer" + $("input[name=" + name + "]:checked").val()] = "1";
//                    alert(answer.question[0]);
                    answers.push(answer);
                }

//                if ($(".answer")[i].children("span").innerHTML == "多选") {
                if ($(".answer")[i].children[0].innerHTML == "多选") {

                    for (var j = 0; j < $("input[name=" + name + "]:checked").length; j++) {
                        answer["answer" + $("input[name=" + name + "]:checked")[j].value] = "1";
                    }
                    answers.push(answer);
                }

                answer = {
                    answer1: "0",
                    answer2: "0",
                    answer3: "0",
                    answer4: "0",
                    questionId: "0",
                    questionnaireId: "${questionnaire.questionnaireId}",
                }
            }
//            document.write(JSON.stringify(answers));
//            alert(JSON.stringify(answers));
//            alert(answers.toString());

            $.ajax({
                url: "/answer",
                data: {answers: JSON.stringify(answers)},
                type: "post",
                dataType: "json",
                success: function (data) {
                    alert("success");
                },
                error: function (data) {
                    alert("error");
                }
            });

        }

    </script>

</head>
<body>

<!-- Modal -->
<div class="modal fade" id="userLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">用户登录</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" action="userLogin">

                    <div class="form-group">
                        <label class="col-sm-2">用户名</label>

                        <div class="col-sm-10">
                            <input type="text" name="userName">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2">密码</label>

                        <div class="col-sm-10">
                            <input type="text" name="passWord">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">登陆</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="managerLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">管理员登录</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" action="managerLogin">

                    <div class="form-group">
                        <label class="col-sm-2">用户名</label>

                        <div class="col-sm-10">
                            <input type="text" name="manager.managerName">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2">密码</label>

                        <div class="col-sm-10">
                            <input type="text" name="manager.passWord">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">登陆</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">用户注册</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" action="register">

                    <div class="form-group">
                        <label class="col-sm-2">用户名</label>

                        <div class="col-sm-10">
                            <input type="text" name="user.userName">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2">密码</label>

                        <div class="col-sm-10">
                            <input type="text" name="user.passWord">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">注册</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

<div class="nav navbar-default">
    <div class="container-fluid">
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href=""></a></li>
                <li><a href=""></a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="javascript:form1.submit()">提交问卷</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">登陆<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a data-toggle="modal" data-target="#userLogin">用户登陆</a></li>
                        <li><a data-toggle="modal" data-target="#managerLogin">管理员登陆</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a data-toggle="modal" data-target="#register">用户注册</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="col-sm-offset-2 col-sm-8">
    <%--<form name="form1">--%>
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

    <button onclick="aa()">提交</button>

    <%--<input type="hidden" name="questionId" value="<%=resultSet.getInt("questionId")%>">--%>

    <%--<span class="label label-info"><%=resultSet.getString("type")%></span>--%>

    <%--<br>--%>

    <%--<p class="bg-primary"><%=resultSet.getString("question")%>--%>
    <%--</p>--%>

    <%--<%--%>
    <%--for (int i = 1; i <= 4; i++) {--%>

    <%--if (!(resultSet.getString("option" + i) == "")) {--%>

    <%--%>--%>
    <%--<label class="radio">--%>
    <%--<input type="radio" value="<%=i-1%>" name="<%=resultSet.getInt("questionid")%>">--%>
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

    <%--<input type="hidden" name="questionId" value="<%=resultSet.getInt("questionId")%>">--%>

    <%--<span class="label label-info"><%=resultSet.getString("type")%></span>--%>

    <%--<br>--%>

    <%--<p class="bg-primary"><%=resultSet.getString("question")%>--%>
    <%--</p>--%>

    <%--<%--%>
    <%--for (int i = 1; i <= 4; i++) {--%>

    <%--if (!(resultSet.getString("option" + i) == "")) {--%>

    <%--%>--%>
    <%--<label class="checkbox">--%>
    <%--<input type="checkbox" value="<%=i-1%>" name="<%=resultSet.getInt("questionid")%>">--%>
    <%--</label>--%>

    <%--<p><%=resultSet.getString("option" + i)%>--%>
    <%--</p>--%>
    <%--<%--%>
    <%--}--%>
    <%--}--%>
    <%--%>--%>

    <%--<%--%>
    <%--}--%>

    <%--%>--%>


    <%--<%--%>
    <%--}--%>
    <%--%>--%>


    <%--</form>--%>
</div>

</body>
</html>
