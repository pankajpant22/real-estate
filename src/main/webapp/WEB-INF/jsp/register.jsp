<jsp:include page="header.jsp"></jsp:include>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<h2>Register</h2>

<form:form commandName="user" cssClass="form-horizontal">
	<div class="form-group">
    	<label for="name" class="col-sm-2 control-label">User Name: </label>
    <div class="col-sm-10">
      <form:input path="userName" cssClass="form-control"/>
    </div>
  	</div>
  	<div class="form-group">
    	<label for="email" class="col-sm-2 control-label">Email: </label>
    <div class="col-sm-10">
      <form:input path="email" cssClass="form-control"/>
    </div>
  	</div>
  	<div class="form-group">
    	<label for="password" class="col-sm-2 control-label">Password: </label>
    <div class="col-sm-10">
      <form:password path="password" cssClass="form-control"/>
    </div>
  	</div>
  	<div class="form-group">
    <div class="col-sm-10">
    	<input type="submit" value="Submit" class="btn btn-lg btn-primary">
    </div>
  	</div>
  	
</form:form>



<jsp:include page="footer.jsp"></jsp:include>
