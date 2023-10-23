<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Table of Contents</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @media print {
            /* Hide navigation and footer when printing */
            nav, footer {
                display: none;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">Table of Contents</a>
        </div>
    </nav>
    
    <div class="container mt-5">
        <h1>Table of Contents</h1>
        <ol>
            <li><a href="#section1">Section 1</a></li>
            <li><a href="#section2">Section 2</a></li>
            <li><a href="#section3">Section 3</a></li>
        </ol>
    </div>
    
    <div class="container mt-5" id="section1">
        <h2>Section 1</h2>
        <p>This is the content of section 1.</p>
    </div>
    
    <div class="container mt-5" id="section2">
        <h2>Section 2</h2>
        <p>This is the content of section 2.</p>
    </div>
    
    <div class="container mt-5" id="section3">
        <h2>Section 3</h2>
        <p>This is the content of section 3.</p>
    </div>
    
    <footer class="bg-light text-center p-3">
        <p>&copy; 2023 Your Company. All Rights Reserved.</p>
    </footer>

    <script>
        // JavaScript code can be added here if needed
    </script>
</body>
</html>
