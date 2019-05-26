<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Counter Page</title>
</head>
<body>
    <h3>This is a simple counter page</h3>
    <%! private int global=0; %>
    <% int local=0; %>
    <p>Local access: <%=++local%></p>
    <p>Global access: <%=++global%></p>
</body>
</html>