<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/30/2022
  Time: 6:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<jsp:include page="../views/layout/header.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/views/layout/navbar.jsp" />
    <div class="row">
        <!-- Cột trái -->
        <div class="col-sm-4">
            <h2>Thông tin cá nhân</h2>
            <h5>Hình ảnh:</h5>
            <div class="fakeimg">Vùng giả hình ảnh</div>
            <p>Nhãn mô tả cho hình ảnh</p>
            <h3>Liên kết</h3>
            <p>Nội dung mục liên kết</p>
            <hr class="d-sm-none">
        </div>
        <!-- Kết thúc cột trái -->

        <!-- Cột phải -->
        <div class="col-sm-8">
            <section class="content">
                <div class="container-fluid">
                    <!-- Vertical Layout -->
                    <div class="row clearfix">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="card">
                                <div class="header">
                                    <h2>
                                        Add new product
                                    </h2>
                                    <a href="/product">Return List</a>
                                    <c:if test="${error != null}">
                                        <h2 style="color: red">${error}</h2>
                                    </c:if>
                                    <div class="body">
                                        <form action="/product" method="post">
                                            <label for="id">ID: <span style="color: red;"> *</span></label>
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="text" name="id" class="form-control" placeholder="Product ID" tabindex="1" autofocus="autofocus" id="id" />
                                                </div>
                                            </div>

                                            <label for="name">Name: <span style="color: red;"> *</span></label>
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="text" name="name" class="form-control" placeholder="Product Name" tabindex="2" id="name" />
                                                </div>
                                            </div>

                                            <label for="price">Price: <span style="color: red;"> *</span></label>
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="text" name="price" class="form-control" placeholder="Price" tabindex="3" id="price" />
                                                </div>
                                            </div>

                                            <label for="dateRelease">Date Release: <span style="color: red;"> *</span></label>
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="date" name="dateRelease" class="form-control" placeholder="Date release" tabindex="4" id="dateRelease" />
                                                </div>
                                            </div>

                                            <label for="quantity">Quantity: <span style="color: red;"> *</span></label>
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="text" name="quantity" class="form-control" placeholder="Quantity" tabindex="5" id="quantity" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-line">
                                                </div>
                                            </div>
                                            <br>
                                            <div class="d-grid gap-2 col-6 mx-auto">
                                                <button class="btn btn-primary" type="reset">Reset</button>
                                                <button class="btn btn-primary" type="submit">Submit</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- Kết thúc cột phải -->

    </div>
</div>
</div>
</body>
</html>
