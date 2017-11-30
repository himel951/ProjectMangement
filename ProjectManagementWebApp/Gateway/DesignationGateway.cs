using ProjectManagementWebApp.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ProjectManagementWebApp.Gateway
{
    public class DesignationGateway : BaseGateway
    {

        public List<Designation> GetAllDesignation()
        {
            string query = "select * from Designation";
            Command = new SqlCommand(query, Connection);           
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Designation> designationList = new List<Designation>();
            while (Reader.Read())
            {
                Designation designation = new Designation()
                {
                    Id = Convert.ToInt32(Reader["Id"]),
                    Name = Reader["Name"].ToString()
                };

                designationList.Add(designation);
            }

            Connection.Close();

            return designationList;
        }





    }
}