using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalProjectThatWorks.UI.MVC.Models
{
    public class ReservationsViewModel
    {
        public int ReservationId { get; set; }
        public int OwnerAssetId { get; set; }
        public int LocationId { get; set; }
        public System.DateTime ReservationDate { get; set; }
        public string WorkNotes { get; set; }
    }
}