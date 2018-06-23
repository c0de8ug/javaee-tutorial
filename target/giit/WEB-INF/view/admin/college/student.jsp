<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/view/admin/nav.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div>
            <h1 class="page-header">学生管理</h1>
        </div>
        <div class="panel-heading">
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        学生信息
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th>学号</th>
                                    <th>姓名</th>
                                    <th>身份证号</th>
                                    <th>性别</th>
                                    <th>电话号码</th>
                                    <th>班级</th>
                                    <th>年级</th>
                                    <th>生源地</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="student" items="${studentList}">
                                    <tr>
                                        <td>${student.studentId}</td>
                                        <td>${student.studentName}</td>
                                        <td>${student.idCard}</td>
                                        <td>${student.gender}</td>
                                        <td>${student.telephoneNumber}</td>
                                        <td>${student.className}</td>
                                        <td>${student.year}</td>
                                        <td>${student.studentOriginBase}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/student.do/student_update.view?studentId=${student.studentId}">修改</a>
                                        </td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/student.do/delete?studentId=${student.studentId}"
                                               onclick="return confirm('是否要删除该学生信息')">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <a href="${pageContext.request.contextPath}/student.do/student_add.view" class="btn btn-primary" role="button">添加学生</a>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>

    <!-- /.container-fluid -->
</div>
</div>
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<jsp:include page="/bottom.jsp"></jsp:include>

