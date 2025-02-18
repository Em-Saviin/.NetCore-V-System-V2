
$('#btnPrint').on('click', function () { 
    setTimeout(function () {  
        var totalPages = Math.ceil(document.body.scrollHeight / window.innerHeight);
        var footerText = "Page " + counterPage() + " of " + totalPages;
        var footerText2 = `
                  <div style="display: flex; justify-content: space-between; width: 100%;">
                        <h5 style="margin: 0;">@Print by Savin Em</h5>
                        <span style="margin-left: 10px; margin: 0;">${footerText}</span>
                    </div>

    ` 
        $('#pageFooter').append(footerText2);
        window.print();
    }, 500);  
});

function counterPage() {
    var pages = document.body.getElementsByTagName('footer');
    var current = 1;   
    return current;  
}