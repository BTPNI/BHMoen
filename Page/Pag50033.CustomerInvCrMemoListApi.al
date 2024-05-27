page 50033 CustomerInvCrMemoListApi
{
    APIGroup = 'apiGroup';
    APIPublisher = 'publisherName';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'customerInvCrMemoListApi';
    DelayedInsert = true;
    EntityName = 'CustomerInvCrMemoListApi';
    EntitySetName = 'CustomerInvCrMemoListApi';
    PageType = API;
    SourceTable = "Cust. Ledger Entry";
    SourceTableView = SORTING("Document Type", "Customer No.", "Posting Date", "Currency Code")
                    WHERE("Document Type" = FILTER("Credit Memo" | Invoice));



    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(WeborderID; SalesInvoiceHeader.WeborderID)
                {

                }
            }
        }

    }
    trigger OnAfterGetRecord()
    Begin
        CLEAR(SalesInvoiceHeader);
        IF SalesInvoiceHeader.GET(Rec."Document No.") THEN;

    End;

    var
        SalesInvoiceHeader: Record "Sales Invoice Header";

}
