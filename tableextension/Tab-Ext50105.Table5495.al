tableextension 50105 Table5495 extends "Sales Order Entity Buffer"
{
    fields
    {
        field(50003; "WebReference"; Text[250])
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }

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
