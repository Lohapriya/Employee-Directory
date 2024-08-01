using emp from '../db/schema';

service EmployeeServices{
    entity Employees @(
        Capabilities:{
              InsertRestrictions : {
                  $Type : 'Capabilities.InsertRestrictionsType',
                  Insertable,
              },
              UpdateRestrictions : {
                  $Type : 'Capabilities.UpdateRestrictionsType',
                  Updatable,
              },
              DeleteRestrictions : {
                  $Type : 'Capabilities.DeleteRestrictionsType',
                  Deletable,
              },

        })

    as select from emp.Employee_registry;
    annotate Employees with @odata.draft.enabled;
    entity Department as select from emp.Department;
    annotate Department with @odata.draft.enabled;
}

annotate EmployeeServices.Employees with @(
    UI:{
        SelectionFields  : [
            Department_ID
        ],
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Value : Email_Id,
            },
            {
                $Type : 'UI.DataField',
                Value : Department_ID,
                
            }
        ],

         HeaderInfo  : {
             $Type : 'UI.HeaderInfoType',
             TypeName : 'Employee',
             TypeNamePlural : 'Employees',
         },
         Facets:[
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#Default',
                ID: 'Default',
                Label:'General',
            },
             {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#Admin',
                ID: 'AdminData',
                Label:'Administrative Data',
            },
         ],
         FieldGroup #Default : {
             $Type : 'UI.FieldGroupType',
             Data:[
                {
                    $Type:'UI.DataField',
                    Value:Name,
                },
                
                {
                    $Type:'UI.DataField',
                    Value:Email_Id,
                },
                 {
                    $Type:'UI.DataField',
                    Value:Department_ID,
                }
             ]
             
         },
         FieldGroup #Admin : {
             $Type : 'UI.FieldGroupType',
             Data:[
                {
                    $Type:'UI.DataField',
                    Value:createdAt,
                },
                {
                    $Type:'UI.DataField',
                    Value:createdBy,
                },
                {
                    $Type:'UI.DataField',
                    Value:modifiedAt,
                },
                {
                    $Type:'UI.DataField',
                    Value:modifiedBy,
                },
             ]
             
         },
    }
){
     Name    @title:'Name';
     Email_Id @title:'EmailId';
     Department @(
        title:'Dept',
        Common:{
            ValueListWithFixedValues,
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Department',
                 Label:'Departments',
                 Parameters:[
                   {
                       $Type : 'Common.ValueListParameterOut',
                       LocalDataProperty : Department_ID,
                       ValueListProperty : 'ID',
                   },
                   {
                       $Type : 'Common.ValueListParameterDisplayOnly',
                       ValueListProperty : 'Name',
                   },
                     
                 ],
            },
           
            

        }
     
     
     
     );

}    
    