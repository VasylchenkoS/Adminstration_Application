<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title> ${storage.ingredientName}</title>
    <jsp:include page="/WEB-INF/jsp/components/links.jsp"/>
    <script type="text/javascript">
        function ingrValidate() {
            var form = document.ingr_form;
            if (isNaN(parseFloat(form.quantity.value)) && form.quantity.value != ""){
                alert("Quantity field must be number > 0");
                return false;
            }
            if (parseFloat(form.quantity.value) < 0){
                alert("Quantity field must be number > 0");
                return false;
            }
            return true;
        }
    </script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<%--<jsp:include page="/WEB-INF/jsp/components/header.jsp"/>--%>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-4">
            <span class="glyphicon glyphicon-globe logo slideanim"></span>
            <img src="/static/images/storage/${storage.ingredientName}.jpg"
                 onerror="if (this.src != '/static/images/default.jpg') this.src = '/static/images/default.jpg';"
                 alt="NO IMAGE">
        </div>
        <div class="col-sm-8">
            <div class="jumbotron form-group">
                <form action="${pageContext.request.contextPath}/ingredient/${storage.id}/update" method="post" name="ingr_form" id="ingr_form" onsubmit="return ingrValidate()">
                    <label>ID:${storage.id}, </label> <label>${storage.ingredientName}</label>
                    <br>
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" value="${storage.ingredientName}" name="name" style="align-self: auto" required/>
                    <label for="quantity">Quantity</label>
                    <input type="text" class="form-control" id="quantity" value="${storage.quantity}" name="quantity"/>
                    <input type="hidden" name="${_csrf.parameterName}" 	value="${_csrf.token}" />
                    <br>
                    <div class="col-sm-3">
                        <input type="submit" class="btn btn-block btn-primary btn-default" value="Append">
                    </div>
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-block btn-primary btn-default"
                                name="button-redirect" onclick="location.href='/storage'">Back</button>
                    </div>
                    <c:if test="${flag == 'modify'}">
                        <br>
                        <h1 align="center">Updating success!</h1>
                    </c:if>
                    <c:if test="${flag == 'add'}">
                        <br>
                        <h1 align="center">Adding success!</h1>
                    </c:if>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../components/footer.jsp"/>
</body>
</html>
