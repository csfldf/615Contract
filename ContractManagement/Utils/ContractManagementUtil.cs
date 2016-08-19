using System;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Web.Http;
using ContractManagement.ResponseMessage;
using System.Data.Entity.Validation;
using System.Text;

namespace ContractManagement.Utils
{
    public class ContractManagementUtil
    {
        //public static HttpResponseMessage DealWithTheStorageException(StorageException e, HttpRequestMessage req, String specificMsg)
        //{
        //    if (e.RequestInformation.HttpStatusCode == Convert.ToInt32(HttpStatusCode.Forbidden))
        //    {
        //        return ConstructHttpResponseUsingOperationResult(req, Tuple.Create<bool, string>(false, AzureStorageWebServiceConstantValue.UnAuthorizedMessage));
        //    }
        //    else
        //    {
        //        return ConstructHttpResponseUsingOperationResult(req, Tuple.Create<bool, string>(false, specificMsg));
        //    }
        //}

        public static string ConstructDbEntityValidationExceptionInfoMsg(DbEntityValidationException e)
        {
            StringBuilder exceptionMsgBuilder = new StringBuilder();

            foreach (var eve in e.EntityValidationErrors)
            {
                exceptionMsgBuilder.AppendFormat("Entity of type '{0}' in state '{1}' has the following validation errors:",
                    eve.Entry.Entity.GetType().Name, eve.Entry.State);
                exceptionMsgBuilder.AppendLine();

                foreach (var ve in eve.ValidationErrors)
                {
                    exceptionMsgBuilder.AppendFormat("- Property: '{0}', Error: '{1}'",
                        ve.PropertyName, ve.ErrorMessage);
                    exceptionMsgBuilder.AppendLine();
                }
            }

            return exceptionMsgBuilder.ToString();
        }

        public static string DecodeParamter(string paramter)
        {
            return paramter;
        }

        public static HttpResponseMessage ConstructHttpResponseUsingOperationResult(HttpRequestMessage request, Tuple<bool, string> opResult)
        {
            return request.CreateResponse(HttpStatusCode.OK, new BoolResultOpResponse(opResult.Item1, opResult.Item2));
        }

        public static HttpResponseMessage ConstructHttpResponseUsingInstance<T>(HttpRequestMessage req, T obj)
        {
            return req.CreateResponse(HttpStatusCode.OK, obj);
        }
    }
}