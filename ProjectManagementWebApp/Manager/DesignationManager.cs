using ProjectManagementWebApp.Gateway;
using ProjectManagementWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ProjectManagementWebApp.Manager
{
    public class DesignationManager
    {

        private DesignationGateway _designationGateway;

        public DesignationManager()
        {
            _designationGateway = new DesignationGateway();
        }


        public List<ListItem> GetAllDesignationAsListItem()
        {
            List<ListItem> designationListItem = new List<ListItem>()
            {
                new ListItem() { Text = "Please Select"}
            };

            List<Designation> designationList = _designationGateway.GetAllDesignation();

            foreach (Designation designation in designationList)
            {
                ListItem listItem = new ListItem();
                listItem.Value = designation.Id.ToString();
                listItem.Text = designation.Name;

                designationListItem.Add(listItem);
            }

            return designationListItem;
        }

        public List<ListItem> GetIsActiveListItem()
        {
            List<ListItem> isActiveListItem = new List<ListItem>()
            {
                new ListItem(){Value = "Null",Text = "Please Select"},
                new ListItem(){Value = "0",Text = "Inactive"},
                new ListItem(){Value = "1",Text = "Active"}
            };

            return isActiveListItem;
        }


    }
}