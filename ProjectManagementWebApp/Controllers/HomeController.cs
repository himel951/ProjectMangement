using ProjectManagementWebApp.Manager;
using ProjectManagementWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectManagementWebApp.Controllers
{
    public class HomeController : Controller
    {
        private UserInfoManager _userInfoManger;

        public HomeController()
        {
            _userInfoManger = new UserInfoManager();
        }



        [HttpGet]
        public ActionResult Index()
        {
            Session["UserSession"] = null;

            return View();
        }

        [HttpPost]
        public ActionResult Index(UserInfo userInfo)
        {
            if (userInfo.Email == null || userInfo.Password == null)
            {
                ViewBag.Message = "Please Input Username And Password Correctly";
            }
            else
            {

                if (_userInfoManger.IsUserNameAndPasswordValid(userInfo.Email, userInfo.Password))
                {
                    Session["UserSession"] = _userInfoManger.GetUserMenu(userInfo.Email, userInfo.Password);
                    return RedirectToAction("WelcomIndex");
                }
                else
                {
                    ViewBag.Message = "Username or Password Isn't Correct";
                }


            }
            return View();
        }

        public ActionResult WelcomIndex()
        {
            if (Session["UserSession"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index");
            }

        }


    }
}