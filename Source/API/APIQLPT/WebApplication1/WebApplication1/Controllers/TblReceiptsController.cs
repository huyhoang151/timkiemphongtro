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
    public class TblReceiptsController : ControllerBase
    {
        private QuanLyPhongTroContext _context = new QuanLyPhongTroContext();
        //public TblReceiptsController(QuanLyPhongTroContext context)
        //{
        //    _context = context;
        //}

        // GET: api/TblReceipts
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblReceipt>>> GetTblReceipts()
        {
            return await _context.TblReceipts.ToListAsync();
        }

        // GET: api/TblReceipts/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblReceipt>> GetTblReceipt(string id)
        {
            var tblReceipt = await _context.TblReceipts.FindAsync(id);

            if (tblReceipt == null)
            {
                return NotFound();
            }

            return tblReceipt;
        }

        // PUT: api/TblReceipts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblReceipt(string id, TblReceipt tblReceipt)
        {
            if (id != tblReceipt.RoomId)
            {
                return BadRequest();
            }

            _context.Entry(tblReceipt).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TblReceiptExists(id))
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

        // POST: api/TblReceipts
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TblReceipt>> PostTblReceipt(TblReceipt tblReceipt)
        {
            _context.TblReceipts.Add(tblReceipt);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TblReceiptExists(tblReceipt.RoomId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTblReceipt", new { id = tblReceipt.RoomId }, tblReceipt);
        }

        // DELETE: api/TblReceipts/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTblReceipt(string id)
        {
            var tblReceipt = await _context.TblReceipts.FindAsync(id);
            if (tblReceipt == null)
            {
                return NotFound();
            }

            _context.TblReceipts.Remove(tblReceipt);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TblReceiptExists(string id)
        {
            return _context.TblReceipts.Any(e => e.RoomId == id);
        }
    }
}
