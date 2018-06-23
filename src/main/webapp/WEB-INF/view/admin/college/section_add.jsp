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
                            <form action="${pageContext.request.contextPath}/section.do/add" method="get"
                                  class="form-group">
                                <label>课程名称</label>
                                <select class="form-control" name="courseTitle">
                                    <c:forEach var="courseTitle" items="${courseTitleList}">
                                        <option>${courseTitle}</option>
                                    </c:forEach>
                                </select>

                                <label>授课老师</label>
                                <select class="form-control" name="staffId">
                                    <c:forEach var="staff" items="${staffList}">
                                        <option value="${staff.staffId}">${staff.staffName}</option>
                                    </c:forEach>
                                </select>

                                <label>可选课人数</label>
                                <input class="form-control" name="limitCount">
                                <label>开设时间</label>
                                <select class="form-control" name="year">
                                    <c:forEach var="term" items="${termList}">
                                        <option value="${term.val}">${term.text}</option>
                                    </c:forEach>
                                </select>
                                <label></label>
                                <button type="submit"
                                        class="btn btn-primary form-control">开设课程
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
