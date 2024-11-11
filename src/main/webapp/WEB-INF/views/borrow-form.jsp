<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.project3.model.Book" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow a Book</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="/">Library</a>
</nav>

<div class="container mt-4">
    <h2 class="text-center">Borrow a Book</h2>

    <form action="/borrowRecords/borrow" method="post">
        <div class="form-group">
            <label for="borrowerName">Borrower Name:</label>
            <input type="text" class="form-control" id="borrowerName" name="borrowerName" required>
        </div>

        <div class="form-group">
            <label for="borrowerEmail">Borrower Email:</label>
            <input type="email" class="form-control" id="borrowerEmail" name="borrowerEmail" required>
        </div>

        <div class="form-group">
            <label for="book">Select Book:</label>
            <select class="form-control" id="book" name="bookId" required>
                <option value="">Select Book</option>
                <% 
                List<Book> books = (List<Book>) request.getAttribute("books");
                for (Book book : books) {
                %>
                <option value="<%= book.getId() %>"><%= book.getTitle() %></option>
                <% } %>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Borrow</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
