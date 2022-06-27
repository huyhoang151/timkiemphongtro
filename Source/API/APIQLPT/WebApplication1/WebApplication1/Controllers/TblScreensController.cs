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
    public class TblScreensController : ControllerBase
    {
        private QuanLyPhongTroContext _context = new QuanLyPhongTroContext();
        //public TblScreensController(QuanLyPhongTroContext context)
        //{
        //    _context = context;
        //}

        // GET: api/TblScreens
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblScreen>>> GetTblScreens()
        {
            return await _context.TblScreens.ToListAsync();
        }

        // GET: api/TblScreens/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblScreen>> GetTblScreen(string id)
        {
            var tblScreen = await _context.TblScreens.FindAsync(id);

            if (tblScreen == null)
            {
                return NotFound();
            }

            return tblScreen;
        }

        // PUT: api/TblScreens/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblScreen(string id, TblScreen tblScreen)
        {
            if (id != tblScreen.ScreenId)
            {
                return BadRequest();
            }

            _context.Entry(tblScreen).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TblScreenExists(id))
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

        // POST: api/TblScreens
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TblScreen>> PostTblScreen(TblScreen tblScreen)
        {
            _context.TblScreens.Add(tblScreen);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TblScreenExists(tblScreen.ScreenId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTblScreen", new { id = tblScreen.ScreenId }, tblScreen);
        }

        // DELETE: api/TblScreens/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTblScreen(string id)
        {
            var tblScreen = await _context.TblScreens.FindAsync(id);
            if (tblScreen == null)
            {
                return NotFound();
            }

            _context.TblScreens.Remove(tblScreen);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TblScreenExists(string id)
        {
            return _context.TblScreens.Any(e => e.ScreenId == id);
        }
    }
}
