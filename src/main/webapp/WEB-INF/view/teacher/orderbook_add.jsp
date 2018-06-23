<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">
    <div class="panel panel-default">
        <div class="panel-body">
            <!--item-->
            <div class="row">
                <div class="col-lg-12">
                    <form method="post" action="${pageContext.request.contextPath}/orderbook.do/add">
                        <div id="panelContainer">
                            <div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4">
                                                <select class="form-control" name="form1"
                                                        style="font-size: 14px;">
                                                    <c:forEach var="section" items="${selectedSectionList}">
                                                        <option value="${section.secId}">${section.courseTitle}</option>
                                                    </c:forEach>
                                                </select></div>
                                            <div class="col-lg-4 col-md-4"></div>
                                            <div class="col-lg-4 col-md-4"></div>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="dataTable_wrapper">
                                            <table class="table table-hover table-responsive">
                                                <thead>
                                                <tr>
                                                    <th>书名</th>
                                                    <th>Isbn</th>
                                                    <th>印刷日期</th>
                                                    <th>作者</th>
                                                    <th>出版社</th>
                                                    <th>教材类别</th>
                                                    <th>单价</th>
                                                    <th>备注</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="col-md-2">
                                                        <input type="text" class="form-control"
                                                               name="form1">
                                                    </td>
                                                    <td class="col-md-3">
                                                        <input type="text" class="form-control"
                                                               name="form1">
                                                    </td>
                                                    <td class="col-md-1">
                                                        <input type="text" class="form-control"
                                                               name="form1">
                                                    </td>
                                                    <td class="col-md-1">
                                                        <input type="text" class="form-control"
                                                               name="form1">
                                                    </td>
                                                    <td class="col-md-2">
                                                        <input type="text" class="form-control"
                                                               name="form1">
                                                    </td>
                                                    <td class="col-md-1">
                                                        <select class="form-control" name="form1"
                                                                style="min-width: 60px">
                                                            <option>A</option>
                                                            <option>B</option>
                                                            <option>C</option>
                                                            <option>D</option>
                                                        </select>
                                                    </td>
                                                    <td class="col-md-1">
                                                        <input type="number" class="form-control"
                                                               name="form1">
                                                    </td>
                                                    <td class="col-md-1">
                                                        <input type="text" class="form-control"
                                                               name="form1">
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <button type="button"
                                                    class="btn btn-circle pull-right"
                                                    onclick="addRow(this)"><i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-warning">提交
                        </button>
                        <button type="button" class="btn btn-primary pull-right" id="btn_alter"
                                onclick="addCourse(this)">添加课程
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>