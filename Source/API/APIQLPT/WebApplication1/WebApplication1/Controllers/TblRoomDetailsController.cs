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
    public class TblRoomDetailsController : ControllerBase
    {
        private QuanLyPhongTroContext _context = new QuanLyPhongTroContext();

        //public TblRoomDetailsController(QuanLyPhongTroContext context)
        //{
        //    _context = context;
        //}

        // GET: api/TblRoomDetails
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblRoomDetail>>> GetTblRoomDetails()
        {
            return await _context.TblRoomDetails.ToListAsync();
        }

        // GET: api/TblRoomDetails/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblRoomDetail>> GetTblRoomDetail(string id)
        {
            var tblRoomDetail = await _context.TblRoomDetails.FindAsync(id);

            if (tblRoomDetail == null)
            {
                return NotFound();
            }

            return tblRoomDetail;
        }

        // PUT: api/TblRoomDetails/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblRoomDetail(string id, TblRoomDetail tblRoomDetail)
        {
            if (id != tblRoomDetail.RoomId)
            {
                return BadRequest();
            }

            _context.Entry(tblRoomDetail).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TblRoomDetailExists(id))
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

        // POST: api/TblRoomDetails
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TblRoomDetail>> PostTblRoomDetail(TblRoomDetail tblRoomDetail)
        {
            _context.TblRoomDetails.Add(tblRoomDetail);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TblRoomDetailExists(tblRoomDetail.RoomId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTblRoomDetail", new { id = tblRoomDetail.RoomId }, tblRoomDetail);
        }

        // DELETE: api/TblRoomDetails/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTblRoomDetail(string id)
        {
            var tblRoomDetail = await _context.TblRoomDetails.FindAsync(id);
            if (tblRoomDetail == null)
            {
                return NotFound();
            }

            _context.TblRoomDetails.Remove(tblRoomDetail);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TblRoomDetailExists(string id)
        {
            return _context.TblRoomDetails.Any(e => e.RoomId == id);
        }
    }
}
