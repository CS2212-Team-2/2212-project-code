<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create House Form</title>
</head>
<body>
<h3>${message}</h3>
<br/>
<p id="demo"></p>
<script>
    var per, x;
    per = {"name":'${person}'};
    x = per['name'];
    document.getElementById("demo").innerHTML = x;
</script>

    <h3>Hello ${person.firstName}!</h3><br/>
    <h3>ID: ${person.sub_id}</h3><br/>

<div>
    <h2>Welcome to House Mates!</h2>
    <br/>
    <br/>
    <h4>Our Database told us you are not yet registered...Please Create A House, then add your roommates</h4>
    <br/>
    <g:form name="form" controller="house" action="createhouse">
        <g:hiddenField name="per" value=""/>
        <g:submitButton name="submit" value="Create House"/>
    </g:form>

</div>
</body>
</html>