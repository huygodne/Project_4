<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Thêm tòa nhà</title>
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

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Dashboard</li>
            </ul><!-- /.breadcrumb -->


        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    Danh sách tòa nhà
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->
            <div class="row">
                <form:form modelAttribute="buildingEdit" id="listForm" method="GET">
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form" id="form-edit">
                            <di class="form-group">
                                <label class="col-xs-3">Tên tòa nhà</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="name"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Quận</label>
                                <div class="col-xs-2">
                                    <form:select class="form-control" path="district">
                                        <form:option value="">---Chọn Quận---</form:option>
                                        <form:option value="1">Quận 1</form:option>
                                        <form:option value="2">Quận 2</form:option>
                                        <form:option value="3">Quận 3</form:option>
                                        <form:option value="4">Quận 10</form:option>
                                    </form:select>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Phường</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="ward"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Đường</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="street"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Kết cấu</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="structure"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Số tầng hầm</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="numberOfBasement"/>
                                </div>
                            </di>
                            <di class="form-group">
                                <label class="col-xs-3">DT Sàn</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="floorArea"/>
                                </div>
                            </di>
                            <di class="form-group">
                                <label class="col-xs-3">Hướng</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="direction"/>
                                </div>
                            </di>
                            <di class="form-group">
                                <label class="col-xs-3">Hạng</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="level"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">DT Thuê</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="rentArea"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Giá thuê</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="rentPrice"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Mô tả giá</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="rentPriceDescription"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Phí dịch vụ</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="serviceFee"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Phí ô tô</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="carFee"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Phí mô tô</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="motoFee"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Phí ngoài giờ</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="overtimeFee"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Tiền điện</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="electricityFee"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Đặt cọc</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="deposit"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Thanh toán</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="payment"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Thời hạn thuê</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="rentTime"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Thời gian trang trí</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="decorationTime"/>
                                </div>
                            </di>


                            <di class="form-group">
                                <label class="col-xs-3">Tên quản lý</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="managerName"/>
                                </div>
                            </di>


                            <di class="form-group">
                                <label class="col-xs-3">SDT Quản lý</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="managerPhone"/>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Loại tòa nhà</label>
                                <div class="col-xs-9">
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="typeCode" name="typeCode" value="noi-that">Nội thất
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="typeCode" name="typeCode" value="nguyen-cam">Nguyên
                                        căn
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="typeCode" name="typeCode" value="tang-tret">Tầng trệt
                                    </label>
                                </div>
                            </di>

                            <di class="form-group">
                                <label class="col-xs-3">Ghi chú</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="note"/>
                                </div>
                            </di>
                            <di class="form-group">
                                <label class="col-xs-3"></label>
                                <div class="col-xs-9">
                                    <c:if test="${not empty buildingEdit.id}">
                                        <button type="submit" class="btn btn-primary" id="btnAddBuilding">Cập nhật tòa
                                            nhà
                                        </button>
                                        <button type="submit" class="btn btn-primary">Hủy thao tác</button>
                                    </c:if>
                                    <c:if test="${empty buildingEdit.id}">
                                        <button type="submit" class="btn btn-primary" id="btnAddBuilding">Thêm tòa
                                            nhà
                                        </button>
                                        <button type="submit" class="btn btn-primary">Hủy thao tác</button>
                                    </c:if>
                                </div>
                            </di>

                        </form>
                    </div>
                </form:form>

            </div>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
</body>
</html>
