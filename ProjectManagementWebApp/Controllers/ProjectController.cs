using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectManagementWebApp.CustomAttribute;
using ProjectManagementWebApp.Models;

namespace ProjectManagementWebApp.Controllers
{
    [NoCache]
    public class ProjectController : Controller
    {
        // GET: Project
        [HttpGet]
        public ActionResult Index()
        {                  
            return View();
        }

        [HttpPost]
        public ActionResult Index(ProjectViewModel projectViewModel)
        {
            
            return View();
        }
    }
}