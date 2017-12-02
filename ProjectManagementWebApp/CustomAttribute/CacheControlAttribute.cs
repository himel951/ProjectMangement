using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectManagementWebApp.CustomAttribute
{

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, Inherited = true, AllowMultiple = false)]
    public class CacheControlAttribute : ActionFilterAttribute
    {
        private readonly HttpCacheability cacheability;
        public HttpCacheability Cacheability { get { return this.cacheability; } }
        public CacheControlAttribute(HttpCacheability cacheability)
        {
            this.cacheability = cacheability;
        }
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            HttpCachePolicyBase cache = filterContext.HttpContext.Response.Cache;
            cache.SetCacheability(this.cacheability);
        }
    }
}