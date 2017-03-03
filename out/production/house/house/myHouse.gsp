<!DOCTYPE html>
<html>
<head>
    <title>Welcome Home!</title>
</head>
<body>
    <!--code for top right corner, user name, logout and add person -->
    <div style="position:relative; left: 1200px;">
        <h3>Welcome Home: ${user}</h3>
        <g:form controller="PersonHouse" action="logout">
            <g:submitButton name="logout" controller="PersonHouse" action="logout" value="logout" />
        </g:form>
    </div>

    <!-- to add new user-->
    <div style="position:relative; left: 1200px;">
        <g:form controller="EmailSender" action="index">
            <g:submitButton name="addRoommate" controller="EmailSender" action="index" value="Add Person" />
        </g:form>
    </div>
    <br/>

    <div style="width:auto;height:200px;"><h3>BIG BOX GOES HERE</h3></div>
    <!-- returns the users roommates -->

    <div>
        <h4>${user}'s HouseMates</h4>
        <g:each in="${persons}" var="item">
                <g:each in="${item}" var="subItem">
                    <p>Name: ${subItem[0]}</p>
                    <p>Email: ${subItem[1]}</p>
                </g:each>
        </g:each>
    </div>

</body>
</html>