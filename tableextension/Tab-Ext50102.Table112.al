tableextension 50102 Table112 extends "Sales Invoice Header"
{
    fields
    {
        field(50100; "Weborder"; Boolean)
        {
            Caption = 'Weborder';
            DataClassification = ToBeClassified;
        }

        field(50102; "WeborderID"; Code[20])
        {
            Caption = 'WeborderID';
            DataClassification = ToBeClassified;
        }

    }
}
