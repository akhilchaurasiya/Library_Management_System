<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.project3.model.BorrowRecord" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Return Confirmation</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="/">Library</a>
</nav>

<div class="container mt-4">
    <h2 class="text-center">Return Confirmation</h2>

    <div class="alert alert-success">
        Book "<%= ((BorrowRecord) request.getAttribute("record")).getBook().getTitle() %>" has been successfully returned!
    </div>

    <% 
    double fine = (double) request.getAttribute("fine");
    if (fine > 0) {
    %>
    <div class="alert alert-warning">
        You have a fine of <strong>$<%= fine %></strong> for late return.
    </div>
    <% } else { %>
    <div class="alert alert-info">
        No fine for this return.
    </div>
    <% } %>

    <a href="/borrowRecords/list" class="btn btn-primary">Back to Borrow Records</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
