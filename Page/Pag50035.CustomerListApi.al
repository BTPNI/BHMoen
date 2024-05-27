page 50035 CustomerListApi
{
    APIGroup = 'apiGroup';
    APIPublisher = 'publisherName';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'customerListApi';
    DelayedInsert = true;
    EntityName = 'CustomerListApi';
    EntitySetName = 'CustomerListApi';
    PageType = API;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(searchName; Rec."Search Name")
                {
                    Caption = 'Search Name';
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                }
                field(contact; Rec.Contact)
                {
                    Caption = 'Contact';
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(telexNo; Rec."Telex No.")
                {
                    Caption = 'Telex No.';
                }
                field(ourAccountNo; Rec."Our Account No.")
                {
                    Caption = 'Our Account No.';
                }
                field(territoryCode; Rec."Territory Code")
                {
                    Caption = 'Territory Code';
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field(chainName; Rec."Chain Name")
                {
                    Caption = 'Chain Name';
                }
                field(budgetedAmount; Rec."Budgeted Amount")
                {
                    Caption = 'Budgeted Amount';
                }
                field(creditLimitLCY; Rec."Credit Limit (LCY)")
                {
                    Caption = 'Credit Limit (LCY)';
                }
                field(customerPostingGroup; Rec."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(customerPriceGroup; Rec."Customer Price Group")
                {
                    Caption = 'Customer Price Group';
                }
                field(languageCode; Rec."Language Code")
                {
                    Caption = 'Language Code';
                }
                field(statisticsGroup; Rec."Statistics Group")
                {
                    Caption = 'Statistics Group';
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field(finChargeTermsCode; Rec."Fin. Charge Terms Code")
                {
                    Caption = 'Fin. Charge Terms Code';
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }
                field(shipmentMethodCode; Rec."Shipment Method Code")
                {
                    Caption = 'Shipment Method Code';
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent Code';
                }
                field(invoiceDiscCode; Rec."Invoice Disc. Code")
                {
                    Caption = 'Invoice Disc. Code';
                }
                field(customerDiscGroup; Rec."Customer Disc. Group")
                {
                    Caption = 'Customer Disc. Group';
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';
                }
                field(priority; Rec.Priority)
                {
                    Caption = 'Priority';
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(homePage; Rec."Home Page")
                {
                    Caption = 'Home Page';
                }
                field(reminderTermsCode; Rec."Reminder Terms Code")
                {
                    Caption = 'Reminder Terms Code';
                }
                field(reminderAmounts; Rec."Reminder Amounts")
                {
                    Caption = 'Reminder Amounts';
                }
                field(reminderAmountsLCY; Rec."Reminder Amounts (LCY)")
                {
                    Caption = 'Reminder Amounts (LCY)';
                }

                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                }
                field(Webkunde; Rec.Webkunde)
                {
                    Caption = 'Webkunde';
                }

                field("CustomerCategory"; Rec."Customer cateogri")
                {
                    Caption = 'Customer cateogri';
                }

                field("CreationDate"; Rec."Creation date")
                {
                    Caption = 'Creation date';
                }


                field("WebUsername"; Rec."Web Username")
                {
                    Caption = 'Web Username';
                }
                field("WebEMail"; Rec."Web E-Mail")
                {
                    Caption = 'Web E-Mail';
                }

            }
        }
    }
}
