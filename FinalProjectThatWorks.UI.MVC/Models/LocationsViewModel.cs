using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalProjectThatWorks.UI.MVC.Models
{
    public class LocationsViewModel
    {
        public int LocationId { get; set; }
        public string LocationName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public byte ReservationLimit { get; set; }
    }
}