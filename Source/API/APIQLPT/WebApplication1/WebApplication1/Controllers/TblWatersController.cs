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
    public class TblWatersController : ControllerBase
    {
        private QuanLyPhongTroContext _context = new QuanLyPhongTroContext();

        //public TblWatersController(QuanLyPhongTroContext context)
        //{
        //    _context = context;
        //}

        // GET: api/TblWaters
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblWater>>> GetTblWaters()
        {
            return await _context.TblWaters.ToListAsync();
        }

        // GET: api/TblWaters/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblWater>> GetTblWater(string id)
        {
            var tblWater = await _context.TblWaters.FindAsync(id);

            if (tblWater == null)
            {
                return NotFound();
            }

            return tblWater;
        }

        // PUT: api/TblWaters/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblWater(string id, TblWater tblWater)
        {
            if (id != tblWater.RoomId)
            {
                return BadRequest();
            }

            _context.Entry(tblWater).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TblWaterExists(id))
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

        // POST: api/TblWaters
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TblWater>> PostTblWater(TblWater tblWater)
        {
            _context.TblWaters.Add(tblWater);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TblWaterExists(tblWater.RoomId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTblWater", new { id = tblWater.RoomId }, tblWater);
        }

        // DELETE: api/TblWaters/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTblWater(string id)
        {
            var tblWater = await _context.TblWaters.FindAsync(id);
            if (tblWater == null)
            {
                return NotFound();
            }

            _context.TblWaters.Remove(tblWater);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TblWaterExists(string id)
        {
            return _context.TblWaters.Any(e => e.RoomId == id);
        }
    }
}
