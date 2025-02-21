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
    $('#tblDepartment tbody').empty();
    $.ajax({
        url: `${MyController}/GetAllDepartments`,
        type: "GET",
        success: function (rs) {
            console.log(rs)
            const _dataDep = rs.data;
            if (_dataDep.length > 0) {
                _dataDep.map(function (item, index) {
                    const _IsActive = item.is_active;
                    const valueActive = `<div class="text-success"> Active </div>`;
                    if (_IsActive == false) {
                        valueActive = ` <div class="text-danger"> InActive </div> `
                    }
                    $('#tblDepartment tbody').append(`
                    <tr class="text-center">
                            <td>${index + 1}</td>
                            <td>${item.name}</td>
                            <td>${item.create_date}</td>
                            <td>${valueActive}</td>
                            <td>
                                <div class="d-flex gap-1 ">
                                    <i onclick="onEditMenu(${item.id})" class="cursor-pointer text-primary bi bi-pencil"> </i>
                                    |
                                    <i onclick="onDeleteMenu(${item.id})" class=" cursor-pointer bi bi-trash text-danger"> </i>
                                </div>
                            </td>
                     </tr>`)
                });
            } else {
                $('#tblDepartment tbody').append(`
                    <tr class="text-center">
                            <td colspan="6" class="text-center text-danger fw-bolder">  No Data </td> 
                     </tr>`);
            }


        }
    });
}