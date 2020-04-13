import { LightningElement, track, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import fetchAccount from '@salesforce/apex/AccountController_LWC.fetchAccount';
import deleteRecord from '@salesforce/apex/AccountController_LWC.deleteRecord';
import saveRecord from '@salesforce/apex/AccountController_LWC.saveRecord';
export default class TestCmp extends LightningElement {
    @api recordId;
    @track accountList = [];
    @track boolVisible = false; 


    connectedCallback(){
        this.getAccount();
    }

    handleEdit(event){
        var i;
        for (i = 0; i < this.accountList.length; i++){
            this.accountList[i].isEdited=false;
        }
        var index=event.target.title;
        console.log(index);
        this.accountList[index].isEdited=true;
      
    }
    handleSave(event){
        var index=event.target.title;
        this.accountList[index].isEdited=false;
        const recordId = event.target.dataset.recordid;

        var person = {
            sobjectType: 'Account',
            Id : recordId,
            Name : this.template.querySelector("[data-id='Name']").value, 
            Phone : this.template.querySelector("[data-id='Phone']").value, 
            Website : this.template.querySelector("[data-id='Website']").value, 
            Description  :this.template.querySelector("[data-id='Description']").value
        };
        console.log(person);
        saveRecord({obj:person}).then(result=>{
            if(result != null){
                console.log(result);
                this.getAccount();
                
                const event = new ShowToastEvent({
                    variant: 'Success',
                    title: 'Edit Succesful',
                    message: 'Edit Completed',
                });
                this.dispatchEvent(event);
            }
            else{
                const event = new ShowToastEvent({
                    variant: 'error',
                    title: 'Edit Failed!',
                    message: 'Cannot Edit',
                });
                this.dispatchEvent(event);
            }
           
                

        });

    }

    handleDelete(event){
        const recordId = event.target.dataset.recordid;
        console.log('handleDelete' + recordId );
        console.log(typeof recordId );

          deleteRecord({PassId : recordId}).then(result => {
             console.log({result});
             this.check=result;
             if(this.check==true){
                this.getAccount();
                const event = new ShowToastEvent({
                    variant: 'Success',
                    title: 'Deletion Succesful',
                    message: 'Account Deleted!',
                });
                this.dispatchEvent(event);
                }
                else{
                    const event = new ShowToastEvent({
                        variant: 'error',
                        title: 'Deletion Failed!',
                        message: ' Some error occoured',
                    });
                    this.dispatchEvent(event);
                }
            });
                 
    }
    getAccount(){
        fetchAccount().then(result=>{
            console.log({result});
            this.accountList=result;
            console.log('inresult>>>>>>>>>>>>'+JSON.stringify(this.accountList));
        });
    }
      
}