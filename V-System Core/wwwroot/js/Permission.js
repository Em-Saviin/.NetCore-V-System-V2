var MyControllerPermmission = "/Permission";
//Block Permission on Role
function InitializeTablePermission() {
   $.ajax({
       url: "/Permission/GetMenu",
       type: "GET",
       data: { menuId: $("#slsMenus").val() , roleId: 0 },
       success: function (rs) { 
           $("#tblPermissionRoleOnModule tbody").empty();
            const _dataMenu = rs.data;
            _dataMenu.map(function (item, index) {
                $("#tblPermissionRoleOnModule tbody").append(`
                        <tr class="border" >  
                            <td colspan="9" style="background-color:#f2f3f2" class=" text-start fw-bold"> <p style="margin-left:36px;width:auto"> <i class="bi-arrow-down-right-square-fill"></i>  &nbsp;  ${item.menu_name} </p> </td>
                        </tr> 
                        <tr id="menu_${item.id}">

                        </tr>
                `)
                var _menuId = item.id  
                $.ajax({
                    url: "/Permission/GetListPermissionOnRole",
                    type: "Get",
                    data: { menuId: _menuId },
                    success: function (rs) { 
                        const _dataModule = rs.data; 
                        _dataModule.map(function (item1, index1) {
                            var _IsFullCheck = "";
                            var _IsListCheck = "";
                            var _IsAddCheck = "";
                            var _IsEditCheck = "";
                            var _IsDeleteCheck = "";
                            var _IsPrintCheck = "";
                            if (item1.full == true) {
                                _IsFullCheck = "checked"
                            }
                            if (item1.list == true) {
                                _IsListCheck = "checked"
                            }
                            if (item1.add == true) {
                                _IsAddCheck = "checked"
                            }
                            if (item1.edit == true) {
                                _IsEditCheck = "checked"
                            }
                            if (item1.delete == true) {
                                _IsDeleteCheck = "checked"
                            }
                            if (item1.print == true) {
                                _IsPrintCheck = "checked"
                            }

                            $(`#menu_${item.id}`).after(`
                                <tr class="border">
                                    <td class="text-end"> <i class="bi-arrow-right-circle"></i> </td>
                                    <td> ${item1.module_name} </td>
                                    <td> ${item1.remark} </td>
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                            <input class="form-check-input" type="checkbox"   onchange="onCheckPermission(this, '${item1.module_id}', '${item1.module_name}', 'full')"  role="switch" id="FullflexSwitchCheck_${item1.module_id}" ${_IsFullCheck}>
                                        </div>
                                    </td>
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                            <input class="form-check-input" type="checkbox" role="switch"  onchange="onCheckPermission(this, '${item1.module_id}', '${item1.module_name}', 'list')"  id="ListflexSwitchCheck_${item1.module_id}" ${_IsListCheck}>
                                        </div>
                                    </td>
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                            <input class="form-check-input" type="checkbox" role="switch"  onchange="onCheckPermission(this, '${item1.module_id}', '${item1.module_name}', 'add')"  id="AddflexSwitchCheck_${item1.module_id}" ${_IsAddCheck}>
                                        </div>
                                    </td>
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                            <input class="form-check-input" type="checkbox" role="switch"  onchange="onCheckPermission(this, '${item1.module_id}', '${item1.module_name}', 'edit')"  id="EditflexSwitchCheck_${item1.module_id}" ${_IsEditCheck}>
                                        </div>
                                    </td>
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                            <input class="form-check-input" type="checkbox" role="switch"  onchange="onCheckPermission(this, '${item1.module_id}', '${item1.module_name}', 'delete')"  id="DeleteflexSwitchCheck_${item1.module_id}" ${_IsDeleteCheck}>
                                        </div>
                                    </td>
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                            <input class="form-check-input" type="checkbox" role="switch"   onchange="onCheckPermission(this, '${item1.module_id}', '${item1.module_name}', 'print')"  id="PrintflexSwitchCheck_${item1.module_id}" ${_IsPrintCheck}>
                                        </div>
                                    </td>
                                </tr>
                    `); 
                        })
                    }
                })
              
            }) 
       } 
   })
} 
function onCheckPermission(checkbox, moduleId, moduleName, permissionType) {
    const perEdit = $("#EditflexSwitchCheck_" + moduleId);
    const perList = $("#ListflexSwitchCheck_" + moduleId);
    const perAdd = $("#AddflexSwitchCheck_" + moduleId);
    const perDelete = $("#DeleteflexSwitchCheck_" + moduleId);
    const perPrint = $("#PrintflexSwitchCheck_" + moduleId);
    const isCheckedAll = checkbox.checked; 
    if (permissionType == 'full') {
        if (isCheckedAll) {
            if (!perEdit.prop("checked")) perEdit.prop("checked", true);
            if (!perList.prop("checked")) perList.prop("checked", true);
            if (!perAdd.prop("checked")) perAdd.prop("checked", true);
            if (!perDelete.prop("checked")) perDelete.prop("checked", true);
            if (!perPrint.prop("checked")) perPrint.prop("checked", true);
        } else {
            if (perEdit.prop("checked")) perEdit.prop("checked", false);
            if (perList.prop("checked")) perList.prop("checked", false);
            if (perAdd.prop("checked")) perAdd.prop("checked", false);
            if (perDelete.prop("checked")) perDelete.prop("checked", false);
            if (perPrint.prop("checked")) perPrint.prop("checked", false);
        }
    } 
}
function LoadDataRoleSelect2()  {
    $('.select2').select2();
    $('.select2').select2({
        placeholder: "--Select Option--",
        width: '100%'
    });
    $.ajax({
        url: '/Permission/GetDataSelect2',
        type: 'Get',
        success: function (rs) {
            
            const menuResult = rs.menuData;
            const roleResult = rs.roleData;
            var optionsMenu = menuResult.map(function (item) {
                return { id: item.id,  text: item.text  };
            });
            $('#slsMenus').select2({
                data: optionsMenu
            });
            var optionsRole = roleResult.map(function (item) {
                return { id: item.id, text: item.text };
            })
            $('#slsRoles').select2({ 
                data: optionsRole
            });
        },
        error: function (err) {
            console.log(err)
        }
    })
}
function OnSavePermissionOnRole() {
     Swal.fire({
         title: 'Warning',
         type: 'warning',
         html:  "មិនទាន់អាចរក្សារទុកទិន្ន័បានទេ!!"
     });
}


//Block System Role
var _tblRole = null;
function InitializeTableRole() {
  _tblRole =   $('#tblRole').DataTable({
        processing: true,
        "ajax": {
            url: MyControllerPermmission+'/GetRoleData',
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
            { data: 'role_name' },
            { data: 'description' },  
            {
                data: null,  
                render: function (data) {
                    return `<a class="m-auto btn-sm btn-outline-primary bi-arrow-right-square" onclick="OnMappingRole(${data.id} , '${data.role_name}' ,'${data.description}' )"> </a>`
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

  
function OnMappingRole(_roleId,_roleName,_roleDescription) {
    $("#txtRoleName").val(_roleName);
    $("#txtRoleDescription").val(_roleDescription);
    $("#tblAssignRoleUser tbody").empty();
    $.ajax({
        url: MyControllerPermmission + '/GetUserOfRole',
        type: "GET",
        data: { roleId: _roleId },
        success: function (rs) { 
            var _dataUserWithRole = rs.data; 
            if (_dataUserWithRole.length == 0) {
                $("#tblAssignRoleUser tbody").append(`
                          <tr>
                            <td colspan='6' class="text-center text-danger"> No data </td> 
                        </tr> 
                `)
            }
            _dataUserWithRole.map(function (item, index) {
                $("#tblAssignRoleUser tbody").append(`
                         <tr>
                            <td>#</th>
                            <td>${item.fullname}</td>
                            <td>${item.user_name}</td>
                            <td>${item.sex}</td>
                            <td>${item.role_name}</td>
                            <td>
                                <a class="text-danger cursor-pointer" id="${item.id}" > Remove </a>
                            </td>
                        </tr>
                `)
            })
        }
    })
    
}

function onOpenModalNewRole() {
    $("#modalNewRole").modal('show')
}

function OnSaveNewRole() {
    const roleName = $("#newRoleName").val();
    const roleDescription = $("#newRoleDescription").val()
    if (!roleName || !roleDescription) {
        Swal.fire({
            title: 'Warning',
            type: 'warning',
            html: 'Role Name and Description are required.'
        });
        return;
    }
    $.ajax({
        url: "/Permission/AddNewRole",
        type: "POST",
        data: {
            Role_Name: roleName,
            Description: roleDescription
        },
        success: function (rs) {
            if (rs.code == 0) {
                Swal.fire({
                    title: 'Success',
                    type: 'success',
                    html: rs.message
                });
                $("#modalNewRole").modal('hide') 
                $('#frmAddnewRole')[0].reset();
                _tblRole.ajax.reload();
            } 
            if (rs.code == 500) {
                Swal.fire({
                    title: 'Error',
                    type: 'error',
                    html: rs.message
                });
            }
        },
        error: function (err) {
            Swal.fire({
                title: 'Error',
                type: 'error',
                html: ex.message
            });
        }
    })
  
}