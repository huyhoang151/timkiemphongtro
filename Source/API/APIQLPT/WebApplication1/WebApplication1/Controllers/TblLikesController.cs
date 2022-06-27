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
    public class TblLikesController : ControllerBase
    {
        private QuanLyPhongTroContext _context = new QuanLyPhongTroContext();
        //public TblLikesController(QuanLyPhongTroContext context)
        //{
        //    _context = context;
        //}

        // GET: api/TblLikes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblLike>>> GetTblLikes()
        {
            return await _context.TblLikes.ToListAsync();
        }

        // GET: api/TblLikes/5
        [HttpGet("{id}/{username}")]
        public async Task<ActionResult<TblLike>> GetTblLike(int id, string username)
        {
            var tblLike = await _context.TblLikes.Where(l => l.PostId == id && l.UserName == username).FirstAsync();

            if (tblLike == null)
            {
                return NotFound();
            }

            return tblLike;
        }

        [HttpGet("GetPostidByUsername/{userName}")]
        public async Task<ActionResult<TblLike>> getPostByUserName(string userName)
        {
            var tblLike = await (_context.TblLikes.Where(t => t.UserName.Contains(userName)).ToListAsync());

            if (tblLike == null)
            {
                return NotFound();
            }
            return Ok(tblLike);
        }

        [HttpGet("GetLikeByUsername/{userName}")]
        public async Task<ActionResult<TblLike>> GetLikeByUsername(string userName)
        {
            var tblLike = await (_context.TblLikes.Where(t => t.UserName == userName).ToListAsync());

            if (tblLike == null)
            {
                return NotFound();
            }
            return Ok(tblLike);
        }

        // PUT: api/TblLikes/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblLike(int id, TblLike tblLike)
        {
            if (id != tblLike.PostId)
            {
                return BadRequest();
            }

            _context.Entry(tblLike).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TblLikeExists(id))
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

        // POST: api/TblLikes
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TblLike>> PostTblLike(TblLike tblLike)
        {
            _context.TblLikes.Add(tblLike);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TblLikeExists(tblLike.PostId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTblLike", new { id = tblLike.PostId }, tblLike);
        }

        // DELETE: api/TblLikes/5
        [HttpDelete("{id}/{username}")]
        public async Task<IActionResult> DeleteTblLike(int id, string username)
        {
            var tblLike = await _context.TblLikes.Where(l => l.PostId == id && l.UserName == username).FirstAsync();
            if (tblLike == null)
            {
                return NotFound();
            }

            _context.TblLikes.Remove(tblLike);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TblLikeExists(int id)
        {
            return _context.TblLikes.Any(e => e.PostId == id);
        }
    }
}
