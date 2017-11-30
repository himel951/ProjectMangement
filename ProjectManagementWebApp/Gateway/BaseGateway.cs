using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace ProjectManagementWebApp.Gateway
{
    public class BaseGateway
    {
        private static string connectionString = WebConfigurationManager.ConnectionStrings["ProjectManDB"].ConnectionString;
        public SqlConnection Connection { get; set; }
        public SqlCommand Command { get; set; }
        public SqlDataReader Reader { get; set; }
        public BaseGateway()
        {
            Connection = new SqlConnection(connectionString);
        }
    }
}