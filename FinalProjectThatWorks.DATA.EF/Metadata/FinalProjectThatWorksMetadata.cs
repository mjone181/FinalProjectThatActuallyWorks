using System;
using System.Collections.Generic;
//Need this for Metadata to function
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalProjectThatWorks.DATA.EF.Metadata
{
    //Metadata for all of the tables within the project.
    public class FinalProjectThatWorksMetadata
    {
        //Reservation Metadata
        #region Reservation

        //Foreign Key
        //Not supposed to be viewable. No Metadata requried.
        public int ReservationId { get; set; }       
        public int OwnerAssetId { get; set; }
        public int LocationId { get; set; }

        //Date Formatting for ReservationDate. Required Field.
        [Display(Name = "Reservation Date:")]
        [Required(ErrorMessage = "*Date is required.")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime ReservationDate { get; set; }

        //Formatting for WorkNotes. Nullable field.
        [Display(Name = "Special Work Notes:")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [StringLength(300, ErrorMessage = "*Must be 300 characters or less.")]
        [UIHint("MultilineText")]
        public string WorkNotes { get; set; }
        #endregion

        //Location Metadata
        #region Location

        //Foreign Key
        //public int LocationId { get; set; }

        //LocationName formatting. Required field.
        [Display(Name = "Location Name:")]
        [Required(ErrorMessage = "*Location Name is required.")]
        [StringLength(50, ErrorMessage = "*Must be 50 characters or less.")]
        public string LocationName { get; set; }

        //Address formatting. Required field.
        [Display(Name = "Address:")]
        [Required(ErrorMessage = "*Address is required.")]
        [StringLength(100, ErrorMessage = "*Must be 100 characters or less.")]
        public string Address { get; set; }

        //City formatting. Required field.
        [Display(Name = "City:")]
        [Required(ErrorMessage = "*City is required.")]
        [StringLength(100, ErrorMessage = "*Must be 100 characters or less.")]
        public string City { get; set; }

        //State formatting. Required field.
        [Display(Name = "State:")]
        [Required(ErrorMessage = "*State is required.")]
        [StringLength(2, ErrorMessage = "*Must be 2 characters or less.")]
        public string State { get; set; }

        //ZipCode formatting. Required field.
        [Display(Name = "Zip Code:")]
        [Required(ErrorMessage = "*Zip Code is required.")]
        [StringLength(5, ErrorMessage = "*Must be 5 characters or less.")]
        public string ZipCode { get; set; }

        //ReservationLimit formatting. Required field.
        [Display(Name = "Reservation Limit:")]
        [Required(ErrorMessage = "*Limit is required.")]
        public byte ReservationLimit { get; set; }
        #endregion

        //Car Metadata
        #region Car
        //Foreign Key
        //public int OwnerAssetId { get; set; }

        //CarName formatting. Required field.
        [Display(Name = "Car Name:")]
        [Required(ErrorMessage = "*Car Name is required.")]
        [StringLength(50, ErrorMessage = "*Must be 50 characters or less.")]
        public string CarName { get; set; }

        //OwnerId formatting. Required field.
        [Display(Name = "Owner Id:")]
        [Required(ErrorMessage = "*Owner Id is required.")]
        [StringLength(50, ErrorMessage = "*Must be 128 characters or less.")]
        public string OwnerId { get; set; }

        //CarPhoto formatting. Optional field.
        [Display(Name = "Car Photo:")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [StringLength(50, ErrorMessage = "*Must be 50 characters or less.")]
        public string CarPhoto { get; set; }

        //SpecialNotes formatting. Optional field.
        [Display(Name = "Special Notes:")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [StringLength(50, ErrorMessage = "*Must be 300 characters or less.")]
        [UIHint("MultilineText")]
        public string SpecialNotes { get; set; }

        //IsActive formatting. Required field.
        [Display(Name = "Active Status:")]
        [Required(ErrorMessage = "*Active Status is required.")]
        public bool IsActive { get; set; }

        //DateAdded formatting. Required field.
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime DateAdded { get; set; }
        #endregion

        //UserDetail Metadata
        #region UserDetail

        //Foreign key
        //Not supposed to be viewable. No Metadata requried.
        public string UserId { get; set; }

        //FirstName formatting. Required field.
        [Display(Name = "First Name:")]
        [Required(ErrorMessage = "*First Name is required.")]
        [StringLength(50, ErrorMessage = "*Must be 50 characters or less.")]
        public string FirstName { get; set; }

        //LastName formatting. Required field.
        [Display(Name = "Last Name:")]
        [Required(ErrorMessage = "*Last Name is required.")]
        [StringLength(50, ErrorMessage = "*Must be 50 characters or less.")]
        public string LastName { get; set; }
        #endregion
    }
}
