using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectManagementWebApp.SecurityNC
{
    public class NCSecurity
    {
        public static  string EncryptValue(string value)
        {
            char[] temp = value.ToCharArray();
            char[] tempNewArray = new char[temp.Length];
            for (int i = 0; i < temp.Length; i++)
            {
                tempNewArray[i] = Convert.ToChar(Convert.ToInt32(temp[i]) + 5);
            }
            return new string(tempNewArray);
        }

        public static  string DecryptValue(string value)
        {
            char[] temp = value.ToCharArray();
            char[] tempNewArray = new char[temp.Length];
            for (int i = 0; i < temp.Length; i++)
            {
                tempNewArray[i] = Convert.ToChar(Convert.ToInt32(temp[i]) - 5);
            }
            return new string(tempNewArray);
        }
    }
}