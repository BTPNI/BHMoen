page 50036 ItemAvailabilityApi
{
    APIGroup = 'apiGroup';
    APIPublisher = 'publisherName';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'itemAvailabilityApi';
    DelayedInsert = true;
    EntityName = 'ItemAvailabilityApi';
    EntitySetName = 'ItemAvailabilityApi';
    PageType = API;
    SourceTable = Item;
    
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
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(ItemAvailability; ItemAvailability)
                {
                    Caption = 'ItemAvailability';
                }
                field(ExpectedInStock; Rec."Expected in stock")
                {
                    Caption = 'Expected in stock';
                }
            }
        }
    }
    trigger OnAfterGetRecord() 
    var Item : Record Item;
    begin
           CLEAR(Item);
                       CLEAR(ItemAvailability);
                       IF Item.GET(Rec."No.")THEN;
                       Item.SETRANGE(Item."Location Filter",'HOVED');
                       Item.CALCFIELDS(Inventory,"Qty. on Sales Order");
                       ItemAvailability := Item.Inventory - Item."Qty. on Sales Order";
    end;

      VAR
      ItemAvailability : Decimal;
}
