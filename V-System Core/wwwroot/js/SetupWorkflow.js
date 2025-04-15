var _Url = '/Workflow'
$(document).ready(function () { 
    InitializeTblWorkflow();
});

function OpenModalWorkflow() {
    LoadSelect2();
    $("#txtWorkflow").val('');
     $("#txtRemark").val('');
    $("#ModalWorkflow").modal('show');
}
function CloseModalWorkflow() {
    $("#ModalWorkflow").modal('hide');
}

 
function LoadSelect2() {
    $.ajax({
        url: _Url + '/GetModule',
        type: 'GET',
        success: function (rs) {
            const resultModule = rs.dataModule;
            var optionModule = resultModule.map(function (item) {
                return { id: item.id, text: item.text };
            })
            $("#slsModule").empty().select2({
                data: optionModule, 
                dropdownParent: $("#ModalWorkflow"),
                width: '100%' 
            })
        }
    })
}
function SaveWorkflowName() {
    const module = $("#slsModule").val();
    const workflowName = $("#txtWorkflow").val();
    const remark = $("#txtRemark").val();
    if (module == 0 || workflowName == "" || workflowName == null) {
        AlertMessage.warning("Some field is required!!");
        return;
    }
    $.ajax({
        url: _Url + '/SaveWorkflowName',
        type: "POST",
        data: { _ModuleId: module, _WorkflowName: workflowName, _Remark: remark }, 
        success: function (rs) {
            if (rs.code == 0) {
                AlertMessage.success(rs.message);
                $("#ModalWorkflow").modal('hide');
                _tblWorkFlow.ajax.reload();
            } else {
                AlertMessage.error(rs.message);
            } 
        },
        error: function (err) {
            AlertMessage.error(err.message)
        }
    }) 
}

var _tblWorkFlow = null;
function InitializeTblWorkflow() {
    _tblWorkFlow = $('#tblWorkflow').DataTable({
        processing: true,
        "ajax": {
            url: _Url + '/GetWorkflowList', 
            dataSrc: "data" ,
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
            { data: 'workflow_name' },
            { data: 'remark' },
            { data: 'module_name' },  
            {
                data: null,
                render: function (data) {
                    return `
                        <div class="d-flex gap-1">
                            <i onclick="onViewWorkflow(${data.ID},${data.module_id})" class="cursor-pointer text-info bi bi-pencil view-workflow-icon"></i>
                        </div>`;
                }
            }
        ], 
        scrollCollapse: true,
        "language": {
            "emptyTable": "No data available"
        }
    });
}