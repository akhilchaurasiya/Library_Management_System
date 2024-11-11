<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.project3.model.Book" %>
<%@ page import="java.util.List , com.project3.model.Author" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add/Edit Book</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="/">Library</a>
</nav>

<div class="container mt-4">
    <h2 class="text-center"><%= (request.getAttribute("book") == null ? "Add" : "Edit") %> Book</h2>

    <form action="<%= request.getAttribute("formAction") %>" method="post">
        <div class="form-group">
            <label for="title">Book Title:</label>

            <!-- Checking if the 'book' object exists and casting only if it's not null -->
            <%
                Book book = (Book) request.getAttribute("book");
                String bookTitle = book != null && book.getTitle() != null ? book.getTitle() : "";
                String bookIsbn = book != null && book.getIsbn() != null ? book.getIsbn() : "";
                Author selectedAuthor = book != null ? book.getAuthor() : null;
            %>
            <input type="text" class="form-control" id="title" name="title" value="<%= bookTitle %>" required>
        </div>

        <div class="form-group">
            <label for="isbn">ISBN:</label>
            <input type="text" class="form-control" id="isbn" name="isbn" value="<%= bookIsbn %>" required>
        </div>

        <div class="form-group">
            <label for="author">Author:</label>
            <select class="form-control" id="author" name="authorId" required>
                <option value="">Select Author</option>
                <% 
                    // Fetch the list of authors from the request scope
                    List<Author> authorList = (List<Author>) request.getAttribute("authors");
                    if (authorList != null) {
                        for (Author author : authorList) {
                            String selected = selectedAuthor != null && selectedAuthor.getId().equals(author.getId()) ? "selected" : "";
                %>
                <option value="<%= author.getId() %>" <%= selected %>><%= author.getName() %></option>
                <% 
                        }
                    }
                %>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
