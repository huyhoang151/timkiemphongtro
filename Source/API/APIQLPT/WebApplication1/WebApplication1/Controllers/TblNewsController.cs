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
    public class TblNewsController : ControllerBase
    {
        private QuanLyPhongTroContext _context = new QuanLyPhongTroContext();
        //public TblNewsController(QuanLyPhongTroContext context)
        //{
        //    _context = context;
        //}

        // GET: api/TblNews
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblNew>>> GetTblNews()
        {
            return await _context.TblNews.ToListAsync();
        }

        // GET: api/TblNews/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblNew>> GetTblNew(int id)
        {
            var tblNew = await _context.TblNews.FindAsync(id);

            if (tblNew == null)
            {
                return NotFound();
            }

            return tblNew;
        }

        [HttpGet("GetNewByPostID/{ID}")]
        public async Task<ActionResult<TblNew>> GetNewByPostID(int ID)
        {
            var tblNew = await (_context.TblNews.Where(t => t.PostId == ID).ToListAsync());

            if (tblNew == null)
            {
                return NotFound();
            }

            return Ok(tblNew);
        }

        // PUT: api/TblNews/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblNew(int id, TblNew tblNew)
        {
            if (id != tblNew.NewsId)
            {
                return BadRequest();
            }

            _context.Entry(tblNew).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TblNewExists(id))
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

        // POST: api/TblNews
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TblNew>> PostTblNew(TblNew tblNew)
        {
            _context.TblNews.Add(tblNew);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTblNew", new { id = tblNew.NewsId }, tblNew);
        }

        // DELETE: api/TblNews/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTblNew(int id)
        {
            var tblNew = await _context.TblNews.FindAsync(id);
            if (tblNew == null)
            {
                return NotFound();
            }

            _context.TblNews.Remove(tblNew);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TblNewExists(int id)
        {
            return _context.TblNews.Any(e => e.NewsId == id);
        }
    }
}
