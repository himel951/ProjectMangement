using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectManagementWebApp.Models
{
    public class UserInfoDesignationViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int IsActive { get; set; }
        [Display(Name = "Designation")]
        public int DesignationId { get; set; }
        public string Designation { get; set; }

    }
}