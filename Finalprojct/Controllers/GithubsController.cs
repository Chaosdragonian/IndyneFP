using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Finalprojct.DAL;

namespace Finalprojct.Controllers
{
    public class GithubsController : Controller
    {
        private FPDbContext db = new FPDbContext();

        // GET: Githubs
        public ActionResult Index()
        {
            var githubs = db.Githubs.Include(g => g.Contact);
            return View(githubs.ToList());
        }

        // GET: Githubs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Github github = db.Githubs.Find(id);
            if (github == null)
            {
                return HttpNotFound();
            }
            return View(github);
        }

        // GET: Githubs/Create
        public ActionResult Create()
        {
            ViewBag.ContactID = new SelectList(db.Contacts, "ID", "Email");
            return View();
        }

        // POST: Githubs/Create
        // 초과 게시 공격으로부터 보호하려면 바인딩하려는 특정 속성을 사용하도록 설정하십시오. 
        // 자세한 내용은 https://go.microsoft.com/fwlink/?LinkId=317598을(를) 참조하십시오.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "GitID,Gitaddress,ContactID,ContactName")] Github github)
        {
            if (ModelState.IsValid)
            {
                db.Githubs.Add(github);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ContactID = new SelectList(db.Contacts, "ID", "Email", github.ContactID);
            return View(github);
        }

        // GET: Githubs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Github github = db.Githubs.Find(id);
            if (github == null)
            {
                return HttpNotFound();
            }
            ViewBag.ContactID = new SelectList(db.Contacts, "ID", "Email", github.ContactID);
            return View(github);
        }

        // POST: Githubs/Edit/5
        // 초과 게시 공격으로부터 보호하려면 바인딩하려는 특정 속성을 사용하도록 설정하십시오. 
        // 자세한 내용은 https://go.microsoft.com/fwlink/?LinkId=317598을(를) 참조하십시오.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "GitID,Gitaddress,ContactID,ContactName")] Github github)
        {
            if (ModelState.IsValid)
            {
                db.Entry(github).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ContactID = new SelectList(db.Contacts, "ID", "Email", github.ContactID);
            return View(github);
        }

        // GET: Githubs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Github github = db.Githubs.Find(id);
            if (github == null)
            {
                return HttpNotFound();
            }
            return View(github);
        }

        // POST: Githubs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Github github = db.Githubs.Find(id);
            db.Githubs.Remove(github);
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
