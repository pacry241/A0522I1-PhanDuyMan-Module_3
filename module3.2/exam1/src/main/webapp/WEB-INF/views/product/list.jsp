<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/19/2022
  Time: 7:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
       <jsp:include page="../layout/header.jsp"></jsp:include>

    <title>List Product</title>
</head>
<body>
<jsp:include page="../layout/navbar.jsp"></jsp:include>
    <h2>
<%--        <a href="/product?action=create">Add New User</a>--%>
    </h2>

<div class="container-fluid" align="center">

    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        Add New Product
    </button>

    <!-- Modal -->
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
                                        <label class="input-group-text" for="inputGroupSelect01">Options</label>
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

    <h2>
        <a href="/product?action=search">Search</a>
    </h2>
    <div class="row">
        <div class="col-2"></div>
        <div class="col-10">
            <table  class="table table-striped table table-bordered">
                <tr><h2>List of Users</h2></tr>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Color</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="product" items="${List}" varStatus="count">
                    <tr>
                        <td><c:out value="${product.id}"/></td>
                        <td><c:out value="${product.nameProduct}"/></td>
                        <td><c:out value="${product.price}"/></td>
                        <td><c:out value="${product.quantity}"/></td>
                        <td><c:out value="${product.color}"/></td>
                        <td><c:out value="${product.description}"/></td>
                        <td><c:out value="${product.category}"/></td>
                        <td>
<%--                            <!-- Button to Open the Modal -->--%>
<%--                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal${product.id}">--%>
<%--                                Edit--%>
<%--                            </button>--%>

<%--                            <!-- The Modal -->--%>
<%--                            <div class="modal" id="myModal${product.id}">--%>
<%--                                <div class="modal-dialog">--%>
<%--                                    <div class="modal-content">--%>

<%--                                        <!-- Modal Header -->--%>
<%--                                        <div class="modal-header">--%>
<%--                                            <h4 class="modal-title">Modal Heading</h4>--%>
<%--                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>--%>
<%--                                        </div>--%>

<%--                                        <form id="formEdit${product.id}" method="post" action="/product">--%>
<%--                                        <!-- Modal body -->--%>
<%--                                            <div class="modal-body">--%>

<%--                                                <table cellpadding="5">--%>
<%--                                                    <h2>--%>
<%--                                                        Edit Product--%>
<%--                                                    </h2>--%>
<%--                                                    <c:if test="${product != null}">--%>
<%--                                                        <input type="hidden" name="id" value="<c:out value='${product.id}' />"/>--%>
<%--                                                    </c:if>--%>
<%--                                                    <tr>--%>
<%--                                                        <th>Product Name:</th>--%>
<%--                                                        <td>--%>
<%--                                                            <input type="text" name="name" size="45"--%>
<%--                                                                   value="<c:out value='${product.nameProduct}' />"--%>
<%--                                                            />--%>
<%--                                                        </td>--%>
<%--                                                    </tr>--%>
<%--                                                    <tr>--%>
<%--                                                        <th>Product Price:</th>--%>
<%--                                                        <td>--%>
<%--                                                            <input type="text" name="price" size="45"--%>
<%--                                                                   value="<c:out value='${product.price}' />"--%>
<%--                                                            />--%>
<%--                                                        </td>--%>
<%--                                                    </tr>--%>
<%--                                                    <tr>--%>
<%--                                                        <th>Quantity:</th>--%>
<%--                                                        <td>--%>
<%--                                                            <input type="text" name="quantity" size="15"--%>
<%--                                                                   value="<c:out value='${product.quantity}' />"--%>
<%--                                                            />--%>
<%--                                                        </td>--%>
<%--                                                    </tr>--%>
<%--                                                    <tr>--%>
<%--                                                        <th>Color:</th>--%>
<%--                                                        <td>--%>
<%--                                                            <input type="text" name="color" size="15" value=" <c:out--%>
<%--                            value='${product.color}' />" />--%>
<%--                                                        </td>--%>
<%--                                                    </tr>--%>
<%--                                                    <tr>--%>
<%--                                                        <th>Description:</th>--%>
<%--                                                        <td>--%>
<%--                                                            <input type="text" name="description" size="15" value=" <c:out--%>
<%--                    value='${product.description}'/>  "--%>
<%--                                                            />--%>
<%--                                                        </td>--%>
<%--                                                    </tr>--%>
<%--                                                    <tr>--%>
<%--                                                        <th>Category:</th>--%>
<%--                                                        <td>--%>
<%--                                                            <select name="category" id="category" >--%>
<%--                                                                <c:forEach var="category" items="${categoryList}" varStatus="count">--%>
<%--                                                                    <option value="${category.id}">${category.name}</option>--%>
<%--                                                                </c:forEach>--%>
<%--                                                            </select>--%>
<%--                                                        </td>--%>
<%--                                                    </tr>--%>
<%--                                                    <tr>--%>
<%--                                                        <td colspan="2" align="center">--%>
<%--                                                            <input type="submit" value="Save"/>--%>
<%--                                                        </td>--%>
<%--                                                    </tr>--%>
<%--                                                    <input type="hidden" name="action" value="edit">--%>
<%--                                                    <input type="hidden" name="id" value="${product.id}">--%>
<%--                                                </table>--%>

<%--                                            </div>--%>

<%--                                            <!-- Modal footer -->--%>
<%--                                            <div class="modal-footer">--%>
<%--                                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>--%>
<%--                                                <button type="submit" class="btn btn-primary">Update</button>--%>
<%--                                            </div>--%>
<%--                                        </form>--%>

<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--&lt;%&ndash;                            <a class="btn btn-primary" href="/product?action=edit&id=${product.id}" role="button">Edit</a>&ndash;%&gt;--%>
                            <a class="btn btn-danger" href="/product?action=delete&id=${product.id}" role="button">Delete</a>
                            <!-- Button trigger modal -->
                            <button type="button" onclick="editModal(${product.id}, ${product.nameProduct},${product.price},${product.quantity},${product.color},${product.description})" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                Edit
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            </div>
        </div>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/product" method="post">
                        <table cellpadding="5">
                            <tr>
                                <th>Product ID:</th>
                                <td>
                                    <input type="text" name="id" id="idEdit" size="45"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Product Name:</th>
                                <td>
                                    <input type="text" name="name" id="nameEdit" size="45"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Price:</th>
                                <td>
                                    <input type="text" name="price" id="priceEdit" size="45"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Quantity:</th>
                                <td>
                                    <input type="text" name="quantity" id="quantityEdit" size="45"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Color:</th>
                                <td>
                                    <input type="text" name="color" id="colorEdit" size="45"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Description :</th>
                                <td>
                                    <input type="text" name="description" id="descriptionEdit" size="45"/>
                                </td>
                            </tr>
                            <tr>
                                <%--                                <td colspan="2" align="center">--%>
                                <%--                                    <input type="submit" value="Save"/>--%>
                                <%--                                </td>--%>
                            </tr>
                        </table>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <script>
        function editModal(id,name,price,quantity,color,description){
            document.getElementById('idEdit').value = id;
            document.getElementById('nameEdit').value = name;
            document.getElementById('priceEdit').value = price;
            document.getElementById('quantityEdit').value = quantity;
            document.getElementById('colorEdit').value = color;
            document.getElementById('descriptionEdit').value = description;
        }
        function submitForm(){
            document.getElementById("formCreate").submit();
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</div>
</body>
</html>
