 
//--------------global viriable---------------------
var MyController = "/Module"
var _moduleId = 0;
var _objModule = {}; 
var _menuId = 0; 
var _tblModule = '';
//-------------------Initialize script----------------------
$('.select2').select2();
$('#slsMenuParent').select2({
    placeholder: "--Select Menu--",
    width: '100%'
});
$('#slsMenu').select2({
    placeholder: "--Select Menu--",
    width: '75%'
}); 

// Add custom styles for buttons
$('.ui-dialog-buttonset button:contains("Delete")').css({
    'background-color': 'red',
    'color': 'white',
    'border': '1px solid darkred'
});
 
function InitializeTblModule(menuId) {
    _tblModule = $('#tblModule').DataTable({ 
        processing: true,
        "ajax": {
            url: MyController+'/GetModuleList',
            dataSrc: 'data',
            data: { menuId: menuId }, 
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
            { data: 'menu_name' },
            { data: 'module_name' },
            { data: 'module_name_kh' },
            { data: 'controller' },
            { data: 'views' },
            {
                data: null,
                render: function (data) {
                    return `<div > <i class="${data.icon}"> </i> </div>`
                }
            },
            { data: 'level' },
            { data: 'partial_name' },
            {
                data: null,
                render: function (data) {
                    return `<div class="text-muted">${data.url ? data.url : ''}</div>`;
                }
            },
            {
                data: null,
                render: function (data) {
                    return `
                    <div class="d-flex gap-1">
                            <i onclick="onEditModule(${data.id})" class="cursor-pointer text-success bi bi-pencil"> </i>
                            |
                            <i onclick="onDeleteModule(${data.id})" class=" cursor-pointer bi bi-trash text-danger"> </i>
                        </div>`
                }
            }
        ],
        paging: true,
        scrollCollapse: true, 
        "language": {
            "emptyTable": "No data available"
        }
    });
}
 


//-------Function workplace---------------
function LoadSelect2() { 
    $.ajax({
        url: MyController + '/GetModuleListSelect',
        type: 'GET',
        success: function (response) {
            var menuResult = response.data;
            if (response.code == 0) {
                var optionsMenu = menuResult.map(function (item) {
                    return {
                        id: item.id,
                        text: item.text
                    };
                });
                $('#slsMenu').select2({
                    data: optionsMenu
                });
                $('#slsMenuParent').select2({
                    dropdownParent: $('#ModalModule'),
                    data: optionsMenu
                });
                 InitializeTblModule(0);
            }
        },
        error: function (response) {

        }
    }) 
}
function onLookUpModule() { 
    _menuId = parseInt($('#slsMenu').val());  
    if ($.fn.dataTable.isDataTable('#tblModule')) {
        _tblModule.destroy();
    }
    InitializeTblModule(_menuId) 
}    
function onEditModule(menuId) {  
    $('.modal-title').html('<i class="bi bi-pencil"></i> Edit')
    _moduleId = 0
    _objModule = {};
    $.ajax({
        url:   MyController + '/GetModuleListDetail',
        type: 'POST',
        data: { menuId: menuId },
        success: function (response) {
            var _data = response.data;
            console.log(_data)
            if (response.code == 0) {
                $('#ModalModule').modal('show');
                _data.map(function (item, index) {
                    _moduleId = item.id;
                    $('#moduleName').val(item.module_name);
                    $('#moduleNameKh').val(item.module_name_kh);
                    $('#slsMenuParent').val(item.menu_id).trigger('change');
                    $('#iconClass').val(item.icon);
                    $('#moduleLevel').val(item.level);
                    $('#moduleUrl').val(item.url);
                    $('#partialName').val(item.partial_name);
                    $("#moduleController").val(item.controller);
                    $("#moduleViews").val(item.views);
                }) 
            } else {
                console.log("Error");
            }
        },
        error: function (response) {

        }
    })
}

function SaveModule() {
    _objModule.ID = _moduleId;
    _objModule.module_name = $("#moduleName").val();
    _objModule.module_name_kh = $("#moduleNameKh").val();
    _objModule.icon = $("#iconClass").val();
    _objModule.level = $("#moduleLevel").val();
    _objModule.partial_name = $("#partialName").val();
    _objModule.url = $("#moduleUrl").val();
    _objModule.menu_id = $("#slsMenuParent").val();
    _objModule.controller = $("#moduleController").val();
    _objModule.views = $("#moduleViews").val();
    $.ajax({
        url: MyController + '/AddModule',
        type: 'POST',
        dataType: 'json',
        data: { objs: _objModule },
        success: function (response) {
            if (response.code == 0) {
                toastr.success(response.message);
                $('#ModalModule').modal('hide');
                _tblModule.ajax.reload();
            } else {
                toastr.error(response.message)
            }
        },
        error: function (response) {

        }
    })
}
function onDeleteModule(menuId) { 
    $.msgbox({
        'message': 'Are you sure that you want to permanently delete this module?',
        'type': 'confirm',
        'buttons': [
            { 'type': 'yes', 'value': 'Yes' },
            { 'type': 'no', 'value': 'No' }
        ], 
        'callback': function (result) {
            if (result === true) {
                $.ajax({
                    url: MyController + '/DeleteModule',
                    type: 'POST',
                    dataType: 'json',
                    data: { menuId: menuId },
                    success: function (response) {
                        if (response.code == 0) {
                            $.toast({
                                title: "Success Message",
                                message: response.message,
                                type: "success",
                                duration: 5000,
                            });
                            _tblModule.ajax.reload();
                        } else {
                            toastr.error(response.message)
                        }
                    },
                    error: function (response) {
                        toastr.error(response.message)
                    }
                }); 
            }  
        }
    });  
}
function OpenModalModule() {
    $('#frmModule input').val('');
    $('#slsMenuParent').val(0).trigger('change');
    _moduleId = 0;
    _objModule = {}
    $('.modal-title').html('+ Add New')
    
    $('#ModalModule').modal('show');
}
function CloseModalModule(){
    $('#ModalModule').modal('hide');
    $('#frmModule input').val('');
}