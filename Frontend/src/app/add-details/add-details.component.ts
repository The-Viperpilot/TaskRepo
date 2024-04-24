import { Component, OnInit } from '@angular/core';
import { CompanyserviceService } from '../companyservice.service';
import { Router } from '@angular/router';
import { City } from '../Interfaces/city';
import { State } from '../Interfaces/state';
import { Country } from '../Interfaces/country';
import { Validators, FormBuilder, FormGroup } from '@angular/forms';
import { ConfirmationService, MessageService, ConfirmEventType } from 'primeng/api';

@Component({
  selector: 'app-add-details',
  templateUrl: './add-details.component.html',
  styleUrls: ['./add-details.component.css'],
  providers: [MessageService,ConfirmationService]  
})
export class AddDetailsComponent implements OnInit {
  isActive: boolean = false;
  submit = false;
  myForm!: FormGroup;
  citys: City[] = [];
  states: State[] = [];
  countrys: Country[] = [];
  
  

  constructor(
    private companyService: CompanyserviceService,
    private formBuilder: FormBuilder,
    private router: Router,
    private messageService: MessageService,
    private confirmationService: ConfirmationService
  ) {}


  routeToList(){
    if(this.myForm.invalid){
      this.insert();
    }else{
      this.insert();
      this.router.navigate(['companylist']);
    }
  }
  resetForm() {
    console.log("swdasdas");
    this.messageService.add({ severity: 'info', summary: 'New Company', detail: 'To add a new detail, the form has been cleared.' });
    this.myForm.reset();
    this.ngOnInit();
    setTimeout(() => {
      if (this.myForm.invalid) {
        for (const control of Object.keys(this.myForm.controls)) {
          this.myForm.controls[control].markAsUntouched();
        }
      }
    });
  }
  SubmitAndReset(){
    if(this.myForm.valid){
      this.insert();
      this.resetForm();
    }else{
      this.messageService.add({ 
        severity: 'error', 
        summary: 'Error', 
        detail: 'Please enter a valid value.' 
      });
    }
    
    
    
  }
  onCountryChange(event: any) {
    const selectedCountryid: number[] = [];
    if (event) {
      selectedCountryid.push(event.value);
      this.getCitybyCountryIds(selectedCountryid);
      this.getStatesByIds(selectedCountryid);
    }
  }

  onStateChange(event: any) {
    const selectedStateid: number[] = [];
    if (event) {
      selectedStateid.push(event.value);
      this.getCityBystateIds(selectedStateid);
    }
  }

  Addnew(event: Event) {
    if(this.myForm.touched){
      this.confirmationService.confirm({
        target: event.target as EventTarget,
        message: 'You have unsaved changes in the screen. Do you want to continue?',
        header: 'Confirmation',
        icon: 'pi pi-exclamation-triangle',
        acceptIcon:"none",
        rejectIcon:"none",
        rejectButtonStyleClass:"p-button-text",
        accept: () => {
            this.resetForm();
        },
        reject: () => {
            
        }
    });
    }else{
      this.resetForm();
    }
    
}
BackToList(event: Event) {
  if(this.myForm.touched){
    this.confirmationService.confirm({
      target: event.target as EventTarget,
      message: 'You have unsaved changes in the screen. Do you want to continue?',
      header: 'Confirmation',
      icon: 'pi pi-exclamation-triangle',
      acceptIcon:"none",
      rejectIcon:"none",
      rejectButtonStyleClass:"p-button-text",
      accept: () => {
        this.router.navigate(['companylist']);
      },
      reject: () => {
          
      }
  });
  }else{
    this.router.navigate(['companylist']);
  }
  
}

  ngOnInit(): void {
    this.initializeForm();
    this.loadCountry();
    this.loadState();
    this.loadCity();
  }

  initializeForm(): void {
    this.myForm = this.formBuilder.group({
      companyname: ['',[Validators.required,Validators.minLength(1),Validators.maxLength(20),Validators.pattern('[a-zA-Z0-9\\- ]*')]],
      companyshortname: ['',[Validators.maxLength(10), Validators.pattern('[a-zA-Z0-9\\- ]*')]],
      contact: ['', [Validators.required, Validators.pattern('[0-9]*'), Validators.maxLength(10)]],
      active: [''],
      cid: ['', Validators.required],
      sid: ['', Validators.required],
      cityid: ['', Validators.required],
      country:[''],
      state:[''],
      city:[''],
      revenue: ['', [Validators.required, Validators.pattern('^[0-9]+(\.[0-9]{1,2})?$'), Validators.maxLength(12)]],
      address: [''],
      email: ['', [Validators.required,Validators.minLength(5),Validators.maxLength(250),Validators.email ]],
      zipcode: ['', [Validators.required,Validators.pattern('[0-9]*'),Validators.maxLength(5),Validators.minLength(5)]],
    });
  }

  loadCountry(): void {
    this.companyService.getCountry().subscribe({
      next: (countrys) => {
        this.countrys = countrys;
      },
      error: (response) => {
        console.error(response);
      },
    });
  }

  loadState(): void {
    this.companyService.getState().subscribe({
      next: (states) => {
        this.states = states;
      },
      error: (response) => {
        console.error(response);
      },
    });
  }

  loadCity(): void {
    this.companyService.getCity().subscribe({
      next: (citys) => {
        this.citys = citys;
      },
      error: (response) => {
        console.error(response);
      },
    });
  }

  insert(): void {
    
    if(this.myForm.invalid){
      for (const control of Object.keys(this.myForm.controls)){
        this.myForm.controls[control].markAsTouched();
      }
      this.messageService.add({ 
        severity: 'error', 
        summary: 'Error', 
        detail: 'Please enter a valid value.' 
      });
    }else{
      this.messageService.add({ severity: 'success', summary: 'Success', detail: 'Company details submitted successfully!' });
      this.myForm.get('active')?.setValue(this.myForm.value.active ? 'yes' : 'no');
     
      if (this.myForm.valid) {
        this.companyService.insertCompany(this.myForm.value).subscribe({
          next: (company) => {
            console.log(company);
          },
          error: (response) => {
            console.log(response);
          },
        });
        
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

  getCityBystateIds(selectedCountryIds: number[]): void {
    this.companyService.getCityBystateIds(selectedCountryIds)
      .subscribe(citys => {
        this.citys = citys;
      });
  }

}
