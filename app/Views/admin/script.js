document.getElementById('year').addEventListener('change', function() {
    var selectedYear = this.value;
    var monthButtons = '';
    var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

    months.forEach(function(month, index) {
        monthButtons += '<button type="button" onclick="getSales(\'' + selectedYear + '\', \'' + (index + 1) + '\')">' + month + '</button>';
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
