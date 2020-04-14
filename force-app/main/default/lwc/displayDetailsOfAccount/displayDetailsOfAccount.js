import { LightningElement, track, wire} from 'lwc';
import fetchAccount from '@salesforce/apex/AccountBankDetails.fetchAccount';
//import updateData from '@salesforce/apex/AccountBankDetails.updateData';
import{CurrentPageReference} from 'lightning/navigation';
import { registerListener,unregisterAllListeners } from 'c/pubsub';
export default class AccountBankDetails extends LightningElement {
    @track AccountList = [];
    @track amountNew=0;
    @wire(CurrentPageReference) pageRef;

    connectedCallback(){
        fetchAccount().then(result=>{
            console.log({result});
            this.AccountList=result;
        });
        
        registerListener('TestEvent',this.setUpData, this);
        
    }

    setUpData(ammount) {
    
        console.log("event sucuss"); 
        console.log(ammount);
        this.AccountList[0].TotalAmount__c = parseInt(this.AccountList[0].TotalAmount__c)+ parseInt(ammount);


        console.log("apex calling");
        /*updateData({ ammount: this.ammount}).then(newresult=>{
            console.log({newresult});
            this.AccountList=newresult;
        });*/
    
    }
    disconnectedCallback() {
        unregisterAllListeners(this);
    }
}