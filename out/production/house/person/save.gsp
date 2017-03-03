<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Render Domain</title>
</head>
<body>
<table>
    <tr>
        <td>Name</td>
        <td>Age</td>
    </tr>
    <g:each in="${lists}" var="list">
        <tr>
            <td>${list.toString()}
        </tr>
    </g:each>
</table>
</body>
</html>
