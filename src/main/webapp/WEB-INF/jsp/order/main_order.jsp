<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders</title>
    <jsp:include page="../components/links.jsp"/>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<jsp:include page="../components/header.jsp"/>

<div class="jumbotron text-center">
    <jsp:include page="../components/body_header.jsp"/>
</div>
<div id="about" class="container-fluid bg-grey">
    <div>
        <table id="table" class="sortable" align="center">
            <thead>
            <tr>
                <th><h3>ID</h3></th>
                <th><h3>Waiter</h3></th>
                <th><h3>Dishes</h3></th>
                <th><h3>Table №</h3></th>
                <th><h3>Date</h3></th>
                <th><h3>State</h3></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="current_order">
                <tr>
                    <td>${current_order.id}</td>
                    <td>${current_order.employee.name} ${current_order.employee.surname}</td>
                    <td>
                        <c:forEach items="${current_order.dishList}" var="dish">
                            <div align="left">
                                <label> Name: ${dish.name} </label>
                                <label>        </label>
                                <label> Price: ${dish.price} </label>
                            </div>
                        </c:forEach>
                    </td>
                    <td>${current_order.table.number}</td>
                    <td>${current_order.date}</td>
                    <td>${current_order.orderState}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <br>
    <div class="container-fluid">
        <form class="form-inline" action="${pageContext.request.contextPath}/ingredient/filter" method="get">
            <div class="col-sm-2">
                <input type="text" class="form-control" name="filterDate" placeholder="Input start date">
            </div>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="filterDate" placeholder="Input end date">
            </div>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="filterWaiter" placeholder="Input waiter name">
            </div>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="filterTable" placeholder="Input table №">
            </div>
            <div class="col-sm-2">
                <input type="submit" class="btn btn-block btn-primary btn-default" value="Filter">
            </div>
            <div class="col-sm-2">
                <button type="reset" class="btn btn-block btn-primary btn-default">Clear</button>
            </div>
            <div class="col-sm-6"></div>
        </form>
        <br>
        <br>
        <div class="col-sm-6"></div>
        <div class="col-sm-4"></div>
        <div class="col-sm-2">
            <input type="button" class="btn btn-block btn-primary btn-default" value="Back" onclick="location.href='/orders'">
        </div>
    </div>
    <jsp:include page="../components/sortscript.jsp"/>
    <jsp:include page="../components/footer.jsp"/>
</body>
</html>