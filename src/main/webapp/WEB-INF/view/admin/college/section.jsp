<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/view/admin/nav.jsp"></jsp:include>

<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div>
            <h1 class="page-header">课程安排</h1>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        已开设课程信息
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">

                                <thead>
                                <tr>
                                    <th>课程ID</th>
                                    <th>课程名称</th>
                                    <th>授课老师</th>
                                    <th>授课周次,星期,节次</th>
                                    <th>上课教室</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="section" items="${sectionList}">
                                    <tr>
                                        <td>${section.secId}</td>
                                        <td>${section.courseTitle}</td>
                                        <td>${section.teacher}</td>
                                        <c:forEach var="timetable" items="${section.timetableList}">
                                            <td>
                                                    ${timetable.weeks}周 ${timetable.week} ${timetable.time}节
                                            </td>
                                            <td>${timetable.classroom}</td>
                                        </c:forEach>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/section.do/delete?secId=${section.secId}"
                                               onclick="return confirm('是否要删除该开课')">删除</a>
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
        <a href="${pageContext.request.contextPath}/section.do/section_add.view" class="btn btn-primary" role="button">开设课程</a>
        <a href="${pageContext.request.contextPath}/section.do/section_timetable_add.view" class="btn btn-primary" role="button">添加时段</a>

        <!-- /.container-fluid -->
    </div>
</div>
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<jsp:include page="/bottom.jsp"></jsp:include>
