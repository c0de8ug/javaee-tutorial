<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${addedBookInfoList != null}">
    <div class="panel panel-default">
        <div class="panel-body" id="alterPanel">
            <!--item-->
            <c:forEach var="item" items="${addedBookInfoList}" varStatus="theCount">
                <div class="row">
                    <div class="col-lg-12">
                        <form method="post" action="${pageContext.request.contextPath}/orderBook.do/update"
                              id="alterForm${theCount.count}">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4">
                                            <select class="form-control"
                                                    style="font-size: 14px;">
                                                <option value="${item.secId}">${item.courseTitle}</option>
                                            </select></div>
                                        <div class="col-lg-4 col-md-4"></div>
                                        <div class="col-lg-4 col-md-4"></div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="dataTable_wrapper">
                                        <table class="table table-hover ">
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
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="bookInfo" items="${item.bookInfoList}">
                                                <tr>
                                                    <td class="col-md-2">
                                                        <input type="text" class="form-control"
                                                               value="${bookInfo.bookTitle}"
                                                               disabled="disabled"
                                                               onchange="addNewValue(this)">
                                                    </td>
                                                    <td class="col-md-3">
                                                        <input type="text" class="form-control"
                                                               value="${bookInfo.isbn}"
                                                               disabled="disabled"
                                                               onchange="addNewValue(this)">
                                                    </td>
                                                    <td class="col-md-1">
                                                        <input type="text" class="form-control"

                                                               value="${bookInfo.dateOfPrinting}"
                                                               disabled="disabled"
                                                               onchange="addNewValue(this)">
                                                    </td>
                                                    <td class="col-md-1">
                                                        <input type="text" class="form-control"
                                                               value="${bookInfo.author}"
                                                               disabled="disabled"
                                                               onchange="addNewValue(this)">
                                                    </td>
                                                    <td class="col-md-2">
                                                        <input type="text" class="form-control"
                                                               value="${bookInfo.press}"
                                                               disabled="disabled"
                                                               onchange="addNewValue(this)">
                                                    </td>
                                                    <td class="col-md-1">
                                                        <select class="form-control"
                                                                style="min-width: 60px"
                                                                disabled="disabled"
                                                                onchange="addNewValue(this)">
                                                            <option  ${bookInfo.category == 'A' ? 'selected' : ''}>
                                                                A
                                                            </option>
                                                            <option  ${bookInfo.category == 'B' ? 'selected' : ''}>
                                                                B
                                                            </option>
                                                            <option  ${bookInfo.category == 'C' ? 'selected' : ''}>
                                                                C
                                                            </option>
                                                            <option  ${bookInfo.category == 'D' ? 'selected' : ''}>
                                                                D
                                                            </option>
                                                        </select>
                                                    </td>
                                                    <td class="col-md-1">
                                                        <input type="number" class="form-control"
                                                               value="${bookInfo.unitPrice}"
                                                               disabled="disabled"
                                                               onchange="addNewValue(this)">
                                                    </td>
                                                    <td class="col-md-1">
                                                        <input type="text" class="form-control"
                                                               value="${bookInfo.remark}"
                                                               disabled="disabled"
                                                               onchange="addNewValue(this)">
                                                    </td>
                                                    <td class="col-lg-1">
                                                        <button type="button"
                                                                class="btn btn-danger btn-circle pull-right"
                                                                onclick="deleteRow(this)"
                                                                disabled="disabled">
                                                            <i class="fa fa-minus"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <button type="button" class="btn btn-warning"
                                                onclick="alterAndSubmit(this)">修改
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</c:if>