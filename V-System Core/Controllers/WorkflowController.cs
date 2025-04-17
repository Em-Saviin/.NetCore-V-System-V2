using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using V_System_Core.Component;
using V_System_Core.Data;
 

namespace V_System_Core.Controllers
{
    [Authorize]
    public class WorkflowController : Controller
    {
        private readonly UserManagerInfo _ManagerUserID;
        private readonly V_System_Core.Data.AppDbContext db;
        public WorkflowController(AppDbContext _dbContext, UserManagerInfo userMangerInfo)
        {
            this.db = _dbContext;
            this._ManagerUserID = userMangerInfo;
            if (_ManagerUserID._UserId == 0)
            {
                RedirectToAction("Login", "Dashboard");
            };
        }
        public IActionResult Index()
        {
            return View();
        }
        public JsonResult GetModule()
        {
                try
                {
                    var module = MyHelperSql.GetSelect2Item(db, "MODULE", 0); 
                return Json(new { dataModule = module });
                }
                catch (Exception ex)
                {
                    return Json(ex);
                }
        }
        public JsonResult GetAllStatus()
        {
            try
            {
                var allStatus = MyHelperSql.GetSelect2Item(db, "ALL STATUS", 0);
                return Json(new { dataAllStatus = allStatus });
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }
        public JsonResult SaveWorkflowName(int _ModuleId, string _WorkflowName, string _Remark = "")
        {
            try
            {
                string sql = "INSERT INTO tbl_Workflow_Entity (workflow_name, remark, module_id,   create_by, create_date) " +
                              "VALUES (@workflow_name, @remark, @module_id,  @create_by, @create_date)";

                var parameters = new[]
                {
                    new SqlParameter("@workflow_name", _WorkflowName),
                    new SqlParameter("@remark", _Remark),
                    new SqlParameter("@module_id", _ModuleId),
                    new SqlParameter("@create_by", _ManagerUserID._UserId),
                    new SqlParameter("@create_date", DateTime.Now)
                };

                var result = MyHelperSql.ExecuteInsert(db, sql, parameters);

                if (result.code == 0)
                {
                    return Json(new { code = 0, message = _WorkflowName + " Saved Successfully!" });
                }
                else
                {
                    return Json(new { code = 12, message = result.message });
                }
            }
            catch (Exception ex)
            {
                return Json(new { message = ex.Message });
            }
        }
        public JsonResult GetWorkflowList()
        {
            try
            {
                var workflowList = MyHelperSql.ExecSpReturnObj_NoParam(db, "SP_GET_WORKFLOW_LIST");
                return Json(new { data = workflowList });
            } catch (Exception ex)
            {
                return Json(ex.Message);
            }
        }
        public JsonResult DeleteWorkflow(int ID)
        {
            try
            {
                string sql = "DELETE FROM tbl_Workflow_Entity WHERE ID = @workflowID";
                var parameters = new[]
                {
                    new SqlParameter("@workflowID", ID),
                };

                var result = MyHelperSql.ExecuteDelete(db, sql, parameters);

                if (result.code == 0)
                {
                    return Json(new { code = 0, message = "Delete Successfully!" });
                }
                else
                {
                    return Json(new { code = 12, message = result.message });
                }
            }
            catch (Exception e)
            {
                return Json(new { code = 500, message = e.Message });
            }
        }


    } 
}
