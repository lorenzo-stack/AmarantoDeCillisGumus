//User
abstract sig User {}

sig Citizen extends User {

fiscalCode: FiscalCode

}
//Fiscal code is unique
fact {
no c:Citizen |  c.fiscalCode in (Citizen-c).fiscalCode
}

sig FiscalCode{}



sig PA extends User {}

//Report

sig Report {

status: lone ReportStatus,
fiscalCode: FiscalCode,
licensePlate: LicensePlate,
dataLocation: DataAndLocation

}

sig DataAndLocation {}

sig LicensePlate {}

abstract sig ReportStatus {}

sig Accepted extends ReportStatus{}

sig Refused extends ReportStatus{}

pred show{

}

run show for 4
