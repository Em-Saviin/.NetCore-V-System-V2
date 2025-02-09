 
 
//--Global viaralbe----
var MyController = "/Menu"
var _tblMenu = '';
var _menuId = 0; 
function InitializeTableMenu() {
    _tblMenu = $('#tblMenu').DataTable({
        processing: true, 
        "ajax": {
            url: MyController + '/GetMenuList',
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
            { data: 'menu_name' },
            { data: 'menu_name_kh' },
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
 
  
function onEditMenu(menuId) { 
    $('.modal-title').html('<i class="bi bi-pencil"></i> Edit') 
         _menuId = 0
        objMenu = { };
        $.ajax({
        url: MyController + '/GetMenuInfo',
        type: 'POST',
        data: {menuId: menuId },
         success: function (response) { 
          var _data = response.data;  
         if (response.code == 0) {
             _data.map(function (item, index) { 
                 _menuId = item.id; 
                $("#menuName").val(item.menu_name);
                $("#menuNameKh").val(item.menu_name_kh);
                $("#menuIcon").val(item.icon);
                $("#level").val(item.level);
                $("#partialName").val(item.partial_name);
            }) 
        } else {
            console.log("Error");
                    }
                },
        error: function (response) {

        }
            })
        $('#ModalMenu').modal('show');
    }
    var objMenu = { };
    function SaveMenu() {
        objMenu.ID = _menuId;
        objMenu.menu_name = $("#menuName").val();
        objMenu.menu_name_kh = $("#menuNameKh").val();
        objMenu.icon = $("#menuIcon").val();
        objMenu.level = $("#level").val();
        objMenu.partial_name = $("#partialName").val();
        $.ajax({
        url: MyController + '/AddMenu',
        type: 'POST',
        dataType: 'json',
        data: {objs: objMenu },
        success: function (response) {
           if (response.code == 0) {
            toastr.success(response.message);
            $('#ModalMenu').modal('hide');
        _tblMenu.ajax.reload(); 
        } else {
        toastr.error(response.message)
          }
            },
    error: function (response) {

    }
        })
    }
function onDeleteMenu(menuId) { 
    $.msgbox({
        'message': 'Are you sure that you want to permanently delete this menu?',
        'type': 'confirm',
        'buttons': [
            { 'type': 'yes', 'value': 'Yes' },
            { 'type': 'no', 'value': 'No' }
        ],
        'callback': function (result) { 
            if (result === true) { 
                $.ajax({
                    url: MyController + '/DeleteMenu',
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
                            _tblMenu.ajax.reload();
                        } else {
                            toastr.error(response.message)
                        }
                    },
                    error: function (response) {

                    }
                })
            }  
        }
    });
 
};
         
   
function OpenModalMenu() {
    _menuId = 0;
    objMenu = {}
    $('.modal-title').html('+ Add New') 
    $('#ModalMenu').modal('show');
     $('#frmMenu input').val('');
    }
function CloseModalMenu(){
    $('#ModalMenu').modal('hide');
    $('#frmMenu input').val('');
}




