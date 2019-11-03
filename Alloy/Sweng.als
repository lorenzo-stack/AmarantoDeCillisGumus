//STATUS
//account status
abstract sig AccountStatus{}
one sig Active extends AccountStatus{}
one sig Created extends AccountStatus{}

//all the status for reports
abstract sig ReportStatus {}
one sig Accepted extends ReportStatus{}
one sig Refused extends ReportStatus{}
one sig Validated extends ReportStatus{}

fact AViolationContainsOnlyValidatedReport {
//a report associated to a violation is validated
all r: Report | r.status = Validated <=> r in Violation.reports
}

//ACTOR
abstract sig PA {}

one sig Municipality extends PA {}
one sig PoliceOffice extends PA {}

sig Citizen {
fiscalCode: one FiscalCode,
status: one AccountStatus
}

//fiscal code
sig FiscalCode{}

sig DataAndLocation {}

sig LicensePlate {}

//Fiscal code is unique
fact UniqueFiscalCode{
no c:Citizen |  c.fiscalCode in (Citizen-c).fiscalCode
}

//Report
//one report is associated to one citizen through its fiscal code
//standard information in a report form
sig Report {
status: one ReportStatus,
fiscalCode: one FiscalCode,
licensePlate: one LicensePlate,  //as we're testing the domain model, we assume that all the alg provides the license plate
dataLocation: one DataAndLocation
}

sig Violation {
licensePlate: one LicensePlate,
reports: set Report,
dataLocation: one DataAndLocation //not forcing to be equal to the ones of the reports because there can be bias in the data
//attribute for support traffic ticket generation
}

//ofc a violation is effective when constraints are satisfied 
fact AViolationExists{
//all the reports associated in a violation have the license plate equal to the one in the violation
all v : Violation |  v.reports.licensePlate = v.licensePlate 
//a report is used only for a violation
//all r : Report, v : Violation, rest: (Violation - v) | r in v.reports | r not in rest.^reports
//one v : Violation| all rest: (Violation - v) | all r:Report |  r in v.reports not in rest.reports
no r: Report, v: Violation, s: Violation | v != s and r in v.reports and r in s.reports
//violation is created when we have at least 2 reports
all v: Violation | #v.reports > 1
}

fact singleEvent{
//data, position and license plate define an event. All reports of the same event are treated in the same way
no r, r' : Report | r.dataLocation = r'.dataLocation and r.licensePlate = r'.licensePlate and r.status != r'.status 
//do it also with events
}


pred show{
//testing contrainsts
//#Citizen = 2
#Report >5
#Violation =2
}

run show for 8
