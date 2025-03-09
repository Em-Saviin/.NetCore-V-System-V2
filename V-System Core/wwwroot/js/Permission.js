var MyControllerPermmission = "/Permission";
//Block Permission on Role
function InitializeTablePermissionRole() {
    const ab = $("#slsRoles").val();
    const bc = $("#slsRoleMenus").val();
    if (ab === '0' && bc === '0') {
        $("#tblPermissionRoleOnModule tbody").empty();
        return;
    } 
   $.ajax({
       url: "/Permission/GetMenu",
       type: "GET",
       data: { menuId: $("#slsRoleMenus").val() },
       success: function (rs) { 
           $("#tblPermissionRoleOnModule tbody").empty();
            const _dataMenu = rs.data;
            _dataMenu.map(function (item, index) {
                $("#tblPermissionRoleOnModule tbody").append(`
                        <tr class="border" >  
                            <td colspan="9" style="background-color:#f2f3f2" class=" text-start fw-bold"> <p style="margin-left:36px;width:auto"> <i class="bi-arrow-down-right-square-fill"></i>  &nbsp;  ${item.menu_name} </p> </td>
                        </tr> 
                        <tr id="menuOnRole_${item.id}">

                        </tr>
                `)
                var _menuId = item.id  
                $.ajax({
                    url: "/Permission/GetListPermissionOnRole",
                    type: "Get",
                    data: { menuId: _menuId, roleId : $("#slsRoles").val()},
                    success: function (rs) { 
                        const _dataModule = rs.data; 
                        _dataModule.map(function (item1, index1) {   
                            $(`#menuOnRole_${item.id}`).after(` 
                                <tr class="border" data-permission-role-module-id="${item1.module_id}">
                                    <td class="text-end"> <i class="bi-arrow-right-circle"></i> </td>
                                    <td class="text-start"> ${item1.module_name} </td>
                                    <td> ${item1.remark} </td>
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                              ${item1.full}
                                         </div>
                                    </td>
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                              ${item1.list}
                                         </div>
                                    </td>
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                             ${item1.add}
                                         </div>
                                    </td>
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                             ${item1.edit}
                                         </div>
                                    </td>
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                             ${item1.delete}
                                         </div>
                                    </td>
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                            ${item1.print}
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
function onCheckPermissionRole(checkbox, moduleId, moduleName, permissionType) {
    const perFull = $("#RoleFullflexSwitchCheck_" + moduleId);
    const perEdit = $("#RoleEditflexSwitchCheck_" + moduleId);
    const perList = $("#RoleListflexSwitchCheck_" + moduleId);
    const perAdd = $("#RoleAddflexSwitchCheck_" + moduleId);
    const perDelete = $("#RoleDeleteflexSwitchCheck_" + moduleId);
    const perPrint = $("#RolePrintflexSwitchCheck_" + moduleId);
    const isCheckedAll = checkbox.checked;
    if (permissionType == 'full') {
        if (isCheckedAll) {
            if (!perEdit.prop("checked")) perEdit.prop("checked", true);
            if (!perList.prop("checked")) perList.prop("checked", true);
            if (!perAdd.prop("checked")) perAdd.prop("checked", true);
            if (!perDelete.prop("checked")) perDelete.prop("checked", true);
            if (!perPrint.prop("checked")) perPrint.prop("checked", true);
        } else {
            perAdd.prop("checked", false);
        }
    } else {
        if (perEdit.prop("checked") && perList.prop("checked") && perAdd.prop("checked") && perDelete.prop("checked") && perPrint.prop("checked")) {
            perFull.prop("checked", true);
        } else {
            perFull.prop("checked", false);
        }
    }
}
function onCheckPermissionUser(checkbox, moduleId, moduleName, permissionType) { 
    const perEdit = $("#UserEditflexSwitchCheck_" + moduleId);
    const perFull = $("#UserFullflexSwitchCheck_" + moduleId);
    const perList = $("#UserListflexSwitchCheck_" + moduleId);
    const perAdd = $("#UserAddflexSwitchCheck_" + moduleId);
    const perDelete = $("#UserDeleteflexSwitchCheck_" + moduleId);
    const perPrint = $("#UserPrintflexSwitchCheck_" + moduleId);
    const isCheckedAll = checkbox.checked; 
    if (permissionType == 'full') {
        if (isCheckedAll) {
            if (!perEdit.prop("checked")) perEdit.prop("checked", true);
            if (!perList.prop("checked")) perList.prop("checked", true);
            if (!perAdd.prop("checked")) perAdd.prop("checked", true);
            if (!perDelete.prop("checked")) perDelete.prop("checked", true);
            if (!perPrint.prop("checked")) perPrint.prop("checked", true);
        } else {
            perAdd.prop("checked", false);
        }
    } else {
        if (perEdit.prop("checked") && perList.prop("checked") && perAdd.prop("checked") && perDelete.prop("checked") && perPrint.prop("checked")) {
            perFull.prop("checked", true);
        } else {
            perFull.prop("checked", false);
        }
    }  
}
function LoadDataRoleSelect2() {
    $('#slsRoleMenus').select2('destroy');
    $('#slsRoles').select2('destroy'); 
    $.ajax({
        url: '/Permission/GetDataSelect2',
        type: 'Get',
        success: function (rs) {   
            const menuResult = rs.menuData;
            const roleResult = rs.roleData;
            const userResult = rs.userData;
            var optionsMenus = menuResult.map(function (item) {
                return { id: item.id,  text: item.text  };
            });  
            var optionsRole = roleResult.map(function (item) {
                return { id: item.id, text: item.text };
            })
            var optionsUser = userResult.map(function (item) {
                return { id: item.id, text: item.text };
            });
            $('#slsRoles').select2({ 
                data: optionsRole, 
            });
            $('#slsRoleMenus').select2({
                data: optionsMenus,
                placeholder: "--- Select Menu ---"
            }); 
            $('#slsRoleMenusOnUser').select2({
                data: optionsMenus,
            }); 
            $('#slsUsers').select2({
                data: optionsUser,
                placeholder: "--- Select User ---"
            });  
        },
        error: function (err) {
            console.log(err)
        }
    })
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

var _RoleId = "";
var _RoleName = "";
function OnMappingRole(_roleId, _roleName, _roleDescription) {
    _RoleId = _roleId;
    _RoleName = _roleName;
    $("#txtRoleName").val(_roleName);
    $("#txtRoleDescription").val(_roleDescription);
    $("#txtRoleName2").val(_roleName);
    $("#tblAssignRoleUser tbody").empty();
    GetSelect2UserNotInRole(_RoleId);
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
            } else {
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
                });
            }
          
        }
    })
    
}
function onOpenModalNewRole() {
    $("#modalNewRole").modal('show')
}
function onOpenModalAssignRole(){
    $("#modalAssignRoleToUser").modal('show');
}

function GetSelect2UserNotInRole(dataRoleId) {
    $.ajax({
        url: "/Permission/GetSelect2UserNotInRole",
        type: "GET",
        data: { roleId : dataRoleId },
        success: function (rs) { 
            const userResult = rs.userNotInRoleData;
            var optionUserNotInRole = userResult.map(function (item,index) {
                return { id: item.id, text: item.text };
            });
            $('#slsRoleUser').select2({
                data: optionUserNotInRole,
                dropdownParent: $('#modalAssignRoleToUser'),
                width: '100%',
                multiple: true,
                placeholder: "--- Select User ---",
            });
        }
    })
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
function OnSaveAssignRole() {  
    const valueSelect2 = $("#slsRoleUser").val(); 
    var testobj = []; 

    testobj.push({
        userId: valueSelect2
    });   
}
function OnSaveAssignRole() {   
    var _userId = $("#slsRoleUser").val();  
    console.log("User ID:", _userId);  
    if (!_userId || _userId.length === 0) {  
        $.toast({
            title: "Warning",
            message: "សូមជ្រើសរើសឈ្មោះអ្នកប្រើប្រាស់!",
            type: "warning",
            duration: 3000,
        });
        return;
    }

    var dataJson = [];
    dataJson.push({
        userDataId: parseInt($("#slsRoleUser").val())
    });
    var _remark = $("#newRoleDescription2").val(); 
    var dataObj = {
        roleId: _RoleId,
        remark: _remark,
        jsonData: JSON.stringify(dataJson)
    }
    $.post('/Permission/AssignRoleToUser', dataObj, function (rs) {
        if (rs.code == 0) {
            Swal.fire({
                title: 'Success',
                type: 'success',
                html: rs.message
            });
            _remark.val(""); 
            _RoleId = 0;
            $("#slsRoleUser").empty().trigger('change') 
        } else {
            Swal.fire({
                title: 'Error',
                type: 'error',
                html: rs.message
            });
        }
    });
} 
function OnSavePermissionOnRole() {
    $.toast({
        title: "Warning",
        message: "Not yet write script in sql.",
        type: "warning",
        duration: 5000,
    });

}

//Block permission on user role 
 
function InitializeTablePermissionUserRole() {
    const bc = $("#slsRoleMenusOnUser").val();   
    const de = $("#slsUsers").val();  
    if (bc === '0' && de === '0') {
        $("#tblPermissionUserRoleOnModule tbody").empty();
        return;
    }  
    $.ajax({
        url: "/Permission/GetMenu",
        type: "GET",
        data: { menuId: $("#slsRoleMenusOnUser").val() },
        success: function (rs) {
            $("#tblPermissionUserRoleOnModule tbody").empty();
            const _dataMenu = rs.data;
            _dataMenu.map(function (item, index) {
                $("#tblPermissionUserRoleOnModule tbody").append(`
                        <tr class="border" >  
                            <td colspan="9" style="background-color:#f2f3f2" class=" text-start fw-bold"> <p style="margin-left:36px;width:auto"> <i class="bi-arrow-down-right-square-fill"></i>  &nbsp;  ${item.menu_name} </p> </td>
                        </tr> 
                        <tr id="menuOnuserRole_${item.id}">

                        </tr>
                `)
                var _menuId = item.id
                $.ajax({
                    url: "/Permission/GetListPermissionOnUserRole",
                    type: "Get",
                    data: { menuId: _menuId,  userId : $("#slsUsers").val()},
                    success: function (rs) {
                        const _dataModule = rs.data;
                        
                        _dataModule.map(function (item1, index1) { 
                            console.log(item1)
                            $(`#menuOnuserRole_${item.id}`).after(`
                                <tr class="border" data-permission-UserRole-module-id="${item1.ID}" data-permission-RoleId="${item1.role_id}">
                                    <td class="text-end"> <i class="bi-arrow-right-circle"></i> </td>
                                    <td class="text-start"> ${item1.module_name} </td>
                                    <td> ${item1.remark} </td>
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                           ${item1.full}
                                        </div>
                                    </td>
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                            ${item1.list}
                                        </div>
                                    </td>
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                         ${item1.add}
                                        </div>
                                    </td>
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                          ${item1.edit}
                                        </div>
                                    </td>  
                                    <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                               ${item1.delete}
                                         </div>
                                    </td>
                                        <td style="width:150px;" class="m-0 p-0">
                                        <div class="form-switch">
                                          ${item1.print}
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