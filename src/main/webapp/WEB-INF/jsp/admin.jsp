<jsp:include page="header.jsp"></jsp:include>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<h2>User List</h2>
<table class="table table-bordered table-hover table-striped">
    <thead>
    <tr>
        <th>User ID</th>
        <th>Email</th>
        <th>Password</th>
        <th>User Name</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items ="${userList}" var = "user">
    <tr id="tr_id_1" class="tr-class-1">
        <td id="td_id_1" class="td-class-1">${user.userId}</td>
        <td>
        <a href='<spring:url value="/users/${user.userId}.html"/>'>${user.email}</a>
        </td>
        <td>${user.password}</td>
        <td>${user.userName}</td>
    </tr>
    </c:forEach>
    </tbody>
</table>



	




<jsp:include page="footer.jsp"></jsp:include>
