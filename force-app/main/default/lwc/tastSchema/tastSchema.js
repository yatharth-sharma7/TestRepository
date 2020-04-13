import { LightningElement, track, api } from 'lwc';
import getFieldsAccordingly from '@salesforce/apex/AccOrConSchema.getFieldsAccordingly';
export default class TestCmp extends LightningElement {
    @api recordId;
    @track listOfFields = [];
    @track _selected = [];
    @track MPLVal = [];
    @track sobject = '';
    
    handleSave(event){
        this.sobject= this.template.querySelector("[data-id='sobject']").value;
        console.log(this.sobject);
        getFieldsAccordingly({sObj:this.sobject}).then(result=>{
            console.log({result});
            this.listOfFields=result;
            console.log('inresult>>>>>>>>>>>>'+JSON.stringify(this.listOfFields));
        });
    }

    get options() {
        for(var j =0 ; j<this.listOfFields.length; j++){
            if(this.listOfFields[j].isMultiPickList === true){
            for (var i = 0; i < this.listOfFields[j].multiPickListValue.length; i++) {
                this.MPLVal.push({
                    label: this.listOfFields[j].multiPickListValue[i],
                    value: this.listOfFields[j].multiPickListValue[i]
                });
            }
        }
    }
            return this.MPLVal;
    }
    get selected() {
        return this._selected.length ? this._selected : 'none';
    }

    handleChange(e) {
        this._selected = e.detail.value;
    }
}