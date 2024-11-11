<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .quote {
            font-style: italic;
            font-size: 1.2rem;
            color: #555;
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="/">Library</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="/books/list">Books</a></li>
            <li class="nav-item"><a class="nav-link" href="/authors/list">Authors</a></li>
            <li class="nav-item"><a class="nav-link" href="/borrowers/list">Borrowers</a></li>
            <li class="nav-item"><a class="nav-link" href="/borrowRecords/list">Borrow Records</a></li>
        </ul>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="text-center">Welcome to the Library Management System</h2>
    <p class="text-center">"A library is not a luxury but one of the necessities of life." - <strong>Henry Ward Beecher</strong></p>
    
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Manage Books</h5>
                    <p class="card-text">Add, edit, and manage the books in the library collection.</p>
                    <a href="/books/list" class="btn btn-primary">Go to Books</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Manage Authors</h5>
                    <p class="card-text">Add new authors and manage existing ones.</p>
                    <a href="/authors/list" class="btn btn-primary">Go to Authors</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Manage Borrowers</h5>
                    <p class="card-text">View and manage borrowers in the library system.</p>
                    <a href="/borrowers/list" class="btn btn-primary">Go to Borrowers</a>
                </div>
            </div>
        </div>
    </div>

    <div class="quote">
        <p>"I have always imagined that Paradise will be a kind of library." - <strong>Jorge Luis Borges</strong></p>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
