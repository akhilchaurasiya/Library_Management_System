<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.project3.model.Borrower , com.project3.model.BorrowRecord" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrower List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="/">Library</a>
</nav>

<div class="container mt-4">
    <h2 class="text-center">Borrower List</h2>

    <% if (request.getAttribute("successMessage") != null) { %>
    <div class="alert alert-success" role="alert">
        <%= request.getAttribute("successMessage") %>
    </div>
    <% } %>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Borrower Name</th>
                <th>Email</th>
                <th>Book Title</th>
                <th>Borrow Date</th>
                <th>Due Date</th>
                <th>Return Date</th>
            </tr>
        </thead>
        <tbody>
            <% 
            List<Borrower> borrowerList = (List<Borrower>) request.getAttribute("borrowers");
            for (Borrower borrower : borrowerList) {
                List<BorrowRecord> borrowRecords = borrower.getBorrowRecords(); // Get all borrow records
                for (BorrowRecord record : borrowRecords) {
            %>
            <tr>
                <td><%= borrower.getName() %></td>
                <td><%= borrower.getEmail() %></td>
                <td><%= record.getBook().getTitle() %></td>
                <td><%= record.getBorrowDate() %></td>
                <td><%= record.getDueDate() %></td>
                <td><%= record.getReturnDate() != null ? record.getReturnDate() : "Not Returned" %></td>
            </tr>
            <% } } %>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    window.setTimeout(function() {
        $(".alert").fadeTo(500, 0).slideUp(500, function(){
            $(this).remove(); 
        });
    }, 10000); // 10 seconds
</script>

</body>
</html>
