using ProjectManagementWebApp.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Microsoft.Ajax.Utilities;

namespace ProjectManagementWebApp.Gateway
{
    public class UserInfoGateway : BaseGateway
    {

        public int Save(UserInfo userInfo)
        {
            String query = "insert into UserInfo(Name,Email,Password,IsActive,DesignationId)" +
                           " values(@Name,@Email,@Password,@IsActive,@DesignationId)";

            Command = new SqlCommand(query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("@Name", userInfo.Name);
            Command.Parameters.AddWithValue("@Email", userInfo.Email);
            Command.Parameters.AddWithValue("@Password", userInfo.Password);
            Command.Parameters.AddWithValue("@IsActive", userInfo.IsActive);
            Command.Parameters.AddWithValue("@DesignationId", userInfo.DesignationId);

            Connection.Open();

            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }

        public bool IsUserNameAndPasswordValid(string email, string password)
        {
            string query = "select * from UserInfo where Email =@email and Password =@password and IsActive = 1";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@email", email);
            Command.Parameters.AddWithValue("@password", password);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool isExists = Reader.HasRows;
            Connection.Close();
            Reader.Close();
            return isExists;
        }


        public bool IsEmailExists(string email)
        {
            string query = "select * from UserInfo where Email =@email ";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@email", email);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool isExists = Reader.HasRows;
            Connection.Close();
            Reader.Close();
            return isExists;
        }

        public List<UserInfoViewModel> GetUserMenu(string email, string password)
        {
            string query = "select a.Id as UserId,a.Name as UserName,a.Email,a.Password,a.IsActive,b.Id as DesignationId,b.Name as DesignationName,c.Id as MenuPermissionId,c.MenuPath, c.MenuCaption,c.SortId from UserInfo a inner join Designation b on a.DesignationId = b.Id inner join MenuPermission c on b.Id = c.DesignationId where a.Email =@email and a.Password = @password and IsActive = 1 order by c.SortId";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@email", email);
            Command.Parameters.AddWithValue("@password", password);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<UserInfoViewModel> userInfoViewModelList = new List<UserInfoViewModel>();
            while (Reader.Read())
            {
                UserInfoViewModel userInfoViewModel = new UserInfoViewModel()
                {
                    UserId = Convert.ToInt32(Reader["UserId"]),
                    UserName = Reader["UserName"].ToString(),
                    Email = Reader["Email"].ToString(),
                    Password = Reader["Password"].ToString(),
                    IsActive = Convert.ToInt32(Reader["IsActive"]),
                    DesignationId = Convert.ToInt32(Reader["DesignationId"]),
                    DesignationName = Reader["DesignationName"].ToString(),
                    MenuPermissionId = Convert.ToInt32(Reader["MenuPermissionId"]),
                    MenuPath = Reader["MenuPath"].ToString(),
                    MenuCaption = Reader["MenuCaption"].ToString(),
                    SortId = Convert.ToInt32(Reader["SortId"])


                };
                userInfoViewModelList.Add(userInfoViewModel);
            }
            Connection.Close();

            return userInfoViewModelList;
        }


        public List<UserInfoDesignationViewModel> GetAllUser()
        {
            string query = "select a.Id,a.Name, a.Email,(SUBSTRING(a.Password,1,1)+'****') as Password, a.IsActive,b.Id as DesignationId,b.Name as Designation from UserInfo a inner join Designation b on a.DesignationId = b.Id order by a.Name";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<UserInfoDesignationViewModel> userInfoDesignationViewModelList = new List<UserInfoDesignationViewModel>();
            while (Reader.Read())
            {
                UserInfoDesignationViewModel userInfoDesignationViewModel = new UserInfoDesignationViewModel();

                userInfoDesignationViewModel.Id = Convert.ToInt32(Reader["Id"]);
                userInfoDesignationViewModel.Name = Reader["Name"].ToString();
                userInfoDesignationViewModel.Email = Reader["Email"].ToString();
                userInfoDesignationViewModel.Password = Reader["Password"].ToString();
                userInfoDesignationViewModel.IsActive = Convert.ToInt32(Reader["IsActive"]);
                userInfoDesignationViewModel.DesignationId = Convert.ToInt32(Reader["DesignationId"]);
                userInfoDesignationViewModel.Designation = Reader["Designation"].ToString();

                userInfoDesignationViewModelList.Add(userInfoDesignationViewModel);
            }
            Connection.Close();

            return userInfoDesignationViewModelList;
        }


        public UserInfoDesignationViewModel GetUserById(int id)
        {
            string query = "select a.Id,a.Name, a.Email,(SUBSTRING(a.Password,1,1)+'****') as Password, a.IsActive,b.Id as DesignationId,b.Name as Designation from UserInfo a inner join Designation b on a.DesignationId = b.Id where a.Id =@id";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@id", id);
            Connection.Open();
            Reader = Command.ExecuteReader();
            Reader.Read();
            UserInfoDesignationViewModel userInfoDesignationViewModel = new UserInfoDesignationViewModel();
            userInfoDesignationViewModel.Id = Convert.ToInt32(Reader["Id"]);
            userInfoDesignationViewModel.Name = Reader["Name"].ToString();
            userInfoDesignationViewModel.Email = Reader["Email"].ToString();
            userInfoDesignationViewModel.Password = Reader["Password"].ToString();
            userInfoDesignationViewModel.IsActive = Convert.ToInt32(Reader["IsActive"]);
            userInfoDesignationViewModel.DesignationId = Convert.ToInt32(Reader["DesignationId"]);
            userInfoDesignationViewModel.Designation = Reader["Designation"].ToString();
          
            Connection.Close();

            return userInfoDesignationViewModel;
        }

        public int Update(UserInfo userInfo)
        {
            String query = "update UserInfo set Name = @name, Email = @email, IsActive=@isActive, DesignationId = @designationId where Id = @id";

            Command = new SqlCommand(query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("@Id", userInfo.Id);    
            Command.Parameters.AddWithValue("@Name", userInfo.Name);
            Command.Parameters.AddWithValue("@Email", userInfo.Email);
            Command.Parameters.AddWithValue("@IsActive", userInfo.IsActive);
            Command.Parameters.AddWithValue("@designationId", userInfo.DesignationId);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }

    }
}