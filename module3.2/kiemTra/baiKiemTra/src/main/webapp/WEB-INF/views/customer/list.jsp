<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/9/2022
  Time: 4:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><html>
<head>
    <title>Title</title>
    <jsp:include page="../layout/header.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../layout/navbar.jsp"></jsp:include>
<div class="container-fluid" align="center">
    <div class="row">
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary col-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Add New Product
        </button>

        <!-- Modal create -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Đăng kí thông tin</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="form-group" id="formCreate" method="post" action="/product">
                            <table  cellpadding="5">
                                <tr>
                                    <th>Product ID:</th>
                                    <td>
                                        <input type="text" name="id" id="id" size="45"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Product Name:</th>
                                    <td>
                                        <input type="text" name="name" id="name" size="45"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Price:</th>
                                    <td>
                                        <input type="text" name="price" id="email" size="45"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Quantity:</th>
                                    <td>
                                        <input type="text" name="quantity" id="quantity" size="45"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Color:</th>
                                    <td>
                                        <input type="text" name="color" id="color" size="45"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Description :</th>
                                    <td>
                                        <input type="text" name="description" id="description" size="45"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Category:</th>
                                    <td>
                                        <div class="input-group mb-3">
                                            <label class="input-group-text" for="inputGroupSelect01">Lựa chọn</label>
                                            <select class="form-select" id="inputGroupSelect01" name="category">
                                                <c:forEach var="category" items="${categoryList}" varStatus="count">
                                                    <option value="${category.id}">${category.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <%--                    <select name="category" id="category">--%>
                                        <%--                        <c:forEach var="category" items="${categoryList}" varStatus="count">--%>
                                        <%--                            <option value="${category.id}">${category.name}</option>--%>
                                        <%--                        </c:forEach>--%>
                                        <%--                    </select>--%>
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                            </table>
                            <input type="hidden" name="action" value="create">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit"  form="formCreate" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

        <h2 class="col-9">
            <a href="/product?action=search">Search</a>
        </h2>

        <div class="col-2 " style="border-right: 3px solid " >
            <h3>
                Thông Tin
            </h3>
        </div>
        <div class="col-10">
            <table  class="table table-striped table table-bordered">
                <tr><h2>Danh sách bệnh nhân</h2></tr>
                <tr>
                    <th>Mã phòng trọ</th>
                    <th>Tên người thuê trọ</th>
                    <th>Số điện thoại</th>
                    <th>Ngày thuê</th>
                    <th>Kiểu thuê</th>
                    <th>Ghi chú</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="customer" items="${List}" varStatus="count">
                    <tr>
                        <td><c:out value="${customer.idThue}"/></td>
                        <td><c:out value="${customer.cName}"/></td>
                        <td><c:out value="${customer.cSDT}"/></td>
                        <td><c:out value="${customer.dateStart}"/></td>
                        <td><c:out value="${customer.typeName}"/></td>
                        <td><c:out value="${customer.description}"/></td>

                        <td>
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-success " data-bs-toggle="modal" data-bs-target="#editProduct" data-bs-whatever="@mDo" idEdit=${product.id} nameEdit="${product.nameProduct}" price=${product.price} quantity=${product.quantity} color=${product.color} description="${product.description}" catogory=${product.category}>Edit </button>
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteProduct" idDelete =${customer.cId}>
                                Delete
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <!-- Modal Delete-->
    <div class="modal fade" id="deleteProduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleDeleteModalLabel">Delete Product</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form method="get" action="/customer">
                        <h3>Bạn có chắc chắn xóa sản phẩm này không? </h3>
                        <input type="hidden" name="idDelete" id="idDelete">
                        <input type="hidden" name="action" value="delete">
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Delete</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <!-- Modal Edit -->
    <div class="modal fade" id="editProduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleEditModalLabel">Edit Product</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form method="post" action="/product">
                        <table cellpadding="5">
                            <tr>
                                <th>Product Name:</th>
                                <td>
                                    <input type="text" name="name" id="nameEdit" size="45"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Product Price:</th>
                                <td>
                                    <input type="text" name="price" id="priceEdit" size="45"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Quantity:</th>
                                <td>
                                    <input type="text" name="quantity" id="quantityEdit" size="15"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Color:</th>
                                <td>
                                    <input type="text" name="color" id="colorEdit" size="15"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Description:</th>
                                <td>
                                    <input type="text" name="description" id="descriptionEdit" size="15"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Category:</th>
                                <td>
                                    <select name="category" id="category" >
                                        <c:forEach var="category" items="${categoryList}" varStatus="count">
                                            <option value="${category.id}">${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <input type="hidden" name="action" value="edit">
                        <input type="hidden" name="id" id="idSend">

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        var exampleModal = document.getElementById('editProduct')
        exampleModal.addEventListener('show.bs.modal', function (event) {
            // Button that triggered the modal
            var button = event.relatedTarget
            // Extract info from data-bs-* attributes
            var recipient = button.getAttribute('data-bs-whatever')
            // If necessary, you could initiate an AJAX request here
            // and then do the updating in a callback.
            //
            // Update the modal's content.
            var modalTitle = exampleModal.querySelector('.modal-title')
            let idSend = exampleModal.querySelector('#idSend')
            var nameEdit = exampleModal.querySelector('#nameEdit')
            let priceEdit = exampleModal.querySelector('#priceEdit')
            let quantity = exampleModal.querySelector('#quantityEdit')
            let color = exampleModal.querySelector('#colorEdit')
            let description = exampleModal.querySelector('#descriptionEdit')
            let catogory = exampleModal.querySelector('#category')

            idSend.value = button.getAttribute('idEdit')
            nameEdit.value = button.getAttribute('nameEdit')
            priceEdit.value = button.getAttribute('price')
            quantity.value = button.getAttribute('quantity')
            color.value = button.getAttribute('color')
            description.value = button.getAttribute('description')
            modalTitle.textContent = 'Edit Product ' + nameEdit.value
            // catogory.value = button.getAttribute('catogory')
        })

        var deleteProduct = document.getElementById('deleteProduct')
        deleteProduct.addEventListener('show.bs.modal', function (event2){
            var buttonDelete = event2.relatedTarget
            var id = deleteProduct.querySelector('#idDelete')

            idDelete.value = buttonDelete.getAttribute('idDelete')
        })
        function submitForm(){
            document.getElementById("formCreate").submit();
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</div>

</body>
</html>
