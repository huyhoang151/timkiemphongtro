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
    public class TblRoomTypesController : ControllerBase
    {
        private QuanLyPhongTroContext _context = new QuanLyPhongTroContext();

        //public TblRoomTypesController(QuanLyPhongTroContext context)
        //{
        //    _context = context;
        //}

        // GET: api/TblRoomTypes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblRoomType>>> GetTblRoomTypes()
        {
            return await _context.TblRoomTypes.ToListAsync();
        }

        // GET: api/TblRoomTypes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblRoomType>> GetTblRoomType(string id)
        {
            var tblRoomType = await _context.TblRoomTypes.FindAsync(id);

            if (tblRoomType == null)
            {
                return NotFound();
            }

            return tblRoomType;
        }

        // PUT: api/TblRoomTypes/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblRoomType(string id, TblRoomType tblRoomType)
        {
            if (id != tblRoomType.RoomTypeId)
            {
                return BadRequest();
            }

            _context.Entry(tblRoomType).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TblRoomTypeExists(id))
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

        // POST: api/TblRoomTypes
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TblRoomType>> PostTblRoomType(TblRoomType tblRoomType)
        {
            _context.TblRoomTypes.Add(tblRoomType);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TblRoomTypeExists(tblRoomType.RoomTypeId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTblRoomType", new { id = tblRoomType.RoomTypeId }, tblRoomType);
        }

        // DELETE: api/TblRoomTypes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTblRoomType(string id)
        {
            var tblRoomType = await _context.TblRoomTypes.FindAsync(id);
            if (tblRoomType == null)
            {
                return NotFound();
            }

            _context.TblRoomTypes.Remove(tblRoomType);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TblRoomTypeExists(string id)
        {
            return _context.TblRoomTypes.Any(e => e.RoomTypeId == id);
        }
    }
}
