<!DOCTYPE html>
<!-- data sent from ./index.gsp (main page) -->
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Create Person Form</title>
    </head>
    <body>
        <div>
            <h2>Your registration information has automatically been added to your profile</h2><br/>
            <p>Please verify the information. Once you are satisfied, please click the Create button below.</p><br/>
        </div>
        <div>
            <g:form controller="house" action="saveform">
                <label>House Number:</label>
                <g:textField name="houseId" placeholder="Enter YOUR house number here"/><br/>
                <label>First Name: </label>
                <g:textField name="firstName" value="${person['firstName']}"/><br/>
                <label>Last Name: </label>
                <g:textField name="lastName" value="${person['lastName']}"/><br/>
                <label>Sub_Id: </label>
                <g:textField name="subId" value="${person['subId']}" disabled="true"/>
                <g:hiddenField name="subId" value="${person['subId']}"/><br/>
                <lablel>email: </lablel>
                <g:textField name="email" value="${person['email']}" disabled="true"/>
                <g:hiddenField name="email" value="${person['email']}"/><br/>
                <g:actionSubmit controller='house' action='saveform' value="Create"/>
            </g:form>
        </div>
    </body>
</html>