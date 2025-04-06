var MyController = "/RegisterUsers"
$(document).ready(function () {
    InitializeTblUser();
    StartupIndex();
    makeDraggable($('#userModal .modal-header'));
})
function StartupIndex() {
    $.ajax({
        url: "/RegisterUsers/LookupData",
        type: "GET",
        success: function (rs) {
            if (rs.code == 0) {
                var lookupCompany = rs.company.map(function (item) { return { id: item.id, text: item.text }; });
                var lookupDepartment = rs.department.map(function (item) { return { id: item.id, text: item.text }; });

                $('#slsCompany').select2({
                    data: lookupCompany,
                    dropdownParent: $('#userModal'),
                });
                $('#slsDepartment').select2({
                    dropdownParent: $('#userModal'),
                    data: lookupDepartment
                });
            }
        }
    })
}
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
                                    <button class="btn btn-sm ms-auto p-0" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                          <i class="fw-bolder bi bi-grip-vertical text-secondary ">  </i>
                                    </button>  
                                    <ul class="dropdown-menu p-0">
                                        <li>
                                            <a class="dropdown-item btn-delete-transition" href="javascript:"> <i class="bi bi-pencil-fill text-success"></i> Edit </a>
                                        </li> 		
                                        <li>
                                            <a class="dropdown-item btn-copy-transition" href="javascript:"><i class="bi bi-trash3 text-danger"></i> Delete </a>
                                        </li> 	
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