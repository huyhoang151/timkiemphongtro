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
    public class TblAuthenticationsController : ControllerBase
    {
        private QuanLyPhongTroContext _context = new QuanLyPhongTroContext();
        //public TblAuthenticationsController(QuanLyPhongTroContext context)
        //{
        //    _context = context;
        //}

        // GET: api/TblAuthentications
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblAuthentication>>> GetTblAuthentications()
        {
            return await _context.TblAuthentications.ToListAsync();
        }

        // GET: api/TblAuthentications/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblAuthentication>> GetTblAuthentication(string id)
        {
            var tblAuthentication = await _context.TblAuthentications.FindAsync(id);

            if (tblAuthentication == null)
            {
                return NotFound();
            }

            return tblAuthentication;
        }

        // PUT: api/TblAuthentications/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblAuthentication(string id, TblAuthentication tblAuthentication)
        {
            if (id != tblAuthentication.UserTypeId)
            {
                return BadRequest();
            }

            _context.Entry(tblAuthentication).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TblAuthenticationExists(id))
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

        // POST: api/TblAuthentications
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TblAuthentication>> PostTblAuthentication(TblAuthentication tblAuthentication)
        {
            _context.TblAuthentications.Add(tblAuthentication);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TblAuthenticationExists(tblAuthentication.UserTypeId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTblAuthentication", new { id = tblAuthentication.UserTypeId }, tblAuthentication);
        }

        // DELETE: api/TblAuthentications/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTblAuthentication(string id)
        {
            var tblAuthentication = await _context.TblAuthentications.FindAsync(id);
            if (tblAuthentication == null)
            {
                return NotFound();
            }

            _context.TblAuthentications.Remove(tblAuthentication);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TblAuthenticationExists(string id)
        {
            return _context.TblAuthentications.Any(e => e.UserTypeId == id);
        }
    }
}
