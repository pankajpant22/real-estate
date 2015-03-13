<jsp:include page="header.jsp"></jsp:include>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2> User ${user.userName} Properties & Details</h2>

<table class="table table-bordered table-hover table-striped">
    <thead>
    <tr>
        <th>User ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>City</th>
        <th>Price</th>
        <th>Zip</th>
        <th>Published Date</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${user.properties}" var="prop">
	<tr id="tr_id_1" class="tr-class-1">
        <td id="td_id_1" class="td-class-1">${prop.id}</td>
        <td>${prop.name}</td>
        <td>${prop.address}</td>
        <td>${prop.city}</td>
        <td>${prop.price}</td>
        <td>${prop.zip}</td>
        <td>${prop.publishedDate}</td>
    </tr>
	</c:forEach>
    </tbody>
</table>



	




<jsp:include page="footer.jsp"></jsp:include>
