var MyController = "/RegisterUsers"

function onBrowseImage() {
    $("#userImage").attr('src', '/lib/assets/img/uploadphotoimage.jpg'); 
    $("#inputImage").click(); 
    $('#inputImage').change(function (e) { 
        var tmppath = URL.createObjectURL(e.target.files[0]);  
        $("#userImage").attr('src', tmppath); 
    });

}
$("#userModal").modal('hide');
function OpenModalUser() {
    $("#userModal").modal('show');
}
var _tblUser = '';
function InitializeTblUser() {
    _tblUser = $('#tblUser').DataTable({
        processing: true,
        "ajax": {
            url: `${MyController}/GetUserList`  ,
            dataSrc: 'data', 
            error: function (xhr, error, thrown) {
                console.log('Error occurred while loading data: ', error);
            }
        },
        columns: [
            {
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            { data: 'firstname' },
            { data: 'lastname' },
            { data: 'username' },
            { data: 'email' },
            { data: 'sex' },
            { data: 'address' },
            { data: 'phone' }, 
            {
                data: null,
                render: function (data) {
                    if (data.is_active == true) {
                        return `<div class="text-success">Active</div>`;
                    } else if (data.is_active == false) {
                        return `<div class="text-danger">InActive</div>`;
                    } 
                }
            }, 
        ],
        "paging": true,
        "info": true,
        "language": {
            "emptyTable": "No data available"
        }, 
    });
}

$('form').on('submit', function (e) {
    e.preventDefault();   
    var formData = new FormData();  
    formData.append('companyName', $('#companyName').val());
    formData.append('companyCode', $('#companyCode').val());
    formData.append('businessType', $('#businessType').val());
    formData.append('industry', $('#industry').val());
    formData.append('registrationNumber', $('#registrationNumber').val());
    formData.append('incorporationDate', $('#incorporationDate').val());
    formData.append('companyAddress', $('#companyAddress').val());
    formData.append('contactName', $('#contactName').val());
    formData.append('contactEmail', $('#contactEmail').val());
    formData.append('contactPhone', $('#contactPhone').val()); 

    var companyPhoto = $('#companyPhoto')[0].files[0];
    if (companyPhoto) {
        formData.append('companyPhoto', companyPhoto);  
    } 
    $.ajax({
        url: `${MyController}/RegisterUser` ,   
        type: 'POST',
        data: formData,
        processData: false,  
        contentType: false, 
        success: function (response) { 
            console.log('Company registered successfully:', response);
            alert('Company registered successfully!');
        },
        error: function (xhr, status, error) { 
            console.error('Error occurred while registering company:', error);
            alert('There was an error while registering the company.');
        }
    });
});