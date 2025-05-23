<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    Danh sách tòa nhà
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box ui-sortable-handle">
                        <div class="widget-header">
                            <h5 class="widget-title">Tìm kiếm</h5>

                            <div class="widget-toolbar">
                                <a href="#" data-action="collapse">
                                    <i class="ace-icon fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>

                        <div class="widget-body" style="font-family: 'Times New Roman', Times, serif;">
                            <div class="widget-main">
                                <form:form id="listForm" modelAttribute="modelSearch" action="${buildingListURL}"
                                           method="get">
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-sm-6">
                                                    <div>
                                                        <label class="name">Tên tòa nhà</label>
                                                            <%--                                                        <input type="text" class="form-control">--%>
                                                        <form:input class="form-control" path="name"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div>
                                                        <label class="name">Diện tích sàn</label>
<%--                                                        <input type="number" class="form-control">--%>
                                                        <form:input class="form-control" path="floorArea"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="col-xs-12">
                                                <div class="col-sm-2">
                                                    <div>
                                                        <label class="name">Quận</label>
                                                        <form:select class="form-control" path="district">
                                                            <form:option value="">---Chọn Quận---</form:option>
                                                            <form:options items="${districts}"/>
                                                        </form:select>
                                                    </div>

                                                </div>
                                                <div class="col-sm-5">
                                                    <div>
                                                        <label class="name">Phường</label>
                                                            <%--                                                        <input type="text" class="form-control">--%>
                                                        <form:input class="form-control" path="ward"/>
                                                    </div>

                                                </div>
                                                <div class="col-sm-5">
                                                    <div>
                                                        <label class="name">Đường</label>
                                                            <%--                                                        <input type="text" class="form-control">--%>
                                                        <form:input class="form-control" path="street"/>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="col-sm-4">
                                                    <div>
                                                        <label class="name">Số tầng hầm</label>
                                                            <%--                                                        <input type="number" class="form-control">--%>
                                                        <form:input class="form-control" path="numberOfBasement"/>
                                                    </div>

                                                </div>
                                                <div class="col-sm-4">
                                                    <div>
                                                        <label class="name">Hướng</label>
                                                            <%--                                                        <input type="text" class="form-control">--%>
                                                        <form:input class="form-control" path="direction"/>
                                                    </div>

                                                </div>
                                                <div class="col-sm-4">
                                                    <div>
                                                        <label class="name">Hạng</label>
                                                            <%--                                                        <input type="text" class="form-control">--%>
                                                        <form:input class="form-control" path="level"/>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="col-sm-3">
                                                    <div>
                                                        <label class="name">Diện tích từ</label>
                                                        <form:input class="form-control" path="areaFrom"/>
                                                    </div>

                                                </div>
                                                <div class="col-sm-3">
                                                    <div>
                                                        <label class="name">Diện tích đến</label>
                                                        <form:input class="form-control" path="areaTo"/>
                                                    </div>

                                                </div>
                                                <div class="col-sm-3">
                                                    <div>
                                                        <label class="name">Giá thuê từ</label>
                                                        <form:input class="form-control" path="rentPriceFrom"/>
                                                    </div>

                                                </div>
                                                <div class="col-sm-3">
                                                    <div>
                                                        <label class="name">Giá thuê đến</label>
                                                        <form:input class="form-control" path="rentPriceTo"/>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-xs-12">
                                                <div class="col-sm-5">
                                                    <div>
                                                        <label class="name">Tên quản lý</label>
                                                            <%--                                                            <input type="text" class="form-control">--%>
                                                        <form:input class="form-control" path="managerName"/>
                                                    </div>

                                                </div>
                                                <div class="col-sm-5">
                                                    <div>
                                                        <label class="name">SDT Quản lý</label>
                                                            <%--                                                            <input type="text" class="form-control">--%>
                                                        <form:input class="form-control" path="managerPhone"/>
                                                    </div>

                                                </div>
                                                <div class="col-sm-2">
                                                    <div>
                                                        <label class="name">Nhân Viên</label>
                                                        <form:select class="form-control" path="staffId">
                                                            <form:option value="">---Chọn Nhân Viên---</form:option>
                                                            <form:options items="${listStaffs}"/>
                                                        </form:select>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="col-sm-6">
                                                    <form:checkboxes items="${typeCodes}" path="typeCode"/>
                                                        <%--                                                    <label class="checkbox-inline">--%>
                                                        <%--                                                        <input type="checkbox">Nội thất--%>
                                                        <%--                                                    </label>--%>
                                                        <%--                                                    <label class="checkbox-inline">--%>
                                                        <%--                                                        <input type="checkbox">Nguyên căn--%>
                                                        <%--                                                    </label>--%>
                                                        <%--                                                    <label class="checkbox-inline">--%>
                                                        <%--                                                        <input type="checkbox">Tầng trệt--%>
                                                        <%--                                                    </label>--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="col-sm-6">
                                                    <button class="btn btn-info" id="btnSearchBuilding">Tìm
                                                        kiếm
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>

                            </div>
                        </div>

                        <div class="pull-right">
                            <a href="/admin/building-edit">
                                <button class="btn btn-info">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                         fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                        <path
                                                d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                        <path
                                                d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                        <path
                                                d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>
                            </a>

                            <button class="btn btn-danger" id="btnDeleteBuilding">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                     fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                    <path
                                            d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                    <path
                                            d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                    <path
                                            d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bảng danh sách -->

            <div class="row">
                <div class="col-xs-12">
                    <table id="tableList" style="margin: 3em 0 0;"
                           class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" value="" name="checkList" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>Tên tòa nhà</th>
                            <th>Địa chỉ</th>
                            <th>Số tầng hầm</th>
                            <th>Tên Quản lý</th>
                            <th>SDT Quản lý</th>
                            <th>DT Sàn</th>
                            <th>DT Trống</th>
                            <th>DT Thuê</th>
                            <th>Giá Thuê</th>
                            <th>Phí môi giới</th>
                            <th>Phí Dịch vụ</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="item" items="${buildingList}">
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input id="buildingId" type="checkbox" class="ace" name="checkList"
                                               value="${item.id}">
                                        <span class="lbl"></span>
                                    </label>
                                </td>

                                <td>${item.name}</td>
                                <td>${item.address}</td>
                                <td>${item.numberOfBasement}</td>
                                <td>${item.managerName}</td>
                                <td>${item.managerPhone}</td>
                                <td>${item.floorArea}</td>
                                <td>${item.emptyArea}</td>
                                <td>${item.rentArea}</td>
                                <td>${item.rentPrice}</td>
                                <td>${item.brokerageFee}</td>
                                <td>${item.serviceFee}</td>
                                <td>
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <button class="btn btn-xs btn-success" title="Giao tòa nhà"
                                                onclick="assignmentBuilding(${item.id})">
                                            <i class="ace-icon fa fa-check bigger-120"></i>
                                        </button>

                                        <a class="btn btn-xs btn-info" title="Sửa toà nhà"
                                           href="/admin/building-edit-${item.id}">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </a>

                                        <button class="btn btn-xs btn-danger" title="Xóa toà nhà"
                                                onclick="deleteBuilding(${item.id})">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div><!-- /.span -->
            </div>

        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
<div class="modal fade" id="assignmentBuildingModal" role="dialog"
     style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table id="staffList" style="margin: 3em 0 0;"
                       class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="center">Chọn</th>
                        <th class="center">Tên Nhân viên</th>
                    </tr>
                    </thead>

                    <tbody>

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAssignmentBuilding">Giao tòa nhà</button>
                <button type="button" class="btn btn-default" id="close">Đóng</button>
            </div>
        </div>
    </div>
</div>

<script src="assets/js/jquery.2.1.1.min.js"></script>
<script>
    function assignmentBuilding(buildingId) {
        $('#assignmentBuildingModal').modal();
        loadStaff(buildingId);
        $('#buildingId').val(buildingId);
    }

    function loadStaff(buildingId) {
        $.ajax({
            type: "GET",
            url: "${buildingAPI}/" + buildingId + "/staffs",
            // contentType: "application/json",
            dataType: "json",
            success: function (response) {
                var row = '';
                $.each(response.data, function (index, item) {
                    row += '<tr>';
                    row += '<td class="text-center"><input type="checkbox" id="checkbox_' + item.staffId +
                        '" value="' + item.staffId + '" class="checkbox-element" ' +
                        (item.checked ? 'checked' : '') + '/></td>';
                    row += '<td class = "text-center">' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
            },
            error: function (response) {
                console.log("Fail");
                window.location.href = '/admin/building-list?message=error';
                console.log(response);
            }
        });
    }


    $('#btnAssignmentBuilding').click(function (e) {
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get()
        data['staffs'] = staffs;
        if (data['staffs'] != '') {
            assign(data);
        }
        console.log("OK");
    })

    function assign(data) {
        $.ajax({
            type: "POST",
            url: "${buildingAPI}" + "/assignment",
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify(data),
            success: function (response) {
                console.log("Success");
            },
            error: function (response) {
                console.info("Giao không thành công");
                window.location.href = '/admin/building-list?message=error';
                console.log(response);
            }
        });
    }

    $('#btnSearchBuilding').click(function (e) {
        e.preventDefault();
        $('#listForm').submit();
    })

    function deleteBuilding(buildingId) {
        var data = [buildingId];
        deleteBuildings(data);
    }

    $('#btnDeleteBuilding').click(function (e) {
        e.preventDefault();
        var buildingIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        deleteBuildings(buildingIds);
    });

    function deleteBuildings(data) {
        $.ajax({
            type: "DELETE",
            url: "${buildingAPI}/" + data,
            // data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "text",
            success: function (response) {
                alert(response);
                window.location.reload();
            },
            error: function (response) {
                console.log("Fail");
                console.log(response);
            }
        });
    }
</script>
</body>
</html>
