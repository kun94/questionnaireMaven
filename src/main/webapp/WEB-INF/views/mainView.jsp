<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>问卷调查</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-2.2.3.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
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
                <li></li>
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

<div class="container-fluid">
    <div class="col-sm-12">
        <div class="hero-unit">
            <h1>问卷网</h1>

            <h3></h3>
        </div>
        <form action="searchQuestionnaire" name="form1">
            <div class="row">
                <div class="col-sm-offset-2 col-sm-8">
                    <div class="input-group">
                        <input name="search" type="text" class="form-control" placeholder="Search for...">
                        <span class="input-group-btn">
                            <button class="btn btn-primary" type="submit">搜索</button>
                        </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
            </div>
        </form>

        <br>
        <br>
        <br>

        <table class="table table-bordered">
            <tr>
                <td class="col-sm-10">名称</td>
                <td class="col-sm-2">操作</td>
            </tr>

            <c:forEach items="${questionnaireList}" var="questionnaire">
                <tr>
                    <td class="col-sm-10">${questionnaire.questionnaireName}
                    </td>
                    <td>
                        <a href="<c:out value="/questionnaire/" />${questionnaire.questionnaireId}">填写问卷</a>
                    </td>
                </tr>
            </c:forEach>

        </table>

    </div>
</div><!--/.fluid-container-->


</body>
</html>
