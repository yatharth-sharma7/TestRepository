import { CurrentPageReference } from 'lightning/navigation';
import { LightningElement ,wire,track} from 'lwc';
export default class ContactOfAccountRelated extends LightningElement {


    @track recordId='';
     @wire(CurrentPageReference)
    currentPageReference; 

    get recordIdFromState(){
        return this.currentPageReference &&
            this.currentPageReference.state.c__recordId; 
    }
    renderedCallback()
    {
      if(this.recordId==='')
      {
          this.recordId=this.recordIdFromState;
          console.log(this.recordId);
          //call apex after this.recordId has value
      }
    }
}