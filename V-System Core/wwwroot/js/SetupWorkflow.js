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
            $("#DtslsModule").empty().select2({
                data: optionModule,
                dropdownParent: $("#ModalWorkflowDetail"),
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
                            <i onclick="onViewWorkflowDetail(${data.ID},${data.module_id})" class="cursor-pointer text-info bi bi-pencil view-workflow-icon"></i> ||  <i onclick="onDeleteWorkflow(${data.ID})" class="cursor-pointer text-danger bi-dash-circle-fill"></i>
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

function onDeleteWorkflow(workflowId) {
    var _workflowID = workflowId
    Swal.fire({
        title: "Confirm Deletion",
        html: "Are you sure you want to delete this workflow?",
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'Cancel'
    }).then((result) => {
        if (result.value === true) {
            $.ajax({
                url: '/Workflow/DeleteWorkflow',
                type: "POST",
                data: { ID: _workflowID },
                success: function (rs) {
                    if (rs.code == 0) {
                        AlertMessage.success(rs.message);
                        _tblWorkFlow.ajax.reload();
                    } else {
                        AlertMessage.error(rs.message);
                    }
                },
                error: function (xhr, status, error) {
                    AlertMessage.error("An error occurred: " + error);
                }
            });
        } else {
            console.log('User canceled the deletion.');
        }
    });

}

//Block Detail
function onViewWorkflowDetail(workflowId, moduleId) {
    LoadAllStatusSelect2();
    LoadSelect2();
    $("#ModalWorkflowDetail").modal('show');
}
function OpenModalWorkflowDetail() { 
    $("#ModalWorkflowDetail").modal('show');
}
function CloseModalWorkflowDetail() {
    $("#ModalWorkflowDetail").modal('hide');
}
function SaveWorkflowNameDetail() {

} 
function LoadAllStatusSelect2() {
    $.ajax({
        url: _Url + '/GetAllStatus',
        type: 'GET',
        success: function (rs) {
            console.log(rs)
            const resultModule = rs.dataAllStatus;
            var optionModule = resultModule.map(function (item) {
                return { id: item.id, text: item.text };
            })
            $("#DtslsFirstStatus").empty().select2({
                data: optionModule,
                dropdownParent: $("#ModalWorkflowDetail #blockLeft"),
                width: '100%'
            })
        }
    })
}
