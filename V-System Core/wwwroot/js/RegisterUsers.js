var MyController = "/RegisterUsers"
  
function onBrowseImage() {
    $("#userImage").attr('src', '/lib/assets/img/uploadphotoimage.jpg'); 
    $("#inputImage").click(); 
    $('#inputImage').change(function (e) { 
        var tmppath = URL.createObjectURL(e.target.files[0]);  
        $("#userImage").attr('src', tmppath); 
    });

}

function OpenModalUser() {
    $("#userModal").modal('show');
}
function OnCLoseModal() {
    $("#userModal").modal('hide');
}
var _tblUser = '';
function InitializeTblUser() {
    $("#tblUser tbody").empty();
    $.post({
        url: `${MyController}/GetUserList`,
        success: function (rs) { 
            var _dataUser = rs.data; 
                _dataUser.map(function (item, index) {
                    var _IsActive = `<div class="text-success"> Active </div>`
                    if (item.is_active == false) {
                        _IsActive = `<div class="text-danger"> Active </div>`
                    }
                    $("#tblUser tbody").append(`
                         <tr>
                            <td>${index + 1}</td>
                            <td>${item.firstname}</td>
                            <td>${item.lastname}</td>
                            <td>${item.username}</td>
                            <td>${item.email}</td>
                            <td>${item.sex}</td>
                            <td>${item.address}</td>
                            <td>${item.phone}</td>
                            <td>${_IsActive}</td>
                            <td>
                             <div class="dropdown">
                                    <button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown-menu">
                                        Actions
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Edit</a></li>
                                        <li><a class="dropdown-item" href="#">Delete</a></li>
                                        <li><a class="dropdown-item" href="#">View</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
        
                     `);
                })   
        },
        error: function (err) {

        }
    })


    //_tblUser = $('#tblUser').DataTable({
    //    processing: true,
    //    "ajax": {
    //        url: `${MyController}/GetUserList`  ,
    //        dataSrc: 'data', 
    //        error: function (xhr, error, thrown) {
    //            console.log('Error occurred while loading data: ', error);
    //        }
    //    },
    //    columns: [
    //        {
    //            render: function (data, type, row, meta) {
    //                return meta.row + meta.settings._iDisplayStart + 1;
    //            }
    //        },
    //        { data: 'firstname' },
    //        { data: 'lastname' },
    //        { data: 'username' },
    //        { data: 'email' },
    //        { data: 'sex' },
    //        { data: 'address' },
    //        { data: 'phone' }, 
    //        {
    //            data: null,
    //            render: function (data) {
    //                if (data.is_active == true) {
    //                    return `<div class="text-success">Active</div>`;
    //                } else if (data.is_active == false) {
    //                    return `<div class="text-danger">InActive</div>`;
    //                } 
    //            }
    //        }, 
    //        {
    //            data: null,
    //            render: function (data) {
    //                return `
                       
    //                `
    //            }
    //        }
    //    ],
    //    "paging": true,
    //    "info": true,
    //    "language": {
    //        "emptyTable": "No data available"
    //    }, 
    //});
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