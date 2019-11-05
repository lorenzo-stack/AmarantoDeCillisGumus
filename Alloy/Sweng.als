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
abstract sig User {}
abstract sig PA extends User {}

one sig EndUser {composedBy: some User}

one sig Municipality extends PA {}
one sig PoliceOffice extends PA {}

sig Citizen extends User {
fiscalCode: one FiscalCode,
status: one AccountStatus
}

//fiscal code
sig FiscalCode{}

sig Location {}
sig Date {}


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
date : one Date,
location: one Location
}

abstract sig TicketStatus {}
one sig IssuedTicket extends TicketStatus {}
one sig NotIssuedTicket extends TicketStatus{}

sig Violation {
licensePlate: one LicensePlate,
reports: set Report,
date : one Date,
location: one Location, //not forcing to be equal to the ones of the reports because there can be bias in the data
//attribute for support traffic ticket generation
ticketStatus: one TicketStatus,
type: one TypeInfraction
}

//ofc a violation is effective when constraints are satisfied 
fact AViolationExists{
//all the reports associated in a violation have the license plate equal to the one in the violation


//a report is used only for a violation
no r: Report, v: Violation, s: Violation | v != s and r in v.reports and r in s.reports
//violation is created when we have at least 2 reports
all v: Violation | #v.reports > 1
}

fact singleEvent{
//data, position and license plate define an event. All reports of the same event are treated in the same way
no r, r' : Report | r.date = r'.date and r.location = r'.location and r.licensePlate = r'.licensePlate and r.status != r'.status and r=r'
no r,r' : Report | r.date = r'.date and r.location = r'.location and r.licensePlate = r'.licensePlate and r.fiscalCode = r'.fiscalCode and r != r'
//do it also with events
}

fact noMoreThanOneReportInValidation{
//I can have at most one report in validation. With at least two reports accepted, I can fix a violation and validate the reports
no r : Report, r':(Report-r) | r.date = r'.date and  r.location = r'.location and r.licensePlate = r'.licensePlate and r.fiscalCode != r'.fiscalCode  and r.status=Accepted and r'.status=Accepted
}

fact noFloatingEntitties{
//each of these needs a parent. They cannot float in the model
all d : Date | d in Report.date
all loc : Location | loc in Report.location
all fc : FiscalCode | fc in Citizen.fiscalCode
all lp : LicensePlate | lp in Report.licensePlate
all tp:TypeInfraction| tp in Violation.type
all sg:Suggestion| sg in TypeInfraction.suggestion
}

fact citizenMustBeActiveInOrderToReport {
no c: Citizen | c.status = Created and c.fiscalCode in Report.fiscalCode
}

//in this part of the model we consider the part of the feedback concerned about the ticket being issued or not
sig Feedback {
violation: one Violation,
madeBy: PoliceOffice
}

fact feedbackIssued {
//no more than one feedback for violation
no  f,f'' : Feedback | f != f'' and f.violation = f''.violation
//no feedback with more than one violation
no v,v': Violation, f : Feedback | v != v' and f.violation = v and f.violation = v'
//no issued status without feedback 
no v : Violation | (v.ticketStatus = NotIssuedTicket and v in Feedback.violation) or ( v.ticketStatus = IssuedTicket and v not in Feedback.violation)
}

//statistics
abstract sig Statistic {}
one sig StatBase extends Statistic  {accessibility: EndUser} 
one sig  StatAdvanced extends Statistic {
accessibility: some PA
}

fact defineAccessibilityContrainst {
all u : User | u in EndUser.composedBy
all u : PA | u in StatAdvanced.accessibility
}

//function2
sig Suggestion {}

sig TypeInfraction {

suggestion:Suggestion

}


//for each type of infraction there is only a suggestion
fact differentInfractionsHaveDifferentSuggestions {

no t,s:TypeInfraction | t!=s and s.suggestion = t.suggestion

}


sig Incident {
location: one Location, 
date : one Date}

sig UnsafeArea {
location : one Location,
violations: set Violation,
incidents: set Incident
}

fact NoDuplicateIncidents{//rename
// No duplicate Incidents
no i1,i2: Incident | i1.location = i2.location and i1.date=i2.date and i1 != i2

all un:UnsafeArea | #un.incidents > 1

all ua: UnsafeArea, disj i1,i2 : ua.incidents | i1.location =i2.location and i1.location = ua.location

}

fact NoLocationInUnsafeAreaNotInViolation{ //(rename )non esiste ua la cui locazione non sia in nessuna violazione, una o due violazioni
// To be an unsafe area, it must have 3 or more violations. 
all ua : UnsafeArea| #ua.violations>1 
// Given two different unsafe areas, they do not have the same location. For all the unsafe areas.
no ua, ua' : UnsafeArea | ua != ua' and ua.location = ua'.location
// For all the violations associated with an unsafe area, the location is the same
all ua: UnsafeArea, disj v,v' : ua.violations | v.location =v'.location and v.location = ua.location

}


//generate basic service world
pred showBasicService {
#Report = 4
#Violation = 1
#Citizen = 3
}

//run showBasicService for 6

pred advancedFunction2{
//testing contrainsts
//#Citizen = 2
#Report = 5
#Violation = 2
#Feedback = 1
#Citizen = 3
}

//run advancedFunction2 for 6


//run advfun1
pred advancedFunction1{

#Violation =3
#UnsafeArea = 1
#Date=2
#Incident = 2
#Location = 2
}

//run  advancedFunction1 for 8






