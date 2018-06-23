<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/view/teacher/nav.jsp"></jsp:include>


<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div>
            <h1 class="page-header">已添加教材</h1>
        </div>
        <div class="row" id="addedBookContainer">
            <jsp:include page="/orderbook.do/orderbook_added.view"></jsp:include>
        </div>
        <div>
            <h1 class="page-header">添加教材</h1>
        </div>
        <jsp:include page="/orderbook.do/orderbook_add.view"></jsp:include>
    </div>

    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->

</div>
<div id="panel" style="display:none">
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <select class="form-control" name="form"
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
                    <tr id="copyColumn">
                        <td class="col-md-2">
                            <input type="text" class="form-control"
                                   name="form">
                        </td>
                        <td class="col-md-3">
                            <input type="text" class="form-control"
                                   name="form">
                        </td>
                        <td class="col-md-1">
                            <input type="text" class="form-control"
                                   name="form">
                        </td>
                        <td class="col-md-1">
                            <input type="text" class="form-control"
                                   name="form">
                        </td>
                        <td class="col-md-2">
                            <input type="text" class="form-control"
                                   name="form">
                        </td>
                        <td class="col-md-1">
                            <select class="form-control" name="form"
                                    style="min-width: 60px">
                                <option>A</option>
                                <option>B</option>
                                <option>C</option>
                                <option>D</option>
                            </select>
                        </td>
                        <td class="col-md-1">
                            <input type="number" class="form-control"
                                   name="form">
                        </td>
                        <td class="col-md-1">
                            <input type="text" class="form-control"
                                   name="form">
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
<!-- /#wrapper -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/bower_components/jquery/dist/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/bower_components/metisMenu/dist/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="${pageContext.request.contextPath}/dist/js/sb-admin-2.js"></script>

<!-- DataTables JavaScript -->
<script src="${pageContext.request.contextPath}/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function () {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>
<script>

    function alterAndSubmit(btn) {
        var form = btn.form;
        if (btn.innerText == "提交修改") {
            var changedItems = form.getElementsByClassName("changedItem");

            for (var i = 0; i < changedItems.length; i++) {
                var item = changedItems[i].children;
                var newValue = item.newValue;
                form.changedInfo.alterItemList.push({
                    "bookTitle": item[0].firstElementChild.defaultValue,
                    "isbn": item[1].firstElementChild.defaultValue,
                    "dateOfPrinting": item[2].firstElementChild.defaultValue,
                    "author": item[3].firstElementChild.defaultValue,
                    "press": item[4].firstElementChild.defaultValue,
                    "category": item[5].firstElementChild.defaultValue,
                    "unitPrice": item[6].firstElementChild.defaultValue,
                    "remark": item[7].firstElementChild.defaultValue,
                    "newBookTitle": item[0].firstElementChild.newValue,
                    "newIsbn": item[1].firstElementChild.newValue,
                    "newDateOfPrinting": item[2].firstElementChild.newValue,
                    "newAuthor": item[3].firstElementChild.newValue,
                    "newPress": item[4].firstElementChild.newValue,
                    "newCategory": item[5].firstElementChild.newValue,
                    "newUnitPrice": item[6].firstElementChild.newValue,
                    "newRemark": item[7].firstElementChild.newValue
                });
            }
            form.changedInfo.secId = btn.form[0].value;
            var alterItemRequest = new XMLHttpRequest();

            alterItemRequest.open("POST", "${pageContext.request.contextPath}/orderbook.do/update", true);
            alterItemRequest.setRequestHeader("Content-type", "application/json");
            alterItemRequest.send(JSON.stringify(form.changedInfo));

            alterItemRequest.onreadystatechange = function () {
                if (alterItemRequest.readyState == 4 && alterItemRequest.status == 200) {
                    var refreshFormRequest = new XMLHttpRequest();
                    refreshFormRequest.open("GET", "${pageContext.request.contextPath}/orderbook.do/orderbook_added.view", true);
                    refreshFormRequest.send();
                    refreshFormRequest.onreadystatechange = function () {
                        if (refreshFormRequest.readyState == 4 && refreshFormRequest.status == 200) {
                            document.getElementById("addedBookContainer").innerHTML = refreshFormRequest.responseText;
                        }
                    }
                }
            }
        } else {

            form.changedInfo =
            {
                "secId": "",
                "alterItemList": [],
                "deleteItemList": []
            }
            var children = form.getElementsByTagName("input");
            var select = form.getElementsByTagName("select");
            var button = form.getElementsByTagName("button");
            for (var i = 0; i < children.length; i++) {
                children[i].removeAttribute("disabled");
                children[i].defaultValue = children[i].value;
                children[i].newValue = children[i].value;
            }
            for (var i = 0; i < select.length; i++) {
                select[i].removeAttribute("disabled");
                select[i].defaultValue = select[i].value;
                select[i].newValue = select[i].value;
            }
            for (var i = 0; i < button.length; i++) {
                button[i].removeAttribute("disabled");
                button[i].defaultValue = button[i].value;
                button[i].newValue = button[i].value;
            }
            btn.innerText = "提交修改";
        }
    }
</script>
<script>
    function deleteRow(btn) {
        var trNode = btn.parentNode.parentNode;
        var tbodyNode = trNode.parentNode;
        var items = btn.parentNode.parentNode.children;

        btn.form.changedInfo.deleteItemList.push({
            "bookTitle": items[0].firstElementChild.value,
            "isbn": items[1].firstElementChild.value,
            "dateOfPrinting": items[2].firstElementChild.value,
            "author": items[3].firstElementChild.value,
            "press": items[4].firstElementChild.value,
            "category": items[5].firstElementChild.value,
            "unitPrice": items[6].firstElementChild.value,
            "remark": items[7].firstElementChild.value
        });
        tbodyNode.removeChild(trNode);


    }
</script>
<script>
    function addRow(btn) {
        var tbodyNode = btn.parentNode.getElementsByTagName("tbody")[0];
//        var trNode = tbodyNode.firstElementChild;
        var trNode = document.getElementById("copyColumn");
        var copyNode = trNode.cloneNode(true);
        copyNode.removeAttribute("id");
        formItems = copyNode.querySelectorAll("*[name='form']");
        for (var i = 0; i < formItems.length; i++) {
            formItems[i].name = "form" + count;
        }
        tbodyNode.appendChild(copyNode);
    }
</script>
<script>
    var courseCount = ${courseCount};
    var count = 1;
    function addCourse(btn) {
        var formNode = document.getElementById("panelContainer");
        var panelNode = document.getElementById("panel");
        var copyRowNode = panelNode.cloneNode(true);
        copyRowNode.removeAttribute("style");
        copyRowNode.removeAttribute("id");
        var formItem = copyRowNode.querySelectorAll("*[name='form']");
        <!--利用这个进行区分不同的表单数据-->

        ++count;
        for (var i = 0; i < formItem.length; i++) {
            formItem[i].name = "form" + count;
        }
        formNode.appendChild(copyRowNode);

        if (count == courseCount) {
            btn.innerText = "已达最大授课数目"
            btn.disabled = true;
            return;
        }
    }
</script>
<script>
    function addNewValue(container) {
        container.newValue = container.value;
        container.parentNode.parentNode.className = "changedItem";
    }
</script>
</body>

</html>
