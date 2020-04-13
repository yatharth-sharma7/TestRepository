import { LightningElement, track} from 'lwc';
import wrapperMethod from '@salesforce/apex/AccountAndItsAssociates.wrapperMethod';
export default class FetchAccAndItsAssociatesWithWrapperLWC extends LightningElement {
    @track wrapperList = [];

    connectedCallback(){
        wrapperMethod().then(result=>{
            console.log({result});
            this.wrapperList=result;
            console.log('inresult>>>>>>>>>>>>'+JSON.stringify(this.wrapperList));
        });
    }
}