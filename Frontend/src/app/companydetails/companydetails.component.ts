import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { CompanyserviceService } from '../companyservice.service';
import { Company } from '../Interfaces/company';
import { Country } from '../Interfaces/country';
import { State } from '../Interfaces/state';
import { City } from '../Interfaces/city';
import { Table, TableLazyLoadEvent } from 'primeng/table';
import { MessageService } from 'primeng/api';
import * as XLSX from 'xlsx';
import { first } from 'rxjs';

@Component({
  selector: 'app-companydetails',
  templateUrl: './companydetails.component.html',
  styleUrls: ['./companydetails.component.css'],
  providers: [MessageService]
})
export class CompanydetailsComponent implements OnInit {

  @ViewChild('demo') demoTable!: Table;

  value:string="sjd"
  total_record: number = 0;
  companys: Company[] = [];
  countrys: Country[] = [];
  selectedCountry: Country[] = [];
  selectedCountryIds: number[] = [];
  states: State[] = [];
  selectedState: State[] = [];
  citys: City[] = [];
  selectedCity: City[] = [];
  selectedStateIds: number[] = [];
  selectedCityIds: number[] = [];
  loading: boolean = false;
  animation: boolean = false;
  showwwww: boolean = false;
  fileName="Company Details.xlsx";
  sFiledValue: string[] | undefined;
  searchField: string[] | undefined;

  ExportData() {
    const event = {
        first: 0,
        rows: this.total_record,
        sortField: "companyid",
        sortOrder: true
    };

    this.companyService.lazyData2(event.first || 0, event.rows || 10, event.sortField, event.sortOrder, this.searchField, this.sFiledValue, this.selectedCountryIds, this.selectedStateIds, this.selectedCityIds)
        .subscribe(companies => {
            if (companies && companies.length > 0) {
                const jsonData = companies.map(company => {
                    return {
                      'Cmp Id': company.companyid,
                      'CompanyName': company.companyname,
                      'Shortname': company.companyshortname,
                      'Business Cont': company.contact,
                      'Address': company.address,
                      'Country': company.country,
                      'State': company.state,
                      'City': company.city,
                      'Zip code': company.zipcode,
                      'Active': company.active,
                      'Revenue': company.revenue
                    };
                });
                const ws: XLSX.WorkSheet = XLSX.utils.json_to_sheet(jsonData);
                const wb: XLSX.WorkBook = XLSX.utils.book_new();
                XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');
                XLSX.writeFile(wb, this.fileName);
                this.messageService.add({ severity: 'success', summary: 'Downloaded', detail: 'Company Details Downloaded Successfully' });
            } else {
                console.error('No companies found.');
            }
        });
  }

  

  showFilter(){
    this.showwwww = !this.showwwww;
  }

    erase(demo: Table) {
      this.messageService.add({ severity: 'info', summary: 'Clear', detail: 'Column Filter has been Cleared' });
    Object.keys(demo.filters).forEach(key => {
      const filter = demo.filters[key];
      if (Array.isArray(filter)) {
        filter.forEach((f: any) => f.value = null);
      } else {
        filter.value = null;
      }
    });

    

    const event: TableLazyLoadEvent = {
      first: 0,
      rows: 10
    };
  }

    reload(){
      this.messageService.add({ severity: 'success', summary: 'Reload', detail: 'Company Details Reloaded' });
    this.showwwww = false;
    // alert("wor")
    this.demoTable.reset();
  
  }

  PrintPage(){
    window.print();
  }

  constructor(
    private companyService: CompanyserviceService,
    private messageService: MessageService,
    private cdr: ChangeDetectorRef
  ) {}

  ngOnInit(): void {
    this.loadCompanies({
      first: 0,
      rows: 10,
      sortField: undefined,
      sortOrder: 1,
      filters: {},
      globalFilter: ''
    });
    this.loadCountry();
    this.loadState();
    this.loadCity();
  }


  
  loadCompanies(event : TableLazyLoadEvent): void {
    this.animation = true;

    const sortField: string | undefined = typeof event.sortField === 'string' ? event.sortField : undefined;
    const sortOrder: boolean = event.sortOrder === 1 ? true : false;

    let searchField: string[] = [];
    let sFiledValue: string[] = [];

    if (event.filters) {
      for (const key in event.filters) {
        if (event.filters.hasOwnProperty(key)) {
          const filterValue = event.filters[key];
          if (filterValue && ('value' in filterValue) && filterValue.value !== null) {
            searchField.push(key);
            sFiledValue.push(filterValue.value);
          }
        }
      }
    }

    

    this.companyService.lazyData2(event.first || 0, event.rows || 10, sortField, sortOrder, searchField, sFiledValue, this.selectedCountryIds, this.selectedStateIds, this.selectedCityIds)
      .subscribe(companies => {
        this.animation = false;
        if (companies && companies.length > 0) {
          this.companys = companies;
          this.total_record = companies[0].total_records;
        } else {
          console.error('No companies found.');
        }
      });
  }

  loadCountry(): void {
    this.companyService.getCountry().subscribe({
      next: (countrys) => {
        this.countrys = countrys;
        this.cdr.detectChanges(); 
      },
      error: (response) => {
        console.error(response);
      }
    });
  }

  loadState(): void {
    this.companyService.getState().subscribe({
      next: (states) => {
        this.states = states;
      },
      error: (response) => {
        console.error(response);
      }
    });
  }

  loadCity(): void {
    this.companyService.getCity().subscribe({
      next: (citys) => {
        this.citys = citys;
      },
      error: (response) => {
        console.error(response);
      }
    });
  }

  onCountryChange(event: Country[]): void {
    if(event){
      const selectedCountryIds: number[] = [];
      this.selectedCountryIds=[];
      this.selectedStateIds=[];
      event.forEach(country => {
        selectedCountryIds.push(country.cid);
      });
      if(selectedCountryIds.length==0){
        this.loadCity();
        this.loadState();
      }
      if (selectedCountryIds.length > 0) {
        this.getStatesByIds(selectedCountryIds);
        this.getCitybyCountryIds(selectedCountryIds);
      }
    }
  }

  getStatesByIds(selectedCountryIds: number[]): void {
    this.companyService.getStatesByIds(selectedCountryIds)
      .subscribe(states => {
        this.states = states;
      });
  }

  getCitybyCountryIds(selectedCountryIds: number[]): void {
    this.companyService.getCitybyCountryIds(selectedCountryIds)
      .subscribe(citys => {
        this.citys = citys;
      });
  }

  onStateChange(event: State[]): void {
    if(event){
      const selectedStateIds: number[] = [];
      event.forEach(states => {
        selectedStateIds.push(states.sid);
      });
      if(selectedStateIds.length==0){
        this.loadCity();
      }
      this.selectedStateIds=[];
      this.selectedCity = [];
      this.selectedCityIds = [];
      if (selectedStateIds.length > 0) {
        this.getCityBystateIds(selectedStateIds);  
      }
    }
  }

  onCityChange(event: State[]): void {
    if(event){
      this.selectedCityIds=[];
    }
  }

  getCityBystateIds(selectedCountryIds: number[]): void {
    this.companyService.getCityBystateIds(selectedCountryIds)
      .subscribe(citys => {
        this.citys = citys;
      });

    this.selectedCityIds=[];
  }

  onSubmit() {
    this.selectedCity.map(city => this.selectedCityIds.push(city.cityid));
    this.selectedState.map(state => this.selectedStateIds.push(state.sid));
    this.selectedCountry.map(country => this.selectedCountryIds.push(country.cid));
    if(this.selectedCity.length==0 && this.selectedState.length==0 && this.selectedCountry.length==0){
      this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Please select at least one filter before submitting.' });
    }

    if(this.selectedCityIds.length ==0 && this.selectedCountryIds.length ==0 && this.selectedStateIds.length ==0) {
      const event: TableLazyLoadEvent = {
        first: 0,
        rows: 10,
        sortField: undefined, 
        sortOrder: null,
      };

      this.animation = true;
      setTimeout(() => {
        this.loadCompanies(event);
        this.animation = false;
      }, 500);

    }
    else{
      const event: TableLazyLoadEvent = {
        first: 0,
        rows: 10,
        sortField: undefined, 
        sortOrder: 1, 
      };
    
      this.loadCompanies(event);
    }
  }

  clearForm(form: any): void {
    form.resetForm();
    this.selectedCityIds = [];
    this.selectedCountryIds = [];
    this.selectedStateIds = [];
    this.selectedCountry = [];
    this.selectedCity=[];
    this.selectedState = [];

    this.loadCountry();
    this.loadState();
    this.loadCity();

    this.demoTable.reset();

    this.showwwww = false;
    this.messageService.add({ severity: 'warn', summary: 'Warn', detail: 'Filters cleared successfully.' });
  }

}