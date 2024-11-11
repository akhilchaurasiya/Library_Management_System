<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.project3.model.BorrowRecord" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow Records</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="/">Library</a>
</nav>

<div class="container mt-4">
    <h2 class="text-center">Borrow Records</h2>

    <a href="/borrowRecords/borrow" class="btn btn-success mb-3">Borrow a Book</a>

    <% if (request.getAttribute("successMessage") != null) { %>
    <div class="alert alert-success" role="alert">
        <%= request.getAttribute("successMessage") %>
    </div>
    <% } %>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Borrower Name</th>
                <th>Book Title</th>
                <th>Borrow Date</th>
                <th>Due Date</th>
                <th>Return Date</th>
                <th>Fine (if applicable)</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
            List<BorrowRecord> recordList = (List<BorrowRecord>) request.getAttribute("records");
            for (BorrowRecord record : recordList) {
                // Calculate the fine
                double fine = 0;
                if (record.getReturnDate() != null && record.getReturnDate().isAfter(record.getDueDate())) {
                    long daysLate = record.getReturnDate().toEpochDay() - record.getDueDate().toEpochDay();
                    fine = daysLate * 5.0; // Assuming fine is 5 per day late
                }
            %>
            <tr>
                <td><%= record.getBorrower().getName() %></td>
                <td><%= record.getBook().getTitle() %></td>
                <td><%= record.getBorrowDate() %></td>
                <td><%= record.getDueDate() %></td>
                <td><%= record.getReturnDate() != null ? record.getReturnDate() : "Not Returned" %></td>
                <td><%= fine > 0 ? "$" + fine : "No Fine" %></td>
                <td>
                    <% if (record.getReturnDate() == null) { %>
                    <a href="/borrowRecords/return/<%= record.getId() %>" class="btn btn-warning btn-sm">Return</a>
                    <a href="/borrowRecords/renew/<%= record.getId() %>" class="btn btn-primary btn-sm">Renew</a>
                    <% } else { %>
                    <span class="text-muted">Returned</span>
                    <% } %>
                </td>
            </tr>
            <% } %>
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
