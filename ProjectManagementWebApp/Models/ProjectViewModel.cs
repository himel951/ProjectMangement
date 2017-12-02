using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;


namespace ProjectManagementWebApp.Models
{
    public class ProjectViewModel
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        [Display(Name = "Code Name")]
        public string CodeName { get; set; }
        public string Description { get; set; }
        [Required]
        [Display(Name = "Possible Start Date")]
        public string StartDate { get; set; }
        [Required]
        [Display(Name = "Possible End Date")]
        public string EndDate { get; set; }
        public HttpPostedFile Resource { get; set; }
        [Required]
        public int Status { get; set; }
    }
}