using ProjectManagementWebApp.Gateway;
using ProjectManagementWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectManagementWebApp.Manager
{
    public class UserInfoManager
    {
        private UserInfoGateway _userInfoGateway;
        public UserInfoManager()
        {
            _userInfoGateway = new UserInfoGateway();
        }

        public bool IsUserNameAndPasswordValid(string userName, string password)
        {
            return _userInfoGateway.IsUserNameAndPasswordValid(userName, password);
        }

        public List<UserInfoViewModel> GetUserMenu(string email, string password)
        {
            _userInfoGateway = new UserInfoGateway();
            List<UserInfoViewModel> userInfoViewModelList = _userInfoGateway.GetUserMenu(email,password);
            return userInfoViewModelList;
        }

        public string Save(UserInfo userInfo)
        {
            if (_userInfoGateway.IsEmailExists(userInfo.Email))
            {
                return "Email Already Exists";
            }
            int rowAffect = _userInfoGateway.Save(userInfo);

            return rowAffect > 0 ? "Save Successfull" : "Save Failed";
        }

        public List<UserInfoDesignationViewModel> GetAllUser()
        {
            List<UserInfoDesignationViewModel> userInfoDesignationViewModelList = _userInfoGateway.GetAllUser();
            return userInfoDesignationViewModelList;
        }

        public UserInfoDesignationViewModel GetUserById(int id)
        {
            UserInfoDesignationViewModel userInfoDesignationViewModel = _userInfoGateway.GetUserById(id);
            return userInfoDesignationViewModel;
        }

        public string Update(UserInfo userInfo)
        {
            int rowAffect = _userInfoGateway.Update(userInfo);
            return rowAffect > 0 ? "Update Successfull" : "Update Failed";
        }
    }
}