var MyControllerPermmission = "/Permission";
var tblAssignRoleUser;    //tblRoleUser
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
           if (!Array.isArray(_dataMenu) || _dataMenu.length === 0) {
               $("#tblPermissionRoleOnModule tbody").append(`
                        <tr class="border" >  
                            <td colspan="9" style="background-color:#f2f3f2" class=" text-center fw-bold text-danger"> No Data  </td>
                        </tr> 
                        
                `)
               return;
           }
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
                        if (_dataModule === undefined) {
                            return;
                        }
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
            $('#slsUserNames').select2({
                data: optionsUser,
                placeholder: '---Select User---',
                width: '100%',
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
            $('#slsRoleName').select2({
                data: optionsRole,
            }); 
            $('#mdSlsRole').select2({
                data: optionsRole,
                multiple: true,
                dropdownParent: $("#modalUserInfo"),
                width: '100%',
                allowClear: true
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
            { data:null,
              render: function (data) {
                  return `   ${data.role_name}  `
                }
            },
            { data: 'description' },  
            {
                data: null,  
                render: function (data) {
                    return `
                            <a class="m-auto btn-sm btn-outline-danger bi-dash-circle" title="Delete"  onclick="OnDeleteRole(${data.id})"></a> 
                            <a class="m-auto btn-sm btn-outline-primary bi-arrow-right-square" title="Assign" onclick="OnMappingRole(${data.id} , '${data.role_name}' ,'${data.description}' )"> </a>
                           `
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
function OnDeleteRole(thisRoleId) {
    Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d33",
        cancelButtonColor: "#3085d6",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        console.log(result)
        if (result.value == true) {
            $.ajax({
                url: "/Permission/DeleteRole",
                type: "POST",
                data: { roleId: thisRoleId },
                success: function (rs) {
                    if (rs.code === 0) {
                        Swal.fire({
                            title: "Role Deleted!",
                            text: rs.message,
                            icon: "success"
                        });
                        _tblRole.ajax.reload(); // Reload DataTable
                    } else {
                        Swal.fire({
                            title: "Error!",
                            text: rs.message,
                            icon: "error"
                        });
                    }
                },
                error: function () {
                    Swal.fire({
                        title: "Error!",
                        text: "Failed to delete the role.",
                        icon: "error"
                    });
                }
            });
        }
    });
}


var _RoleId = "";
var _RoleName = ""; 
var _RoleDescription = "";
function OnMappingRole(_roleId, _roleName, _roleDescription) {
    _RoleId = _roleId;
    _RoleName = _roleName;
    _RoleDescription = _roleDescription;
    $("#txtRoleName").val(_roleName);
    $("#txtRoleDescription").val(_RoleDescription);
    $("#txtRoleName2").val(_roleName);
    $("#tblAssignRoleUser tbody").empty();
    GetSelect2UserNotInRole(_RoleId);
    tblAssignRoleUser = $("#tblAssignRoleUser").DataTable({
        ajax: {
            url: MyControllerPermmission + "/GetUserOfRole",
            type: "GET",
            data: function (d) {
                d.roleId = _roleId; 
            }
        },
        responsive: true,
        searching: true,
        paging: true,
        ordering: true,
        destroy: true,
        columns: [
            { data: null, render: (data, type, row, meta) => meta.row + 1 },  
            { data: "fullname" },
            { data: "user_name" },
            { data: "sex" },
            { data: "role_name" },
            {
                data: "user_id",
                render: function (data) {
                    return `<a class="text-danger" style="cursor:pointer;" onclick="onRemoveRoleUser(${data})"> Remove </a>`;
                }
            }
        ],
        columnDefs: [{ orderable: false, targets: [5] }]  
    });  
}
 
function onOpenModalAssignRole(){
    $("#modalAssignRoleToUser").modal('show');
}

function onOpenModalNewRole() {
    $("#modalNewRole").modal('show')
}
function onRemoveRoleUser(userId) { 
    $.ajax({
        url: "/Permission/RemoveRoleFromUser",
        type: "POST",
        data: { roleId: _RoleId, userId: userId },
        success: function (rs) {
            if (rs.code == 0) {
                Swal.fire({
                    title: 'Success Deleted',
                    type: 'success',
                    html: rs.message
                }); 
            } else {
                Swal.fire({
                    title: 'Issue with delete',
                    type: 'warning',
                    html: rs.message
                });  
            }
            tblAssignRoleUser.ajax.reload();
        },
        error: function (err) {
            Swal.fire({
                title: 'Error',
                type: 'error',
                icon: 'info',
                html: err.message
            });
        }
    })
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
    var _userId = $("#slsRoleUser").val();   
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
            _remark = "";
            _RoleId = 0;
            $("#slsRoleUser").empty().trigger('change') 
            tblAssignRoleUser.ajax.reload();
            $("#modalAssignRoleToUser").modal('hide');
        } else {
            Swal.fire({
                title: 'Error',
                type: 'error',
                html: rs.message
            });
        }
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
            if (!Array.isArray(_dataMenu) || _dataMenu.length === 0)   {
                $("#tblPermissionUserRoleOnModule tbody").append(`
                        <tr class="border" >  
                            <td colspan="9" style="background-color:#f2f3f2" class=" text-start fw-bold text-danger"> No Data </td>
                        </tr> 
                        
                `)
                return;
            }
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



function OnSaverPermissionUserRoles() {
    const userValue = $("#slsUsers").val();
    if (userValue == 0) {
        return;
    }
    let permissionsUserRole = [];
    $("#tblPermissionUserRoleOnModule tbody tr").each(function () {
        let permissionUserRoleModuleId = $(this).attr("data-permission-userrole-module-id");
        let role = $(this).attr("data-permission-roleid");
        let allDisabled = $(this).find("input[type='checkbox']").length === $(this).find("input[type='checkbox']:disabled").length;
        if (!allDisabled && permissionUserRoleModuleId) {
            let full = $("#DisabledUserFullflexSwitchCheck_" + permissionUserRoleModuleId).prop("checked") ? 1 : 0;
            let list = $("#UserListflexSwitchCheck_" + permissionUserRoleModuleId).prop("checked") ? 1 : 0;
            let add = $("#DisabledUserAddflexSwitchCheck_" + permissionUserRoleModuleId).prop("checked") ? 1 : 0;
            let edit = $("#UserEditflexSwitchCheck_" + permissionUserRoleModuleId).prop("checked") ? 1 : 0;
            let deletePermission = $("#UserDeleteflexSwitchCheck_" + permissionUserRoleModuleId).prop("checked") ? 1 : 0;
            let print = $("#UserPrintflexSwitchCheck_" + permissionUserRoleModuleId).prop("checked") ? 1 : 0;

            permissionsUserRole.push({
                Module_Id: permissionUserRoleModuleId,
                Role_Id: role,
                Full: full,
                List: list,
                Add: add,
                Edit: edit,
                Delete: deletePermission,
                Print: print,
                User_Id: userValue
            });
        }
    });

    let jsonData = JSON.stringify(permissionsUserRole);
    $.ajax({
        url: "/Permission/SavePermissionsRoleOnUser",
        type: "POST",
        data: {
            JsonData: jsonData
        },
        success: function (response) {
            if (response.code == 0) {
                Swal.fire({
                    title: 'Success',
                    type: 'success',
                    html: response.message
                });
                permissionsUserRole.length = 0;
                InitializeTablePermissionUserRole();
            } else {
                Swal.fire({
                    title: 'Error',
                    type: 'error',
                    html: response.message
                });
            }

        },
        error: function (err) {
            Swal.fire({
                title: 'Error',
                type: 'error',
                html: err
            });
        }
    });
}

//Block System User
function InitializeTableSystemUser() {
    const ab = $("#slsRoleName").val();
    const bc = $("#slsUserNames").val(); 
    $.ajax({
        url: "/Permission/GetMenu",
        type: "GET",
        data: { menuId: $("#slsRoleMenus").val() },
        success: function (rs) {
            $("#tblPermissionRoleOnModule tbody").empty();
            const _dataMenu = rs.data;
            if (!Array.isArray(_dataMenu) || _dataMenu.length === 0) {
                $("#tblPermissionRoleOnModule tbody").append(`
                        <tr class="border" >  
                            <td colspan="9" style="background-color:#f2f3f2" class=" text-center fw-bold text-danger"> No Data  </td>
                        </tr> 
                        
                `)
                return;
            }
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
                    data: { menuId: _menuId, roleId: $("#slsRoles").val() },
                    success: function (rs) {
                        const _dataModule = rs.data;
                        if (_dataModule === undefined) {
                            return;
                        }
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

var tblSystemUsers = null;
function OnIntitialzeTblSystemUsers() { 
    var __UserId = $("#slsUserNames").val();
    $("#tblSystemUsers tbody").empty();
    tblSystemUsers = $("#tblSystemUsers").DataTable({
        ajax: {
            url: MyControllerPermmission + "/GetDataTblSystemUser",
            type: "GET",
            data: function (d) { 
                d._UserId = __UserId
            } 
        },
        responsive: true,
        searching: true,
        paging: true,
        ordering: true,
        destroy: true,
        columns: [
            { data: null, render: (data, type, row, meta) => meta.row + 1 },
            { data: "username" },
            {
                data: null,
                render: function (data) {
                    return `${data.firstname}  ${data.lastname}`;
                }
            },
            { data: "sex" }, 
            { data: "address" },
            { data: "phone" },
            {
                data: "ID",
                render: function (data) {
                    return `<a class="text-success" style="cursor:pointer;" onclick="onOpenModalEditRoleByUser(${data})"> Edit </a>`;
                }
            }
        ] 
    });
}
var _user_id_ = 0;
function onOpenModalEditRoleByUser(_userId) {  
    $("#modalUserInfo").modal('show');
    $("#mdTxtUserId").val(_userId);
    $.ajax({
        url: MyControllerPermmission + "/GetInfoUserWithRole",
        type: 'GET',
        data: { _UserId: _userId },
        success: function (rs) {
            if (rs.code > 0) return; 
            const rsRoleOption = rs.roleUserData || [];
            const rsUserData = rs.userData || {}; 
            // Set user info
            $("#mdTxtUsername").val(rsUserData.username || '');
            $("#mdTxtSex").val(rsUserData.sex || ''); 
            //Bind id of val select2
            const selectedRoleIds = rsRoleOption.map(r => r.id);   
            $('#mdSlsRole').val(selectedRoleIds).trigger('change');
        }

    })
}
function onCloseModalRoleByuser() {
    $("#modalUserInfo").modal('hide');
}

function SaveUserInfo() {

    var thisUser = $("#mdTxtUserId").val();  
    const selectedRoles = $('#mdSlsRole').val();   
    var jsonData = JSON.stringify(selectedRoles);  
    $.ajax({
        url: MyControllerPermmission + "/SaveInfoUser", 
        method: 'POST', 
        data: { _UserId: thisUser, _RoleId: jsonData } ,
        success: function (rs) {
            if (rs.code == 0) {
                _user_id_ = 0; 
                AlertMessage.success(rs.message);
                $("#modalUserInfo").modal('hide');
            } else {
                AlertMessage.error(rs.message);
            }
        }
    });

}