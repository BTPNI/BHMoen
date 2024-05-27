tableextension 50103 Table18 extends Customer
{
    fields
    {
        field(50002; "Webkunde"; Boolean)
        {
            Caption = 'Webkunde';
            DataClassification = ToBeClassified;
        }

        field(50003; "Customer cateogri"; Enum "Customer Category")
        {
            Caption = 'Customer category';
            DataClassification = ToBeClassified;
        }
        field(50004; "Creation date"; Date)
        {
            Caption = 'Creation date';
            DataClassification = ToBeClassified;
        }

        field(50005; "Web Username"; Text[250])
        {
            Caption = 'Web Username';
            DataClassification = ToBeClassified;
        }
        field(50006; "Web E-mail"; Text[250])
        {
            Caption = 'Web Username';
            DataClassification = ToBeClassified;
        }

    }
}
