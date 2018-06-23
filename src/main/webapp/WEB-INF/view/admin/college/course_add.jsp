<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/view/admin/nav.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div>
            <h1 class="page-header">添加课程</h1>
        </div>
        <div class="panel-heading">
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        课程信息
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <form action="${pageContext.request.contextPath}/course.do/add" method="get">
                                <label>课程名</label>
                                <input class="form-control" name="courseTitle">

                                <%--<select name="province" id="province"--%>
                                <%--onchange="test(this)">--%>
                                <%--<option value="">-请选择-</option>--%>
                                <%--<option value="江苏省">江苏省</option>--%>
                                <%--<option value="浙江省">浙江省</option>--%>
                                <%--</select> 省--%>

                                <%--<select name="city" id="city">--%>

                                <%--<option value="">-请选择-</option>--%>
                                <%--<option value="杭州">杭州</option>--%>
                                <%--<option value="宁波">宁波</option>--%>
                                <%--<option value="温州">温州</option>--%>
                                <%--<option value="湖州">湖州</option>--%>
                                <%--</select> 市--%>

                                <label>学分</label>
                                <input type="number" class="form-control" name="credits">
                                <label>所属专业</label>
                                <select class="form-control" name="speciality">
                                    <c:forEach var="specName" items="${specNameList}">
                                        <option>${specName}</option>
                                    </c:forEach>
                                </select>
                                <label>课程类型</label>
                                <select class="form-control" name="type">
                                    <option>必修课/公共课</option>
                                    <option>选修课/公共课</option>
                                    <option>限选课/专业课</option>
                                    <option>选修课/专业课</option>
                                </select>
                                <label></label>
                                <button type="submit"
                                        class="btn btn-primary form-control">添加
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

<script language="JavaScript" type="text/javascript">
    <!--
    var cityArr = [];
    cityArr['江苏省'] = [
        {txt: '南京', val: '南京'},
        {txt: '无锡', val: '无锡'},
        {txt: '徐州', val: '徐州'},
        {txt: '苏州', val: '苏州'},
        {txt: '南通', val: '南通'},
        {txt: '淮阴', val: '淮阴'},
        {txt: '扬州', val: '扬州'},
        {txt: '镇江', val: '镇江'},
        {txt: '常州', val: '常州'}
    ];
    cityArr['浙江省'] = [
        {txt: '杭州', val: '杭州'},
        {txt: '宁波', val: '宁波'},
        {txt: '温州', val: '温州'},
        {txt: '湖州', val: '湖州'}
    ];

    function setCity(province) {
        setSelectOption('city', cityArr[province], '-请选择-');
    }

    /*
     * 说明：将传入的选项值加入到指定的下拉列表中
     * @param {String || Object]} selectObj 目标下拉选框的名称或对象，必须
     */
    function removeOptions(selectObj) {
        if (typeof selectObj != 'object') {
            selectObj = document.getElementById(selectObj);
        }

        // 原有选项计数
        var len = selectObj.options.length;

        for (var i = 0; i < len; i++) {
            // 移除当前选项
            selectObj.options[0] = null;
        }
    }

    /*
     * 说明：设置传入的选项值到指定的下拉列表中
     *
     * @param {String || Object]} selectObj 目标下拉选框的名称或对象，必须
     * @param {Array} optionList 选项值设置 格式：[{txt:'北京', val:'010'}, {txt:'上海', val:'020'}] ，必须
     * @param {String} firstOption 第一个选项值，如：“请选择”，可选，值为空
     * @param {String} selected 默认选中值，可选
     */
    function setSelectOption(selectObj, optionList, firstOption, selected) {
        if (typeof selectObj != 'object') {
            selectObj = document.getElementById(selectObj);
        }

        // 清空选项
        removeOptions(selectObj);

        // 选项计数
        var start = 0;

        // 如果需要添加第一个选项
        if (firstOption) {
            selectObj.options[0] = new Option(firstOption, '');

            // 选项计数从 1 开始
            start++;
        }

        var len = optionList.length;

        for (var i = 0; i < len; i++) {
            // 设置 option
            selectObj.options[start] = new Option(optionList[i].txt, optionList[i].val);

            // 选中项
            if (selected == optionList[i].val) {
                selectObj.options[start].selected = true;
            }

            // 计数加 1
            start++;
        }

    }
    function test(btn) {
        if (btn.value != '')
            setCity(btn.options[btn.selectedIndex].value);
    }
    //-->
</script>

<!-- /#wrapper -->
<jsp:include page="/bottom.jsp"></jsp:include>
