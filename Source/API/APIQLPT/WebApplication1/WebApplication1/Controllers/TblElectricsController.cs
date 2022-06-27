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
    public class TblElectricsController : ControllerBase
    {
        private QuanLyPhongTroContext _context = new QuanLyPhongTroContext();
        //public TblElectricsController(QuanLyPhongTroContext context)
        //{
        //    _context = context;
        //}

        // GET: api/TblElectrics
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblElectric>>> GetTblElectrics()
        {
            return await _context.TblElectrics.ToListAsync();
        }

        // GET: api/TblElectrics/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblElectric>> GetTblElectric(string id)
        {
            var tblElectric = await _context.TblElectrics.FindAsync(id);

            if (tblElectric == null)
            {
                return NotFound();
            }

            return tblElectric;
        }

        // PUT: api/TblElectrics/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblElectric(string id, TblElectric tblElectric)
        {
            if (id != tblElectric.RoomId)
            {
                return BadRequest();
            }

            _context.Entry(tblElectric).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TblElectricExists(id))
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

        // POST: api/TblElectrics
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TblElectric>> PostTblElectric(TblElectric tblElectric)
        {
            _context.TblElectrics.Add(tblElectric);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TblElectricExists(tblElectric.RoomId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTblElectric", new { id = tblElectric.RoomId }, tblElectric);
        }

        // DELETE: api/TblElectrics/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTblElectric(string id)
        {
            var tblElectric = await _context.TblElectrics.FindAsync(id);
            if (tblElectric == null)
            {
                return NotFound();
            }

            _context.TblElectrics.Remove(tblElectric);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TblElectricExists(string id)
        {
            return _context.TblElectrics.Any(e => e.RoomId == id);
        }
    }
}
