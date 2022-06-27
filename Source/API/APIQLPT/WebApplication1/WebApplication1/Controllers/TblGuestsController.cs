using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TblGuestsController : ControllerBase
    {
        private QuanLyPhongTroContext _context = new QuanLyPhongTroContext();
        //public TblGuestsController(QuanLyPhongTroContext context)
        //{
        //    _context = context;
        //}

        // GET: api/TblGuests
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblGuest>>> GetTblGuests()
        {
            return await _context.TblGuests.ToListAsync();
        }

        // GET: api/TblGuests/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblGuest>> GetTblGuest(string id)
        {
            var tblGuest = await _context.TblGuests.FindAsync(id);

            if (tblGuest == null)
            {
                return NotFound();
            }

            return tblGuest;
        }

        // PUT: api/TblGuests/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblGuest(string id, TblGuest tblGuest)
        {
            if (id != tblGuest.IdNumber)
            {
                return BadRequest();
            }

            _context.Entry(tblGuest).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TblGuestExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/TblGuests
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TblGuest>> PostTblGuest(TblGuest tblGuest)
        {
            _context.TblGuests.Add(tblGuest);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TblGuestExists(tblGuest.IdNumber))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTblGuest", new { id = tblGuest.IdNumber }, tblGuest);
        }

        // DELETE: api/TblGuests/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTblGuest(string id)
        {
            var tblGuest = await _context.TblGuests.FindAsync(id);
            if (tblGuest == null)
            {
                return NotFound();
            }

            _context.TblGuests.Remove(tblGuest);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TblGuestExists(string id)
        {
            return _context.TblGuests.Any(e => e.IdNumber == id);
        }
    }
}
