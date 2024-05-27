tableextension 50100 Table36_Ext extends "Sales Header"
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
    trigger OnAfterInsert()
begin
    if Rec.WebReference <> '' THEN
      Rec."Your Reference" := CopyStr(Rec.WebReference,1,35) ;
    Rec.Modify();
end;
}
