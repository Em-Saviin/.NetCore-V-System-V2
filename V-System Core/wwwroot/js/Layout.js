 

function InitializeLayout() { 
   
    $('.modal').modal({
        backdrop: 'static',
        keyboard: false
    });
    addNewTab('Overview', 27, 'Overview', 'bi bi-fan' );
    //onClickMenu(27, 'Dashboard', '_Dashboard', 'bi-house-door');
    var firstLink = $(".sidebar-nav li a[data-bs-target='#components-nav-1']").first();
    firstLink.removeClass('collapsed');
    $('.toggle-sidebar-btn').on('click', function () {
        $('body').toggleClass('toggle-sidebar');
    });
    
}
function makeDraggable(dragElement) {
    dragElement.on('mousedown', function (e) {
        const modal = $(this).closest('.modal');
        let offset = modal.offset();
        let mouseX = e.pageX - offset.left;
        let mouseY = e.pageY - offset.top;

        $(document).on('mousemove.draggable', function (e) {
            modal.offset({
                left: e.pageX - mouseX,
                top: e.pageY - mouseY
            });
        });

        $(document).on('mouseup.draggable', function () {
            $(document).off('mousemove.draggable mouseup.draggable');
        });

        return false;
    });
}

 
 
function addNewTab(moduleName, moduleId, partialViewName, moduleIcon ) { 
    var tabId = "tab-" + moduleId; 
    var tabContentId = "content-" + moduleId;
    if ($("#" + tabId).length === 0) { 
        var newTab = `
               <li class="nav-item p-0 custom-tab" id="tab-header-${moduleId}">
                <a class="nav-link custom-nav-link" id="${tabId}" data-bs-toggle="tab" href="#${tabContentId}" role="tab">
                    <i class="${moduleIcon}"></i> ${moduleName}
                    <i class="text-danger bi bi-x ms-2 close-tab" onclick="closeTab('${moduleId}')"></i>
                </a>
            </li>`;
        $("#tabs-container").append(newTab); 
        var newTabContent = `
            <div class="tab-pane fade" id="${tabContentId}" role="tabpanel">
                Loading content for ${moduleName}...
                
            </div>
           
            `;
        $("#tab-content-container").append(newTabContent);
        loadTabIframeContent(partialViewName, tabContentId, moduleId);
    }
    $("#" + tabId).tab("show");
}
var Loading_Page =  ` 
    <div id ="loading-test" class="d-flex justify-content-center align-items-center" style ="height: 100vh ; width: 100%;" >
        <div class="loading d-grid gap-1" data-mdb-parent-selector="#loading-test">
            <div class="spinner-border text-dark fw-bolder loading-icon" style="width: 4rem; height:  4rem;" role="status"></div> 
            <span  >Loading...</span>
        </div>
    </div>
 ` 
function loadTabIframeContent(partialViewName, tabContentId, moduleId) {
    $("#" + tabContentId).html(Loading_Page);
   
    $.ajax({
        url: '/Home/LoadIframeView',  
        data: { moduleId: moduleId }, 
        type: 'POST',
        success: function (response) { 
           
            var _data = response.data;
            var _UrlFrame = '/' + _data.moduleController + '/' + _data.moduleViews;   
            $("#" + tabContentId).empty();
            if (_data.moduleController == null) {
                $("#" + tabContentId).html(`
                <div class="container" > 
                        <section class="section error-404 min-vh-100 d-flex flex-column align-items-center justify-content-center">
                            <h1 class="text-danger">404</h1>
                            <h2 class="text-danger">Page Not Found</h2>
                            <h2 class="text-danger">The page you are looking for doesn't exist.</h2> 
                        </section>
                 </div>
                `);
            } else {
                $("#" + tabContentId).append(`
                    <div class="container-fluid " style="background-color:white">   
                        <div class="row d-flex justify-content-between align-items-center"> 
                               <span class="col-3 d-flex justify-content-start align-items-center">
                                     <ol class="breadcrumb mt-2">
                                        <li class="breadcrumb-item"><a href="#"> <i class=" ${_data.menuIcon}"> </i>  ${_data.menuName} </a> </li>
                                        <li class="breadcrumb-item active text-decoration-underline" aria-current="page"> <i class="${_data.moduleIcon}"> </i>${_data.moduleName}</li>
                                    </ol>   
                               </span>
                                <span class="col-1 d-flex justify-content-end align-items-end">
                                    <i title="Refresh" class="float-end bi bi-arrow-clockwise text-primary"  onclick="ReloadView('${partialViewName}', '${tabContentId}', ${moduleId})">   </i>
                                </span>
                            
                        </div> 
                    </div>
                    <iframe src="${_UrlFrame}" id="iframe-${tabContentId}" style="width:100%;height:100vh";overflow:hidden > </iframe>
                `); 
            } 
        },
        error: function () {
            $("#" + tabContentId).html(`
                <div class="container" > 
                        <section class="section error-404 min-vh-100 d-flex flex-column align-items-center justify-content-center">
                            <h1 class="text-danger">404</h1>
                            <h2 class="text-danger">Page Not Found</h2>
                            <h2 class="text-danger">The page you are looking for doesn't exist.</h2> 
                        </section>
                 </div>
            `);
        }
    });
}

function closeTab(moduleId) {
    $("#tab-header-" + moduleId).remove();
    $("#content-" + moduleId).remove();
    if ($("#tabs-container .nav-item").length > 0) {
        $("#tabs-container .nav-item:first-child a").tab("show");
    }
}

function ReloadView(partialViewName, tabContentId, moduleId) {
    $("#" + tabContentId).empty();
    loadTabIframeContent(partialViewName, tabContentId, moduleId)
}
 



