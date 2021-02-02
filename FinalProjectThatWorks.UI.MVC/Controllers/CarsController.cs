using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
//Needed for Image Upload Utility
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProjectThatWorks.DATA.EF;
using FinalProjectThatWorks.UI.MVC.Utilties;

namespace FinalProjectThatWorks.UI.MVC.Controllers
{
    public class CarsController : Controller
    {
        private FinalProject2Entities db = new FinalProject2Entities();

        // GET: Cars
        public ActionResult Index()
        {
            var cars = db.Cars.Include(c => c.UserDetail);
            return View(cars.ToList());
        }

        // GET: Cars/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Car car = db.Cars.Find(id);
            if (car == null)
            {
                return HttpNotFound();
            }
            return View(car);
        }

        // GET: Cars/Create
        public ActionResult Create()
        {
            ViewBag.OwnerId = new SelectList(db.UserDetails, "UserId", "FirstName");
            return View();
        }

        // POST: Cars/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OwnerAssetId,CarName,OwnerId,CarPhoto,SpecialNotes,IsActive,DateAdded")] Car car, HttpPostedFileBase CarPhoto)
        {
            #region File Upload
            if (ModelState.IsValid)
            {
                //Use default image if none is provided.
                string imgName = "GenericCar.jpg";
                if (CarPhoto != null) //HttpPostedFileBase added to the action != null
                {
                    //Get image and return to variable.
                    imgName = CarPhoto.FileName;

                    //Declare and assign ext variable.
                    string ext = imgName.Substring(imgName.LastIndexOf('.'));

                    //Declare a list of valid extensions.
                    string[] goodExts = { ".jpeg", ".jpg", ".gif", ".png" };

                    //Check the ext variable (toLower()) against the valid list.
                    if (goodExts.Contains(ext.ToLower()) && (CarPhoto.ContentLength <= 4194304))//Max 4MB value allowed by ASP.net
                    {
                        //If it is in the list using a guid
                        imgName = Guid.NewGuid() + ext;

                        //save to the webserver
                       CarPhoto.SaveAs(Server.MapPath("~/Content/images/" + imgName));

                        //Create variables to resize image.
                        string savePath = Server.MapPath("~/Content/images/");

                        Image convertedImage = Image.FromStream(CarPhoto.InputStream);

                        int maxImgSize = 500;
                        int maxThumbSize = 100;

                        UploadUtility.ResizeImage(savePath, imgName, convertedImage, maxImgSize, maxThumbSize);
                    }
                    else
                    {
                        imgName = "GenericCar.png";
                    }

                    //No matter what, add imgName to the object.
                    car.CarPhoto = imgName;
                }

            }
            #endregion  
            if (ModelState.IsValid)
            {
                db.Cars.Add(car);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.OwnerId = new SelectList(db.UserDetails, "UserId", "FirstName", car.OwnerId);
            return View(car);
        }

        // GET: Cars/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Car car = db.Cars.Find(id);
            if (car == null)
            {
                return HttpNotFound();
            }
            ViewBag.OwnerId = new SelectList(db.UserDetails, "UserId", "FirstName", car.OwnerId);
            return View(car);
        }

        // POST: Cars/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OwnerAssetId,CarName,OwnerId,CarPhoto,SpecialNotes,IsActive,DateAdded")] Car car, HttpPostedFileBase CarPhoto)
        {
            #region File Upload
            if (CarPhoto != null)//HttpPostedFileBase added to the action != null
            {
                //Get image and assign to variable
                string imgName = CarPhoto.FileName;

                //Declare and assign ext value
                string ext = imgName.Substring(imgName.LastIndexOf('.'));

                //Declare a list of valid extensions.
                string[] goodExts = { ".jpeg", ".jpg", ".gif", ".png" };

                //Check the ext value (toLower()) against the valid list
                if (goodExts.Contains(ext.ToLower()) && (CarPhoto.ContentLength <= 4194304))//4MB max allowed by ASP.NET
                {
                    //If it is in the list rename using a guid
                    imgName = Guid.NewGuid() + ext;

                    //Save to the webserver
                    CarPhoto.SaveAs(Server.MapPath("~/Content/images/" + imgName));

                    //Create variables to resize image.
                    string savePath = Server.MapPath("~/Content/images/");

                    Image convertedImage = Image.FromStream(CarPhoto.InputStream);

                    int maxImgSize = 500;
                    int maxThumbSize = 100;

                    UploadUtility.ResizeImage(savePath, imgName, convertedImage, maxImgSize, maxThumbSize);

                    //Make sure you are not deleting your default image.
                    if (car.CarPhoto != null && car.CarPhoto != "noImage.png")
                    {
                        //Remove the original file
                        string path = Server.MapPath("~/Content/images/");
                        UploadUtility.Delete(path, car.CarPhoto);
                    }

                    //Only save if image meets criteria imageName to the object.
                    car.CarPhoto = imgName;
                }

            }
            #endregion
            if (ModelState.IsValid)
            {
                db.Entry(car).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.OwnerId = new SelectList(db.UserDetails, "UserId", "FirstName", car.OwnerId);
            return View(car);
        }

        // GET: Cars/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Car car = db.Cars.Find(id);
            if (car == null)
            {
                return HttpNotFound();
            }
            return View(car);
        }

        // POST: Cars/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Car car = db.Cars.Find(id);

            if (car.CarPhoto != null && car.CarPhoto != "GenericCar.jpg")
            {
                //Remove the original file from the edit view.
                string path = Server.MapPath("~/Content/images/");
                UploadUtility.Delete(path, car.CarPhoto);
            }

            db.Cars.Remove(car);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
