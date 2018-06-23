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
                            <form action="${pageContext.request.contextPath}/student.do/update" method="post" enctype="multipart/form-data">
                                <label>学号:${param.get("studentId")}</label>
                                <label> </label>
                                <label>姓名</label>
                                <input class="form-control" name="name">
                                <label>身份证号</label>
                                <input class="form-control" name="idCard">
                                <label>性别</label>
                                <select class="form-control" name="gender">
                                    <option>男</option>
                                    <option>女</option>
                                </select>
                                <label>联系电话</label>
                                <input class="form-control" name="telephoneNumber">
                                <label>班级</label>
                                <input class="form-control" name="className">
                                <label>年级</label>
                                <input class="form-control" name="year">
                                <label>生源地</label>
                                <input class="form-control" name="studentOriginBase">
                                <label>照片</label>
                                <input name="pic" type="file">
                                <label></label>
                                <button type="submit"
                                        class="btn btn-primary form-control">修改
                                </button>
                            </form>
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
