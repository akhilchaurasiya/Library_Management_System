<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fine</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="/">Library</a>
</nav>

<div class="container mt-4">
    <h2 class="text-center">Fine</h2>

    <% if (request.getAttribute("fine") != null) { %>
    <div class="alert alert-warning" role="alert">
        The fine for this borrow record is: <strong>$<%= request.getAttribute("fine") %></strong>
    </div>
    <% } else { %>
    <div class="alert alert-success" role="alert">
        No fine applicable for this borrow record.
    </div>
    <% } %>

    <a href="/borrowRecords/list" class="btn btn-primary">Back to Records</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
