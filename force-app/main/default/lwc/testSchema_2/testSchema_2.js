import { LightningElement, api, wire, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class Poc extends LightningElement {
   
    @track value = '';

    get options() {
        return [
            { label: 'Account', value: 'Account' },
            { label: 'Contact', value: 'Contact' },
        ];
    }

    handleChange(event) {
        this.value = event.detail.value;
    }

    @api recordId = '00128000009j45qAAA';

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    accountInfo;

    @wire(getRecord, { recordId: '$recordId', fields: ['Account.Name'] })
    account;

    get accountFields() {
        return this.accountInfo.data.fields;
    }

    get accountRecord() {
        return this.account.data.fields;
    }

    get show() {
        return this.accountInfo.data && this.account.data;
    }
}