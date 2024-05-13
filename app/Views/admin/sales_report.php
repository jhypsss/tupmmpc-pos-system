<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POS Sales</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
        }

        .btn-month {
            background-color: gray;
            color: #fff;
            padding: 10px 20px;
            margin: 5px;
            border-radius: 5px;
            border: none;
            width: 80px; /* Adjust button width */
        }

        .btn-month.active {
            background-color: #007bff;
        }

        #salesTable table {
            width: 100%;
            border-collapse: collapse;
        }

        #salesTable th, #salesTable td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        #salesTable th {
            background-color: #007bff;
            color: #fff;
            text-align: left;
        }

        #salesTable tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #salesTable tr:hover {
            background-color: #ddd;
        }

        .calculator-buttons {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-end;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            border: solid 1px;
        }

        @media print {
            body * {
                visibility: hidden;
            }
            #salesTable, #salesTable * {
                visibility: visible;
            }
            #salesTable {
                position: absolute;
                left: 0;
                top: 0;
            }
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-11">
                <div class="card form-container">
                    <h2 class="text-center mb-4"><a href="../../../public/index.php?pg=admin&tab=sales"><img src="back_btn.PNG" alt="" style="cursor: pointer; width: 35px; height: 33px; padding: 5px; background-color: gray; border-radius: 5px; float: left;"></a><img src="check_list.PNG" style="width: 80px;" alt=""> GENERATE REPORTS</h2>
                    <form action="get_sales.php" method="post">
                        <div class="form-group">
                            <select class="form-control" name="year" id="year" required>
                                <option value="">Select Year: </option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                                <!-- Add more options as needed -->
                            </select>
                        </div>
                        <!-- <button type="submit" class="btn btn-primary btn-block">Show Sales</button> -->
                    </form>

                <div id="monthButtons" class="calculator-buttons"></div>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-12 text-right">
                <button class="btn btn-success" onclick="printSalesTable()" style="margin-bottom: -60px; margin-top: -30px;">Print Data</button>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-12" id="salesTable"></div>
        </div>

    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // Function to get sales data for today's date
        function getTodaySales() {
            var currentDate = new Date();
            var year = currentDate.getFullYear();
            var month = currentDate.getMonth() + 1; // Month is zero-indexed
            var day = currentDate.getDate();
            
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState == XMLHttpRequest.DONE) {
                    if (xhr.status == 200) {
                        document.getElementById('salesTable').innerHTML = xhr.responseText;
                    } else {
                        console.error('Error fetching today\'s sales data');
                    }
                }
            };
            xhr.open('GET', 'get_sales.php?year=' + year + '&month=' + month + '&day=' + day, true);
            xhr.send();
        }

        // Call getTodaySales function when the page loads
        window.onload = function() {
            getTodaySales();
        };
    </script>

    <script>
        document.getElementById('year').addEventListener('change', function() {
        var selectedYear = this.value;
        var monthButtons = '';
        var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec', 'Annual'];

        months.forEach(function(month, index) {
            monthButtons += '<button style="background-color: gray;" type="button" class="calculator-buttons" onclick="getSales(\'' + selectedYear + '\', \'' + (index + 1) + '\')">' + month + '</button>';
        });

        document.getElementById('monthButtons').innerHTML = monthButtons;
    });

    function getSales(year, month) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                if (xhr.status == 200) {
                    document.getElementById('salesTable').innerHTML = xhr.responseText;
                } else {
                    console.error('Error fetching sales data');
                }
            }
        };
        xhr.open('GET', 'get_sales.php?year=' + year + '&month=' + month, true);
        xhr.send();
    }

    function printSalesTable() {
        window.print();
    }

    </script>
</body>
</html>
