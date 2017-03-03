<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Add Your Roommates</title>
</head>
<body>
<h3>${message}</h3>
<div>
    <h2>Add Roommates</h2>
    <br/>
    <br/><br/>

    <h4>Please add your HouseMates in the form below</h4>
    <br/>

    <div>
        <g:form controller="house" action="sendLink">
            <label>Person Name: </label>
            <g:textField name="emailName"/><br/>
            <label>Email Address: </label>
            <g:textField name="emailAddres"/><br/>
            <label>Message</label>
            <g:textArea name="text" />
            <br/>
            <g:actionSubmit value="Send"/>
        </g:form>
    </div>
</div>
</body>
</html>