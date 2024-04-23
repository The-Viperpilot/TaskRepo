using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backend.Contract;
using Backend.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.OpenApi.Any;

namespace Backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CompanydetailsController : ControllerBase
    {
        private readonly ICompanydetailsRepository  _companydetailsRepositry;

        public CompanydetailsController (ICompanydetailsRepository companydetailsRepository){
            _companydetailsRepositry = companydetailsRepository;
        }


       




        [HttpGet("statebcountry")]
        public async Task<IActionResult> GetStatesByCountries([FromQuery] int[] ids)
        {
            try{
            var filteredStates = await _companydetailsRepositry.GetStatesByCountries(ids);
            return Ok(filteredStates);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
                throw;
            }
        }

        [HttpGet("citybcountry")]
        public async Task<IActionResult> GetCitysByCountries([FromQuery] int[] ids)
        {
            try{
            var filteredStates = await _companydetailsRepositry.GetCitysByCountries(ids);
            return Ok(filteredStates);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
                throw;
            }
        }

        [HttpGet("citybstate")]
        public async Task<IActionResult> GetCityByState([FromQuery] int[] ids)
        {
            try{
            var filteredStates = await _companydetailsRepositry.GetCityByState(ids);
            return Ok(filteredStates);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
                throw;
            }
        }






        [HttpGet("country")]
        public IActionResult GetCountry(){
            try{
                var countrydetail = _companydetailsRepositry.GetCountry();
                return Ok(countrydetail);
            }
            catch(Exception ex){
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet("state")]
        public IActionResult GetState(){
            try{
                var statedetails = _companydetailsRepositry.GetState();
                return Ok(statedetails);
            }
            catch(Exception ex){
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet("city")]
        public IActionResult GetCity(){
            try{
                var citydetails =  _companydetailsRepositry.GetCity();
                return Ok(citydetails);
            }
            catch(Exception ex){
                return StatusCode(500, ex.Message);
            }
        }


        

         [HttpGet("Lazy2")]
        public async Task<IActionResult> LazyData2(
            [FromQuery] int skip,
            [FromQuery] int take,
            [FromQuery] string? orderby,
            [FromQuery] bool isAsc,
            [FromQuery] string[]? searchField,
            [FromQuery] string[]? sFieldValue,
            [FromQuery] int[]? countries,
            [FromQuery] int[]? states,
            [FromQuery] int[]? cities)
        {
            try
            {
                
                var data = await _companydetailsRepositry.LazyData2(
                    skip,
                    take,
                    orderby,
                    isAsc,
                    searchField,
                    sFieldValue,
                    countries,
                    states,
                    cities);

                return Ok(data);
            }
            catch (Exception ex)
            {
                
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }





  


    [HttpPost("insert")]

      public async Task<IActionResult> AddCompany(Companydetails companydetails){
        try{
            var insert = await _companydetailsRepositry.AddCompany(companydetails);
            return Ok(insert);
        }
        catch(Exception ex){
            return StatusCode(500, ex.Message);
        }
      }


        
        
    }
}