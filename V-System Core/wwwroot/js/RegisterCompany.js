var MyController = "/RegisterCompany"
 
function onUploadCompanyPhoto() {
    $('#companyPhoto').click(); 
    $("#photoCompanyPreview").attr('src', '/lib/assets/img/uploadphotoimage.jpg');
    $('#companyPhoto').change(function (e) {
        var tmppath = URL.createObjectURL(e.target.files[0]);
        $("#photoCompanyPreview").attr('src', tmppath);
    });
}
 
// Handle form submission
$('#frmRegisterCompany').on('submit', function (e) {
    e.preventDefault();      
    var registerDate = $('#registerDate').val(); 
    var formattedRegisterDate = new Date(registerDate).toISOString().split('T')[0]; 

    var formData = new FormData(); 
    formData.append('company_name', $('#companyName').val());
    formData.append('company_code', $('#companyCode').val());
    formData.append('bussiness_type', $('#businessType').val());
    formData.append('register_number', $('#registrationNumber').val());
    formData.append('register_date', formattedRegisterDate);
    formData.append('address', $('#companyAddress').val());
    formData.append('contact_name', $('#contactName').val());
    formData.append('contact_email', $('#contactEmail').val());
    formData.append('contact_phone', $('#contactPhone').val()); 
    var companyPhoto = $('#companyPhoto')[0].files[0];
    if (companyPhoto) {
        formData.append('companyPhoto', companyPhoto);  
    }  
    $.ajax({
        url: `${MyController}/RegisterCompany`  , 
        type: 'POST',
        data: formData,
        contentType: false,  
        processData: false,  
        success: function (response) { 
            if (response.code == 0) {
                $.toast({
                    title: "Success Message",
                    message: response.message,
                    type: "success",
                    duration: 5000,
                });
                $('#frmRegisterCompany')[0].reset(); 
                $("#photoCompanyPreview").attr('src', '/lib/assets/img/uploadphotoimage.jpg');
                _tblListCompany.ajax.reload();
            } else {
                $.toast({
                    title: "Error",
                    message: response.message,
                    type: "error",
                    duration: 5000,
                });
            }
        },
        error: function (xhr, status, error) { 
            $.toast({
                title: "Error",
                message: error,
                type: "error",
                duration: 5000,
            });
        }
    });
});

var _tblListCompany = '';
function loadCompanyListDataTable() {
    _tblListCompany = $('#tblListCompany').DataTable({
        processing: true,
        "ajax": {
            url: `${MyController}/GetCompanyList`,
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
            {
                data: null,
                render: function (data) {
                    if (data.path_logo == null) {
                        return 'No Logo';
                    } else {
                        return `<img title="${data.company_name}" alt="image" src="${data.path_logo}" style="width:50px;height:50px" class="rounded" />`;
                    } 
                   
                }
            },
            { data: 'company_name' },
            { data: 'company_code' },
            { data: 'bussiness_type' },
            { data: 'register_number' },
            { data: 'register_date' },
            { data: 'address' },
            { data: 'contact_name' },
            { data: 'contact_email' },
            { data: 'contact_phone' },
            {
                data: null,
                render: function (data) {
                    if (data.is_active == true) {
                        return `<div class="text-success"> Active </div>`
                    } else {
                        return `<div class="text-danger"> InActive </div>`
                    } 
                }
            }, 
            {
                data: null,
                render: function (data) {
                    return `
                        <div class="d-flex gap-1 ">
                                <i onclick="onEditCompany(${data.id})" class="cursor-pointer text-primary bi bi-pencil"> </i>
                                |
                                <i onclick="onDeleteCompany(${data.id})" class=" cursor-pointer bi bi-trash text-danger"> </i>
                            </div>`
                }
            }
        ],
        "paging": true,
        "info": true,
        "language": {
            "emptyTable": "No data available"
        }
    });
}