<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/view/admin/nav.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div>
            <h1 class="page-header">开设课程</h1>
        </div>
        <div class="panel-heading">
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        开设课程
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <form action="${pageContext.request.contextPath}/section.do/addTimetable" method="get" class="form-group">
                                <label>课程id</label>
                                <input class="form-control" name="secId">
                                <label>周次(输入格式1,2,3,4,5,6,7)</label>
                                <input class="form-control" name="weeks">
                                <label>星期</label>
                                <select class="form-control" name="week">
                                    <option>星期一</option>
                                    <option>星期二</option>
                                    <option>星期三</option>
                                    <option>星期四</option>
                                    <option>星期五</option>
                                    <option>星期六</option>
                                    <option>星期天</option>
                                </select>
                                <label>节次(输入格式1,2,3,4,5,6,7)</label>
                                <input class="form-control" name="time">
                                <label>教室</label>
                                <input class="form-control" name="classroom">
                                <label></label>
                                <button type="submit"
                                        class="btn btn-primary form-control">添加时段
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
</div>

<!-- /.container-fluid -->
</div>
</div>
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<jsp:include page="/bottom.jsp"></jsp:include>
