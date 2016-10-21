<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>添加问题</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-2.2.3.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script>

        function aa() {

            var question = {
                question: "0",
                type: "0",
                option1: "0",
                option2: "0",
                option3: "0",
                option4: "0"
            };

            question["type"] = $("input[name=choice]:checked").val();
            question["question"] = $("input[name=question]").val();
            question["option1"] = $("input[name=option1]").val();
            question["option2"] = $("input[name=option2]").val();
            question["option3"] = $("input[name=option3]").val();
            question["option4"] = $("input[name=option4]").val();



            $.ajax({
                url: "/managerr/addQuestion",
                data: {question: JSON.stringify(question)},
                type: "post",
                dataType: "json",
                success: function (data) {
                    alert(data);
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
        <div class="hero-unit">
            <h1>问卷网</h1>

            <p>在此页面你可以添加问题</p>
        </div>

        <table class="table table-bordered">
            <tr>
                <td class="col-sm-6">题目</td>
                <td class="col-sm-2">类型</td>
                <td class="col-sm-4">操作</td>
            </tr>

            <C:forEach var="question" items="${questionList}">
                <tr>
                    <td class="col-sm-6">${question.question}</td>
                    <td class="col-sm-2">${question.type}</td>
                    <td class="col-sm-4">操作</td>
                </tr>
            </C:forEach>
        </table>

    </div>

    <div class="col-sm-7">

        <br>
        <br>
        <br>

        <div class="radio">
            <label class="radio">
                <input type="radio" name="choice" value="单选">单选
            </label>

            <label class="radio">
                <input type="radio" name="choice" value="多选">多选
            </label>
        </div>

        <div class="form-horizontal">
            <div class="form-group">
                <label class="c col-sm-2 control-label">题目</label>

                <div class="col-sm-10">
                    <input name="question" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">选项1</label>

                <div class="col-sm-8">
                    <input name="option1" class="form-control">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">选项2</label>

                <div class="col-sm-8">
                    <input name="option2" class="form-control">
                </div>

            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">选项3</label>

                <div class="col-sm-8">
                    <input name="option3" class="form-control">
                </div>

            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">选项4</label>

                <div class="col-sm-8">
                    <input name="option4" class="form-control">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-8">
                    <button onclick="aa()">提交</button>
                </div>
            </div>
        </div>


    </div>

</div>


</body>
</html>
