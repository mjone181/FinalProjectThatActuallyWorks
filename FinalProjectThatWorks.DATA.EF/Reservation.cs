//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FinalProjectThatWorks.DATA.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Reservation
    {
        public int ReservationId { get; set; }
        public int OwnerAssetId { get; set; }
        public int LocationId { get; set; }
        public System.DateTime ReservationDate { get; set; }
        public string WorkNotes { get; set; }
    
        public virtual Car Car { get; set; }
        public virtual Location Location { get; set; }
    }
}
