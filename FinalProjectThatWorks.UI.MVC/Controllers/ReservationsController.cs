using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProjectThatWorks.DATA.EF;

namespace FinalProjectThatWorks.UI.MVC.Controllers
{
    public class ReservationsController : Controller
    {
        private FinalProject2Entities db = new FinalProject2Entities();

        // GET: Reservations
        public ActionResult Index()
        {
            var reservations = db.Reservations.Include(r => r.Car).Include(r => r.Location);
            return View(reservations.ToList());
        }

        // GET: Reservations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        // GET: Reservations/Create
        public ActionResult Create()
        {
            ViewBag.OwnerAssetId = new SelectList(db.Cars, "OwnerAssetId", "CarName");
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName");
            return View();
        }

        // POST: Reservations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ReservationId,OwnerAssetId,LocationId,ReservationDate,WorkNotes")] Reservation reservation)
        {
            if (ModelState.IsValid)
            {
                //If user is not an Admin Role
                if (!User.IsInRole("Admin"))
                {

                    //get the reservation limit for the current location (returns an int)
                    int currentLimit = db.Locations.Where(x => x.LocationId == reservation.LocationId).Select(x => x.ReservationLimit).Single();

                    //find number of reservations at that location for that date (returns an int)
                    int numberOfReservations = db.Reservations.Where(x => x.LocationId == reservation.LocationId &&
                    x.ReservationDate == reservation.ReservationDate).Count();

                    //check if reservation limit is less than the number of reservations (if statement)
                    if (numberOfReservations <= currentLimit)
                    {
                        //if less than limit add reservation, save changes, return to Index
                        //Add a new Reservation to the database with a View if Model is valid
                        db.Reservations.Add(reservation);
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    //else (value is NOT less than limit) - Add a Viewbag message that says spots are no longer available.
                    else
                    {
                        ViewBag.Message("Sorry! Spots are no longer available.");
                        return View(reservation);
                    }

                }
                db.Reservations.Add(reservation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.OwnerAssetId = new SelectList(db.Cars, "OwnerAssetId", "CarName", reservation.OwnerAssetId);
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName", reservation.LocationId);
            return View(reservation);
        }

        // GET: Reservations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            ViewBag.OwnerAssetId = new SelectList(db.Cars, "OwnerAssetId", "CarName", reservation.OwnerAssetId);
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName", reservation.LocationId);
            return View(reservation);
        }

        // POST: Reservations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ReservationId,OwnerAssetId,LocationId,ReservationDate,WorkNotes")] Reservation reservation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reservation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.OwnerAssetId = new SelectList(db.Cars, "OwnerAssetId", "CarName", reservation.OwnerAssetId);
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName", reservation.LocationId);
            return View(reservation);
        }

        // GET: Reservations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        // POST: Reservations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Reservation reservation = db.Reservations.Find(id);
            db.Reservations.Remove(reservation);
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
