<!DOCTYPE html>
<html>
<head>
    <title>PersonHouse</title>
</head>
<body>
    <div>
        <h2>PersonHouse</h2>
        <g:each in="${list}" var="item">
            <li>Person Id: ${item.personId}</li><br/>
            <li>House Id: ${item.houseId}</li>
        </g:each>
    </div>
</body>
</html>