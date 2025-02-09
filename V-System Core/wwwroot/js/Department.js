//--------------global viriable---------------------
var MyController = "/Department"
 
 
function loadTree() {
    $.ajax({
        url: `${MyController}/GetCompanies` ,
        method: 'GET',
        dataType: 'json',
        success: function (response) {
            if (response.code == 0) {
                var _company = response.data;
                $("#accordingTree").empty();
                $("#accordingTree").append(`<div class="text-muted mx-1 text-start fw-bold pb-1">Sample Tree:  </div>`)
                _company.map(function (item, index) {
                    const collapseId = `collapse-${item.id}`;
                    const headerId = `heading-${item.id}`; 
                    $("#accordingTree").append(`
                        <div class="accordion-item" id="accordion-item-${item.id}">
                            <h2 class="accordion-header" id="${headerId}"> 
                                <button class="accordion-button " type="button" data-bs-toggle="collapse" 
                                    data-bs-target="#${collapseId}" aria-expanded="false" aria-controls="${collapseId}">
                                   <div style="font-size:15px;" class="d-flex justify-content-between">   <i class="bi bi-building"></i>  &nbsp;   ${item.text}  </div>   
                                </button>
                            </h2>
                            <div id="${collapseId}" class="accordion-collapse collapse" aria-labelledby="${headerId}" 
                                data-bs-parent="#accordingTree">
                                <div class="accordion-body py-1">
                                    Loading...
                                </div>
                            </div>
                        </div>
                    `);
                });

                $('#accordingTree').on('shown.bs.collapse', '.accordion-collapse', function () {
                    const collapseId = $(this).attr('id');
                    const companyId = collapseId.split('-')[1];

                    if (!$(this).find('.accordion-body').html().trim() === 'Loading...') {
                        return;
                    }

                    loadCompanyData(companyId, collapseId);
                });
            }
        },
        error: function () {
            alert('An error occurred while loading companies.');
        }
    });
}
 

function loadCompanyData(companyId, collapseId) {
    $.ajax({
        url:`${MyController}/GetDepartments`,
        method: 'GET',
        data: { companyId :  companyId},
        dataType: 'json',
        success: function (response) {
            if (response.code == 0) {
                $(`#${collapseId}`).find('.accordion-body').html(`
                    <ul> 
                        ${response.data.map(item => `  <li class="p-1" style="font-size:15px;">  <a href="#" class="text-dark">  <i class="bi bi-align-start"></i> &nbsp;&nbsp;  Department ${item.text}  </a> </li>  `).join('')}
                    </ul>
                `);
            } else {
                $(`#${collapseId}`).find('.accordion-body').html('No data available.');
            }
        },
        error: function () {
            $(`#${collapseId}`).find('.accordion-body').html('Error loading company data.');
        }
    });
}

var _tblDepartment = '';
function InitializeTableDepartment() {
    _tblDepartment = $('#tblDepartment').DataTable({
        processing: true,
        "ajax": {
            url: `${MyController}/GetAllDepartments` ,
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
            { data: 'company_name' }, 
            { data: 'name' },
            { data: 'create_date' },
            {
                data: null,
                render: function (data) {
                    if (data.is_active == false) {
                        return ` <div class="text-danger"> InActive </div> `
                    } else {
                        return ` <div class="text-success"> Active </div> `
                    }
                }
            },
            {
                data: null,
                render: function (data) {
                    return `
                        <div class="d-flex gap-1 ">
                                <i onclick="onEditMenu(${data.id})" class="cursor-pointer text-primary bi bi-pencil"> </i>
                                |
                                <i onclick="onDeleteMenu(${data.id})" class=" cursor-pointer bi bi-trash text-danger"> </i>
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