import { LightningElement, track ,wire } from 'lwc';
import{ CurrentPageReference } from 'lightning/navigation';
import { fireEvent } from 'c/pubsub';
export default class LightningExampleInputNumber extends LightningElement {
    @wire(CurrentPageReference) pageRef;
    @track name;
    @track amount=0; 

    add(){

        this.amount=this.template.querySelector('lightning-input').value;
        console.log('checking the event');
        console.log(this.amount);
        fireEvent(this.pageRef,'TestEvent',this.amount);
    }
    
 
}