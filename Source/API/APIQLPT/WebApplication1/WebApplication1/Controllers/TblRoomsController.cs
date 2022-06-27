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
    public class TblRoomsController : ControllerBase
    {
        private QuanLyPhongTroContext _context = new QuanLyPhongTroContext();
        //public TblRoomsController(QuanLyPhongTroContext context)
        //{
        //    _context = context;
        //}

        // GET: api/TblRooms
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblRoom>>> GetTblRooms()
        {
            return await _context.TblRooms.ToListAsync();
        }

        // GET: api/TblRooms/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblRoom>> GetTblRoom(string id)
        {
            var tblRoom = await _context.TblRooms.FindAsync(id);

            if (tblRoom == null)
            {
                return NotFound();
            }

            return tblRoom;
        }

        // PUT: api/TblRooms/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblRoom(string id, TblRoom tblRoom)
        {
            if (id != tblRoom.RoomId)
            {
                return BadRequest();
            }

            _context.Entry(tblRoom).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TblRoomExists(id))
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

        // POST: api/TblRooms
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TblRoom>> PostTblRoom(TblRoom tblRoom)
        {
            _context.TblRooms.Add(tblRoom);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TblRoomExists(tblRoom.RoomId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTblRoom", new { id = tblRoom.RoomId }, tblRoom);
        }

        // DELETE: api/TblRooms/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTblRoom(string id)
        {
            var tblRoom = await _context.TblRooms.FindAsync(id);
            if (tblRoom == null)
            {
                return NotFound();
            }

            _context.TblRooms.Remove(tblRoom);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TblRoomExists(string id)
        {
            return _context.TblRooms.Any(e => e.RoomId == id);
        }
    }
}
