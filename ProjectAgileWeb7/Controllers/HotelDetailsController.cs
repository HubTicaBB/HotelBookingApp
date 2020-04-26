﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ProjectAgileWeb7.Data;
using ProjectAgileWeb7.Models;

namespace ProjectAgileWeb7.Controllers
{
    public class HotelDetailsController : Controller
    {
        private readonly ApplicationDbContext _appContext;

        public HotelDetailsController(ApplicationDbContext appContext)
        {
            _appContext = appContext;
        }

        public async Task<IActionResult> Index(int id)
        {
            var hotel = await _appContext.Hotels
                .Where(h => h.HotelId == id)
                .Include(r => r.Rooms)
                .Include(f => f.HotelFacilities)
                .ThenInclude(fa => fa.Facility)
                .ToListAsync();            

            return View(hotel[0]);
        }

        public IActionResult BookRoom(RoomType roomType)
        {
            ViewData["roomType"] = roomType;
            return View();
        }
    }
}