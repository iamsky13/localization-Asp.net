using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using navbar.Models;

namespace navbar.Controllers
{
    public class LocalizationController : Controller
    {
        public IActionResult Index(string id="en")
        {
            navContext db = new navContext();
            var menuList = db.vw_localization.Where(x => x.code == id).OrderBy(x => x.rank);
            return View(menuList);
        }
    }
}