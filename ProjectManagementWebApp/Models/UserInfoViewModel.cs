using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectManagementWebApp.Models
{
    public class UserInfoViewModel
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int IsActive { get; set; }
        public int DesignationId { get; set; }
        public string DesignationName { get; set; }
        public int MenuPermissionId { get; set; }
        public string MenuPath { get; set; }
        public string MenuCaption { get; set; }
        public int SortId { get; set; }







    }
}