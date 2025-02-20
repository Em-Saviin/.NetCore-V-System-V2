var MyController = "/BoostrapIcons";
var _tblIcon = '';

function InitializeTblIcons() {
    $("#tblIcon").DataTable({ 
        "pageLength": 100,
        "ajax": {
            url: `${MyController}/GetAllIcon`,
            type: 'GET',
            dataType: 'json',
        },
        "columns": [
            { "data": null, "render": function (data, type, row, meta) { return meta.row + 1; } },
            { "data": "class_name" },
            { "data": "class_name", "render": function (data) { return `<i class="${data}"></i>`; } },
            { "data": "label_icon" }
        ]
    });
}
