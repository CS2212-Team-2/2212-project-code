<!DOCTYPE html>
<!--Datasent from PersonController, createperson() method-->
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create House Form</title>
</head>
<body>
    <div>
        <h2>Please Enter You House Name</h2>
        <p>After you have entered your house name, please save.</p>
        <p>On the next page you will be asked to add your HouseMates</p>
        <p>Please have their email address ready.</p>
        <br/>

    <!-- form to create house, house ID is auto generate -->
    <div>
        <g:form controller="house" action="save">
            <label>House Name: </label>
            <g:textField name="houseName"/><br/>
            <label>Your House Id is: </label>
            <g:textField name="houseId" value="${idNumber}" disabled="true"/>
            <g:hiddenField name="houseId" value="${idNumber}"/><br/>
            <g:actionSubmit value="Save"/>
        </g:form>
    </div>
</body>
</html>