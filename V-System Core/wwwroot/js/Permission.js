

function InitializeTablePermission() {
    $('#tblPermissionModule').DataTable({
        "processing": true,
        "serverSide": true,
        "ajax": {
            "url": "/Permission/GetMenu",  
            "type": "GET",
            "data": {menuId : 0 , roleId : 0},
            "dataSrc": function (json) {
                console.log(json)
                return json.data; 
            }
        },
        "columns": [
            {
                "data": null, 
                "render": function (data, type, row, meta) { 
                    return '<td colspan="9" class="masterMenu">' + data.text  + '</td>';
                }
            }, 
        ], 
    });
    $('#tblPermissionModule tr.sorting_1').attr('colspan', 9);
}

function LoadDataSelect2()  {
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