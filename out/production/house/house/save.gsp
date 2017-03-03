<!DOCTYPE>
<html>
<head>
    <title>Create House Member</title>
    <meta name="layout" content="main"/>
</head>
<body>

<h1>Add Person to House</h1>
<br/>
 <br/>
<g:form controller="house" action="personsave">
    <label>First Name: </label>
    <g:textField name="firstName"/><br/>
    <label>Last Name: </label>
    <g:textField name="lastName"/><br/>
    <label>Sub_Id: </label>
    <g:textField name="sub_id"/><br/>
    <lable>houseId: </lable>
    <g:textField name="houseId" value="${house.houseId}"/><br/>
    <g:actionSubmit value="personsave"/>
</g:form>
<br/>
    <h4>When All Roommates are added Click Completed</h4>
    <g:form controller="house" action="completed">
       <g:actionSubmit value="Completed"/>
    </g:form>

</body>
</html>