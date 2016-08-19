using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ContractManagement.ParamsModels;
using ContractManagement.Utils;

namespace ContractManagement.Controllers
{
    public class TestController : ApiController
    {
        [HttpPost]
        public HttpResponseMessage PostTest([FromBody] TestParam tp)
        {
            return ContractManagementUtil.ConstructHttpResponseUsingInstance<TestParam>(Request, tp);
        }

        [HttpGet]
        public string GetTest()
        {
            return "aaa";
        }
    }
}
