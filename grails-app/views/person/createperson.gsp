<!DOCTYPE html>
<!-- data sent from ./index.gsp (main page) -->
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Person Form</title>
</head>
<body>
        <div>
            <h2>Please Enter Your Information Below</h2><br/>
            <p>When you have completed entering your information, you will redirected to create your home.</p>
            <p>After creating your home, you will be asked to add your roommates.</p>
            <p> Each roommate will be notified via email to join the house you have created</p>
            <br/>
        </div>
        <!-- form to enter a new person to the Person Database -->
        <div>
            <g:form controller="person" action="saveperson">
                <label>First Name: </label>
                <g:textField name="firstName" value="${person['firstName']}"/><br/>
                <label>Last Name: </label>
                <g:textField name="lastName" value="${person['lastName']}"/><br/>
                <label>Sub_Id: </label>
                <g:textField name="subId" value="${person['subId']}" disabled="true"/>
                <g:hiddenField name="subId" value="${person['subId']}"/><br/>
                <lable>email: </lable>
                <g:textField name="email" value="${person['email']}" disabled="true"/>
                <g:hiddenField name="email" value="${person['email']}"/><br/>
                <g:actionSubmit controller='person' action='saveperson' value="Create"/>
            </g:form>
        </div>
</body>
</html>