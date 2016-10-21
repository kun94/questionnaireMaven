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
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">问卷选择<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/views/manager/managerView.jsp?isRelease=1">已发布问卷</a></li>
                        <li><a href="/views/manager/managerView.jsp?isRelease=0">未发布问卷</a></li>
                    </ul>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="/views/mainView.jsp">退出登录</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="col-sm-12">
        <div class="hero-unit">
            <h1>问卷网</h1>

        </div>

        <table class="table table-bordered">
            <tr>
                <td class="col-sm-10">名称</td>
                <td class="col-sm-2">操作</td>
            </tr>

            <c:forEach var="questionnaire" items="${questionnaireList}">
                <tr>
                    <td class="col-sm-10">${questionnaire.questionnaireName}
                    </td>
                    <td>
                        <c:if test="${questionnaire.isRelease == '1'}">
                            <a href="/managerr/delete/${questionnaire.questionnaireId}">删除</a>
                            <a href="/managerr/preview/${questionnaire.questionnaireId}">预览</a>
                            <a href="/managerr/countAnswer/${questionnaire.questionnaireId}">查看统计</a>

                        </c:if>

                        <c:if test="${questionnaire.isRelease == '0'}">
                            <a href="/managerr/delete/${questionnaire.questionnaireId}">删除</a>
                            <a href="/managerr/change/${questionnaire.questionnaireId}">编辑</a>
                            <a href="/managerr/isRelease/${questionnaire.questionnaireId}">发布</a>

                        </c:if>
                    </td>
                </tr>
            </c:forEach>

            <%--<%--%>
            <%--resultSet.last();--%>
            <%--int size = resultSet.getRow();--%>
            <%--pageCount = (size % PAGESIZE == 0) ? (size / PAGESIZE) : (size / PAGESIZE + 1);--%>
            <%--String tmp = request.getParameter("curPage");--%>
            <%--if (tmp == null) {--%>
            <%--tmp = "1";--%>
            <%--}--%>
            <%--curPage = Integer.parseInt(tmp);--%>
            <%--if (curPage >= pageCount) curPage = pageCount;--%>
            <%--boolean flag = resultSet.absolute((curPage - 1) * PAGESIZE);--%>
            <%--int count = 0;--%>
            <%--while (resultSet.next()) {--%>
            <%--if (count >= PAGESIZE) break;--%>
            <%--count++;--%>
            <%--if (isRelease == 0) {--%>

            <%--%>--%>
            <%--<tr>--%>
            <%--<td class="col-sm-10"><%=resultSet.getString("questionnairename")%>--%>
            <%--</td>--%>
            <%--<td><a href="/deleteQuestionnaire?questionnaireId=<%=resultSet.getString("questionnaireid")%>">删除</a>--%>
            <%--<a href="/views/manager/addQuestionnaire.jsp?questionnaireId=<%=resultSet.getString("questionnaireid")%>">编辑</a>--%>
            <%--<a href="/release?questionnaireId=<%=resultSet.getString("questionnaireid")%>">发布</a></td>--%>
            <%--</tr>--%>
            <%--<%--%>
            <%--} else {--%>
            <%--%>--%>
            <%--<tr>--%>
            <%--<td class="col-sm-10"><%=resultSet.getString("questionnairename")%>--%>
            <%--</td>--%>
            <%--<td><a href="/deleteQuestionnaire?questionnaireId=<%=resultSet.getString("questionnaireid")%>">删除</a>--%>
            <%--<a href="/views/manager/questionnaireView.jsp?questionnaireId=<%=resultSet.getString("questionnaireid")%>">预览</a>--%>
            <%--<a href="/views/manager/questionnaireCount.jsp?questionnaireId=<%=resultSet.getString("questionnaireid")%>">查看统计</a>--%>
            <%--</td>--%>
            <%--</tr>--%>
            <%--<%--%>
            <%--}--%>
            <%--}--%>
            <%--%>--%>

        </table>

        <%--<a href="/views/manager/managerView.jsp?curPage=1">首页</a>--%>
        <%--<a href="/views/manager/managerView.jsp?curPage=<%=curPage-1%>">上一页</a>--%>
        <%--<a href="/views/manager/managerView.jsp?curPage=<%=curPage+1%>">下一页</a>--%>
        <%--<a href="/views/manager/managerView.jsp?curPage=<%=pageCount%>">尾页</a>--%>
        <%--第<%=curPage%>页/共<%=pageCount%>页--%>

    </div>
</div>

</body>
</html>
