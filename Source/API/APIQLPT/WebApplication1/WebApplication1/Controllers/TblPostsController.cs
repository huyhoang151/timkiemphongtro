using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TblPostsController : ControllerBase
    {
        private QuanLyPhongTroContext _context = new QuanLyPhongTroContext();
        //public TblPostsController(QuanLyPhongTroContext context)
        //{
        //    _context = context;
        //}

        // GET: api/TblPosts
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblPost>>> GetTblPosts()
        {
            return await _context.TblPosts.ToListAsync();
        }

        // GET: api/TblPosts/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblPost>> GetTblPost(int id)
        {
            var tblPost = await _context.TblPosts.FindAsync(id);

            if (tblPost == null)
            {
                return NotFound();
            }

            return tblPost;
        }

        [HttpGet("GetPostByUserName/{userName}")]
        public async Task<ActionResult<TblPost>> getPostByUserName(string userName)
        {
            var tblPost = await (_context.TblPosts.Where(t => t.UserName.Contains(userName)).ToListAsync());

            if (tblPost == null)
            {
                return NotFound();
            }
            return Ok(tblPost);
        }

        [HttpGet("GetPostByRentalTypeID/{rtId}")]
        public async Task<ActionResult<TblPost>> GetNewByRentalTypeID(string rtId)
        {
            var tblPost = await (_context.TblPosts.Where(t => t.RentalTypeId == rtId && t.Status == true).ToListAsync());

            if (tblPost == null)
            {
                return NotFound();
            }

            return Ok(tblPost);
        }

        [HttpGet("SortDescByStartDay")]
        public async Task<ActionResult<TblPost>> SortDescByStartDay()
        {
            var tblPost = await (_context.TblPosts.OrderByDescending(t => t.StartDay).Where(t => t.Status == true).ToListAsync());

            if (tblPost == null)
            {
                return NotFound();
            }
            return Ok(tblPost);
        }

        [HttpGet("filterVideoNotNull")]
        public async Task<ActionResult<TblPost>> filterVideoNotNull()
        {
            var tblPost = await (_context.TblPosts.Where(t => t.Video != null && t.Status == true).ToListAsync());

            if (tblPost == null)
            {
                return NotFound();
            }
            return Ok(tblPost);
        }

        [HttpGet("GetPostidbyUsernameAndStartday/{username}/{startday}")]
        public async Task<ActionResult<TblPost>> GetPostiBbyUsernameAndStartday(string username, DateTime startday)
        {
            //var tblPost = await (from s in _context.TblPosts
            //         where s.UserName == username && s.StartDay == startday
            //         select s.PostId).ToListAsync();

            //DateTime date = DateTime.ParseExact(startday, "yyyy-MM-dd HH:mm:ss.fff", CultureInfo.InvariantCulture);
            var tblPost = await _context.TblPosts.Where(
                t => t.UserName == username && t.StartDay == startday).ToListAsync();

            if (tblPost == null)
            {
                return NotFound();
            }

            return Ok(tblPost);
        }
        [HttpGet("Getpostbystatus/{status}")]
        public async Task<ActionResult<TblPost>> GetUpdateStatus(bool status)
        {
            var tblPost = await _context.TblPosts.Where(p => p.Status == status).ToListAsync();

            if (tblPost == null)
            {
                return NotFound();
            }

            return Ok(tblPost);
        }

        [HttpGet("GetPostByAddress/{address}")]
        public async Task<ActionResult<TblPost>> GetPostByAddress(string address)
        {
            var tblpost = await (_context.TblPosts.Where(t => t.Address.Contains(address)).ToListAsync());

            if (tblpost == null)
            {
                return NotFound();
            }
            return Ok(tblpost);
        }

        [HttpPut("UpdateStatus/{id}")]
        public async Task<IActionResult> UpdateStatusAsync(int id)
        {
            //return (IActionResult)_context.TblPosts.FromSqlRaw<TblPost>("exec updateStatus {0}", id).ToListAsync();

            string storeProc = "EXEC updateStatus @id=" + id;
            return (IActionResult)await _context.TblPosts.FromSqlRaw(storeProc).ToListAsync();
        }

        // PUT: api/TblPosts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblPost(int id, TblPost tblPost)
        {
            if (id != tblPost.PostId)
            {
                return BadRequest();
            }

            _context.Entry(tblPost).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TblPostExists(id))
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

        // POST: api/TblPosts
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TblPost>> PostTblPost(TblPost tblPost)
        {
            _context.TblPosts.Add(tblPost);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTblPost", new { id = tblPost.PostId }, tblPost);
        }

        // DELETE: api/TblPosts/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTblPost(int id)
        {
            var tblPost = await _context.TblPosts.FindAsync(id);
            if (tblPost == null)
            {
                return NotFound();
            }

            _context.TblPosts.Remove(tblPost);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TblPostExists(int id)
        {
            return _context.TblPosts.Any(e => e.PostId == id);
        }
    }
}
