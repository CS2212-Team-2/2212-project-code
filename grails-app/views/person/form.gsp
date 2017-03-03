<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Person Form</title>
</head>
<body>
<g:form controller="person" action="save">
    <label>First Name: </label>
    <g:textField name="firstName"/><br/>
    <label>Last Name: </label>
    <g:textField name="lastName"/><br/>
    <label>Sub_Id: </label>
    <g:textField name="sub_id"/><br/>
    <lable>houseId: </lable>
    <g:textField name="houseId"/><br/>
    <g:actionSubmit value="Save"/>
</g:form>
</body>
</html>