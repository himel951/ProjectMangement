using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectManagementWebApp.Models
{
    public class Resource
    {
        public int Id { get; set; }
        public string FilePath { get; set; }
        public int ProjectId { get; set; }

    }
}