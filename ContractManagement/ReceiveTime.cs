//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ContractManagement
{
    using System;
    using System.Collections.Generic;
    
    public partial class ReceiveTime
    {
        public int Id { get; set; }
        public int Type { get; set; }
        public double ExpectedMoney { get; set; }
        public int ExpectedCurrency { get; set; }
        public string ReceiveCondition { get; set; }
        public System.DateTime ReceiveDate { get; set; }
        public double ActualMoney { get; set; }
        public int ActualCurrency { get; set; }
        public int InvoiceState { get; set; }
        public System.DateTime InvoiceTime { get; set; }
        public int ContractRegistryFormId { get; set; }
    }
}