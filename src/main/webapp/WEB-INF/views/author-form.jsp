<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project3.model.Author" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add/Edit Author</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="/">Library</a>
</nav>

<div class="container mt-4">
    <h2 class="text-center"><%= (request.getAttribute("author") == null ? "Add" : "Edit") %> Author</h2>
    
    <form action="<%= request.getAttribute("formAction") %>" method="post">
        <div class="form-group">
            <label for="name">Author Name:</label>

            <!-- Checking if the 'author' object exists and casting only if it's not null -->
            <%
                Author author = (Author) request.getAttribute("author");
                String authorName = author != null ? author.getName() : "";
            %>
            
            <input type="text" class="form-control" id="name" name="name" value="<%= authorName %>" required>
        </div>

        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
