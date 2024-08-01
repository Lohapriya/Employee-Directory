namespace emp;
using{cuid,managed} from '@sap/cds/common';
entity Employee_registry: cuid,managed{
    Name:String(255);
    Email_Id:String(255);
    Department:Association to one Department ;
}

entity Department: cuid{
    Name:String(255);
    Employees:Association to many Employee_registry on Employees.Department=$self;

}