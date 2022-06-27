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
    public class TblUsersController : ControllerBase
    {
        private QuanLyPhongTroContext _context = new QuanLyPhongTroContext();
        //public TblUsersController(QuanLyPhongTroContext context)
        //{
        //    _context = context;
        //}

        // GET: api/TblUsers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblUser>>> GetTblUsers()
        {
            return await _context.TblUsers.ToListAsync();
        }

        // GET: api/TblUsers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblUser>> GetTblUser(string id)
        {
            var tblUser = await _context.TblUsers.FindAsync(id);

            if (tblUser == null)
            {
                return NotFound();
            }

            return tblUser;
        }

        [HttpGet("GetUserNameByPhone/{phone}")]
        public async Task<IActionResult> GetUsernameByPhone(string phone)
        {
            var tblUser = await (_context.TblUsers.Where(t => t.Phone == phone).ToListAsync());

            if (tblUser == null)
            {
                return NotFound();
            }

            return Ok(tblUser);
        }

        [HttpGet("GetUserByMail/{mail}")]
        public async Task<ActionResult<TblUser>> GetUserByMail(string mail)
        {
            var tblUser = await (_context.TblUsers.Where(u => u.Email==mail).ToListAsync());

            if (tblUser == null)
            {
                return NotFound();
            }
            return Ok(tblUser);
        }

        // PUT: api/TblUsers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblUser(string id, TblUser tblUser)
        {
            if (id != tblUser.UserName)
            {
                return BadRequest();
            }

            _context.Entry(tblUser).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TblUserExists(id))
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

        [HttpPut("UpdatePassword/{username}/{pass}")]
        public async Task<IActionResult> UpdateStatusAsync(string username, string pass)
        {
            //return (IActionResult)_context.TblPosts.FromSqlRaw<TblPost>("exec updateStatus {0}", id).ToListAsync();

            string storeProc = "EXEC doimk @username='" + username + "'" + "," + "@newpass='" + pass + "'";
            return (IActionResult)await _context.TblPosts.FromSqlRaw(storeProc).ToListAsync();
        }

        // POST: api/TblUsers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TblUser>> PostTblUser(TblUser tblUser)
        {
            _context.TblUsers.Add(tblUser);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TblUserExists(tblUser.UserName))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTblUser", new { id = tblUser.UserName }, tblUser);
        }

        // DELETE: api/TblUsers/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTblUser(string id)
        {
            var tblUser = await _context.TblUsers.FindAsync(id);
            if (tblUser == null)
            {
                return NotFound();
            }

            _context.TblUsers.Remove(tblUser);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TblUserExists(string id)
        {
            return _context.TblUsers.Any(e => e.UserName == id);
        }
    }
}
