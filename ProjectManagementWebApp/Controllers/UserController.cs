﻿using ProjectManagementWebApp.Models;
using ProjectManagementWebApp.Manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectManagementWebApp.CustomAttribute;

namespace ProjectManagementWebApp.Controllers
{
    [NoCache]
    public class UserController : Controller
    {
        // GET: User
        private UserInfoManager _userInfoManger;
        private DesignationManager _designationManager;
        
        public UserController()
        {
            _userInfoManger = new UserInfoManager();
            _designationManager = new DesignationManager();
        }

        [HttpGet]
        public ActionResult Index()
        {
            if (Session["UserSession"] != null)
            {
                ViewBag.Designations = _designationManager.GetAllDesignationAsListItem();
                ViewBag.IsActive = _designationManager.GetIsActiveListItem();

                return View();
            }
            else
            {
                return RedirectToAction("Logout", "Home");
            }
                      
        }


        [HttpPost]
        public ActionResult Index(UserInfo userInfo)
        {
            ViewBag.Designations = _designationManager.GetAllDesignationAsListItem();
            ViewBag.IsActive = _designationManager.GetIsActiveListItem();

            if (ModelState.IsValid)
            {
                ViewBag.Message = _userInfoManger.Save(userInfo);

                if (ViewBag.Message == "Save Successfull")
                {
                    ModelState.Clear();
                    return View();
                }
            }
            else
            {
                ViewBag.Message = "Model State Is Not Valid";
            }
            return View();            
        }

        public ActionResult EditView()
        {
            if (Session["UserSession"] != null)
            {
                List<UserInfoDesignationViewModel> userList = _userInfoManger.GetAllUser();
                return View(userList);              
            }
            else
            {
                return RedirectToAction("Logout", "Home", new { message = "You have already logged out. Please login again" });
            }
           
        }


        [HttpGet]
        public ActionResult Update(int id)
        {

            if (Session["UserSession"] != null)
            {
                ViewBag.Designation = _designationManager.GetAllDesignationAsListItem();
                ViewBag.IsActives = _designationManager.GetIsActiveListItem();
                UserInfoDesignationViewModel userInfoDesignationViewModel = _userInfoManger.GetUserById(id);
                return View(userInfoDesignationViewModel);
            }
            else
            {
                return RedirectToAction("Logout", "Home", new { message = "You have already logged out. Please login again" });
            }



            
        }

        [HttpPost]
        public ActionResult Update(UserInfo userInfo)
        {
            ViewBag.Designation = _designationManager.GetAllDesignationAsListItem();
            ViewBag.IsActives = _designationManager.GetIsActiveListItem();

            string message = _userInfoManger.Update(userInfo);
            if (message == "Update Successfull")
            {
                return RedirectToAction("EditView");
            }
            else
            {
                return View(userInfo);
            }
        }


        public JsonResult PasswordReset(int id)
        {
            string message = _userInfoManger.PasswordReset(id);
            return Json(message);
        }



    }
}