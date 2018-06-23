<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/view/admin/nav.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">

    <div class="container-fluid">
        <div>
            <h1 class="page-header">专业管理</h1>
        </div>
        <c:forEach var="entry" items="${deptAndSpec}">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                                ${entry.deptName}
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">

                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>专业名</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="specName" items="${entry.specName}">
                                        <tr>
                                            <td>${specName}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/spec.do/spec_update.view?specName=${specName}">修改</a>
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/spec.do/delete?specName=${specName}"
                                                   onclick="return confirm('是否要删除该专业')">删除</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>

        </c:forEach>

    </div>
    <a href="${pageContext.request.contextPath}/spec.do/spec_add.view" class="btn btn-primary" role="button">添加专业</a>
    <!-- /.container-fluid -->
</div>
</div>
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<jsp:include page="/bottom.jsp"></jsp:include>

