<!DOCTYPE html>
<html>
<head>
    <title>Delete Account</title>

</head>
    <div style="position:relative; left:35%;">
        <h3>Enter your email address to delete your account</h3>
        <g:form controller = 'person' action="remove">
            <label>Email Address</label>
            <g:textField name="email" value="" />
            <g:actionSubmit controller="person" action="remove" name="email" value="delete" placehoder="Enter email address"/>
        </g:form>
    </div>
    <div>
        <h1>${message}</h1>
    </div>
</html>