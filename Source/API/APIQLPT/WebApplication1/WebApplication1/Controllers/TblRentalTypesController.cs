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
    public class TblRentalTypesController : ControllerBase
    {
        private QuanLyPhongTroContext _context = new QuanLyPhongTroContext();
        //public TblRentalTypesController(QuanLyPhongTroContext context)
        //{
        //    _context = context;
        //}

        // GET: api/TblRentalTypes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblRentalType>>> GetTblRentalTypes()
        {
            return await _context.TblRentalTypes.ToListAsync();
        }

        // GET: api/TblRentalTypes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblRentalType>> GetTblRentalType(string id)
        {
            var tblRentalType = await _context.TblRentalTypes.FindAsync(id);

            if (tblRentalType == null)
            {
                return NotFound();
            }

            return tblRentalType;
        }

        // PUT: api/TblRentalTypes/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblRentalType(string id, TblRentalType tblRentalType)
        {
            if (id != tblRentalType.RentalTypeId)
            {
                return BadRequest();
            }

            _context.Entry(tblRentalType).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TblRentalTypeExists(id))
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

        // POST: api/TblRentalTypes
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TblRentalType>> PostTblRentalType(TblRentalType tblRentalType)
        {
            _context.TblRentalTypes.Add(tblRentalType);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TblRentalTypeExists(tblRentalType.RentalTypeId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTblRentalType", new { id = tblRentalType.RentalTypeId }, tblRentalType);
        }

        // DELETE: api/TblRentalTypes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTblRentalType(string id)
        {
            var tblRentalType = await _context.TblRentalTypes.FindAsync(id);
            if (tblRentalType == null)
            {
                return NotFound();
            }

            _context.TblRentalTypes.Remove(tblRentalType);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TblRentalTypeExists(string id)
        {
            return _context.TblRentalTypes.Any(e => e.RentalTypeId == id);
        }
    }
}
