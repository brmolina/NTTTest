import { LightningElement, api } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import ACCOUNT_NUMBER_FIELD from '@salesforce/schema/Account.AccountNumber';
import TYPE_FIELD from '@salesforce/schema/Account.Type';

export default class UpdateAccountDetails extends LightningElement {
    AccountNameField = NAME_FIELD;
    accountNumberField = ACCOUNT_NUMBER_FIELD;
    accountTypeField = TYPE_FIELD;

    @api recordId;
    @api objectApiName;

    handleError(event){
        console.log('error: ', event);
    }

}