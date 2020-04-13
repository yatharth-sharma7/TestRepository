import { LightningElement,api,track } from 'lwc';
import fetchContacts from '@salesforce/apex/AccountController_LWC.fetchContacts';
export default class RecordIdExample extends LightningElement {
     @api recordId;
     @track contactList =[];
     @track showPopover=false;

     connectedCallback(){
         this.getContacts();
     }

     getContacts(){
         console.log("getContacts>>>>"+this.recordId);
         fetchContacts({PassId : this.recordId}).then(result=>{
            console.log({result});
            this.contactList=result;
            console.log('inresult>>>>>>>>>>>>'+JSON.stringify(this.contactList));
        });
     }
     shwoId(){
         console.log("show function");
              console.log(this.recordId);
         
     }
     showPopUp(event){
        console.log("show Pop Up");
        const recordId = event.target.dataset.recordid;
        var index=event.target.title;
        console.log(index);
        console.log('handleDelete' + recordId );
        this.contactList[index].isEdited=true;
        console.log(this.contactList[index].isEdited)

     }
     hidePopUp(){
        console.log("hide pop up");
        var index=event.target.title;
        console.log(index);

        //this.contactList[index].isEdited=false;
        var i;
        for (i = 0; i < this.contactList.length; i++){
            this.accountList[i].isEdited=false;
        }
        console.log(this.contactList[index].isEdited)
     }
    }