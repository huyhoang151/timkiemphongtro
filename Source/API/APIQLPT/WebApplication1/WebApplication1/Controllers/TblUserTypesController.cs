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
    public class TblUserTypesController : ControllerBase
    {
        private QuanLyPhongTroContext _context = new QuanLyPhongTroContext();
        //public TblUserTypesController(QuanLyPhongTroContext context)
        //{
        //    _context = context;
        //}

        // GET: api/TblUserTypes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblUserType>>> GetTblUserTypes()
        {
            return await _context.TblUserTypes.ToListAsync();
        }

        // GET: api/TblUserTypes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblUserType>> GetTblUserType(string id)
        {
            var tblUserType = await _context.TblUserTypes.FindAsync(id);

            if (tblUserType == null)
            {
                return NotFound();
            }

            return tblUserType;
        }

        // PUT: api/TblUserTypes/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblUserType(string id, TblUserType tblUserType)
        {
            if (id != tblUserType.UserTypeId)
            {
                return BadRequest();
            }

            _context.Entry(tblUserType).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TblUserTypeExists(id))
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

        // POST: api/TblUserTypes
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TblUserType>> PostTblUserType(TblUserType tblUserType)
        {
            _context.TblUserTypes.Add(tblUserType);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TblUserTypeExists(tblUserType.UserTypeId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTblUserType", new { id = tblUserType.UserTypeId }, tblUserType);
        }

        // DELETE: api/TblUserTypes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTblUserType(string id)
        {
            var tblUserType = await _context.TblUserTypes.FindAsync(id);
            if (tblUserType == null)
            {
                return NotFound();
            }

            _context.TblUserTypes.Remove(tblUserType);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TblUserTypeExists(string id)
        {
            return _context.TblUserTypes.Any(e => e.UserTypeId == id);
        }
    }
}
