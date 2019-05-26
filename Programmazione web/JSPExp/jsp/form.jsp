<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
</head>
<body>
    <% 
    if(request.getParameter("name")!=null && request.getParameter("name")!="") { %>
        <p>Welcome <%=request.getParameter("name")%></p>
        <p>The jsp works fine!!</p>
    <%} else{%>
    <h4>Please complete the form</h4>
    <form action="form.jsp" method="POST">
        <input type="text" name="name">Name<br/>
        <input type="submit" value="Send">
    </form>
    <%}%>
</body>
</html>