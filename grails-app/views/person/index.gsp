<!DOCTYPE>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Persons in Person Database</title>
</head>
<body>
<div>
    <g:each in="${nameList}" var="item">
        <div>
            <g:each in="${item}" var="subItem">
                Name: ${subItem[0]}<br/>
                email: ${subItem[1]}<br/>
                ID: ${subItem[2]}<br/>
            </g:each>
        </div>
    </g:each>
</div>
<!--<div>
    <g:each in="${person}" var="per" status="i">
        <h3>${i+1}. ${per.lastName}, ${per.firstName}</h3>
        <p>
            sub_ID: ${per.subId}, email: ${per.email}
        </p>
        <br/>
    </g:each>
</div>-->
</body>


</html>