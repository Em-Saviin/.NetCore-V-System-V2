var currentDate = new Date();
var day = currentDate.getDate();
var month = currentDate.getMonth();
var year = currentDate.getFullYear();
var hours = currentDate.getHours();
var minutes = currentDate.getMinutes();
var seconds = currentDate.getSeconds();

var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

var reportDate = day + '-' + months[month] + '-' + year + ' ' + hours + ':' + minutes + ':' + seconds;


$('#btnPrint').on('click', function () {

    var headerHTML =
        ` <div id="printHeader" style="text-align: left; padding: 10px; padding-bottom:10px;   width: 100%; background-color:transparent ">
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <div>
                    <img src="~/lib/assets/img/v-systemlogo.png" alt="Company Logo" style="height: 50px;">
                </div>
                <div style="text-align:end">
                    <h1>BOOSTRAP COMPANY</h1>
                    <p>Report Date: ${reportDate}</p>
                    <p>Report By: Em Savin </p>
                </div>
            </div>
        </div> `;
    setTimeout(function () {
        var totalPages = Math.ceil(document.body.scrollHeight / window.innerHeight);
        var footerText = "Page " + counterPage() + " of " + totalPages;
        var footerText2 = `
                  <div style="display: flex; justify-content: space-between; width: 100%;">
                        <h5 style="margin: 0;">@Print by Savin Em</h5>
                        <span style="margin-left: 10px; margin: 0;">${footerText}</span>
                    </div>

    `
        $('#headerPage').append(headerHTML);
        $('#pageFooter').append(footerText2);
        window.print();
        $('#pageFooter').empty();
        $('#headerPage').empty();

    }, 500);
});

function counterPage() {
    var pages = document.body.getElementsByTagName('footer');
    var current = 1;
    return current;
}

 