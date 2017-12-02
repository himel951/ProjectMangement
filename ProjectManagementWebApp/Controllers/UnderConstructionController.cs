using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectManagementWebApp.CustomAttribute;

namespace ProjectManagementWebApp.Controllers
{
    [NoCache]
    public class UnderConstructionController : Controller
    {
        // GET: UnderConstruction
        public ActionResult Index()
        {

            if (Session["UserSession"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Logout", "Home", new { message = "You have already logged out. Please login again" });
            }
        }
    }
}