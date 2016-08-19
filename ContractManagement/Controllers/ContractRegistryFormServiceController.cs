using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ContractManagement.Utils;
using ContractManagement.ResponseMessage;
using System.Data.Entity.Validation;
using System.Data.Entity;

namespace ContractManagement.Controllers
{
    public class ContractRegistryFormServiceController : ApiController
    {
        [HttpGet]
        public HttpResponseMessage GetContractRegistryForm(string number)   
        {
            using (var contractManagementDB = new ContractModelContainer())
            {
                try
                {
                    var existTargetContractForm = from cf in contractManagementDB.ContractRegistryForms
                                                  where cf.Number == number
                                                  select cf;

                    if (existTargetContractForm.Count() > 0)
                    {
                        try
                        {
                            var targetContractForm = existTargetContractForm.First();
                            contractManagementDB.Entry(targetContractForm).Collection(cf => cf.Departments).Load();
                            contractManagementDB.Entry(targetContractForm).Collection(cf => cf.SubjectObjects).Load();
                            contractManagementDB.Entry(targetContractForm).Collection(cf => cf.ArchiveMaterials).Load();
                            contractManagementDB.Entry(targetContractForm).Reference(cf => cf.PreRegisterRecording).Load();
                            contractManagementDB.Entry(targetContractForm).Reference(cf => cf.FormalRegisterRecording).Load();
                            contractManagementDB.Entry(targetContractForm).Collection(cf => cf.PayRecordings).Load();
                            contractManagementDB.Entry(targetContractForm).Collection(cf => cf.ReceiveRecordings).Load();
                            contractManagementDB.Entry(targetContractForm).Collection(cf => cf.ReceiveTimes).Load();
                            contractManagementDB.Entry(targetContractForm).Collection(cf => cf.payTimes).Load();

                            return ContractManagementUtil.ConstructHttpResponseUsingInstance(Request, new ResultWithDataResponse<ContractRegistryForm>(true, targetContractForm));
                        }
                        catch(Exception e)
                        {
                            return ContractManagementUtil.ConstructHttpResponseUsingOperationResult(Request, Tuple.Create<bool, string>(false, e.ToString()));
                        }
                        
                    }
                    else
                    {
                        return ContractManagementUtil.ConstructHttpResponseUsingOperationResult(Request,
                        Tuple.Create<bool, string>(false, "Contract registry form (" + number + ") doesn't exist."));
                    }
                }
                catch (DbEntityValidationException e)
                {

                    return ContractManagementUtil.ConstructHttpResponseUsingOperationResult(Request,
                        Tuple.Create<bool, string>(false, ContractManagementUtil.ConstructDbEntityValidationExceptionInfoMsg(e)));
                }
            }
        }

        [HttpPost]
        public HttpResponseMessage CreateContractRegistryForm([FromBody] ContractRegistryForm contractRegistryForm)
        {
            using (var contractManagementDB = new ContractModelContainer())
            {
                try
                {
                    var existTargetContractForm = from cf in contractManagementDB.ContractRegistryForms
                                where cf.Number == contractRegistryForm.Number
                                select cf;

                    if (existTargetContractForm.Count() > 0)
                    {
                        return ContractManagementUtil.ConstructHttpResponseUsingOperationResult(Request,
                        Tuple.Create<bool, string>(false, "Contract registry form (" + contractRegistryForm.Number + ") already exists."));
                    }

                    contractManagementDB.ContractRegistryForms.Add(contractRegistryForm);
                    contractManagementDB.SaveChanges();
                    return ContractManagementUtil.ConstructHttpResponseUsingOperationResult(Request,
                        Tuple.Create<bool, string>(true, "Create contract registry form (" + contractRegistryForm.Number + ") successfully."));
                }
                catch (DbEntityValidationException e)
                {
                    
                    return ContractManagementUtil.ConstructHttpResponseUsingOperationResult(Request, 
                        Tuple.Create<bool, string>(false, ContractManagementUtil.ConstructDbEntityValidationExceptionInfoMsg(e)));
                }
            }
        }
    }
}
