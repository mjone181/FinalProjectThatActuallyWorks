using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalProjectThatWorks.UI.MVC.Models
{
    public class CarsViewModel
    {
        public int OwnerAssetId { get; set; }
        public string CarName { get; set; }
        public string OwnerId { get; set; }
        public string AssetPhoto { get; set; }
        public string SpecialNotes { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime DateAdded { get; set; }
    }
}