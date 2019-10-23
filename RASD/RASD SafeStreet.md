# RASD SafeStreets

### Table of Contents

## 1. Introduction

### 1.1 Purpose

#### 1.1.1 General purpose

SafeStreets is a crowd-sourced application where citezens can report traffic violations to authorities along with pictures and relative informations about the infractions. After their validation, if it's requested, the system provides the possibility of analyze the collected data, such as enlighting possible unsafe areas or the list of vehicles that commit an infraction, based on the role of the final user.

In addiction, SafeStreets can cross its informations with the ones provided by the municipality and suggest reasonable interventions for unsafe areas. Then it can also supply public authorities, such as the local police, with data in order to generate traffic tickets from them. Finally it elaborates statistics on different layers showing the effectiveness of SafeStreets and its impact on the community.

#### 1.1.2 Goals

Here it follows a list of the identified goals of the S2B.

- G1 : Allow citezens to report traffic violation with relative informations

- G2: Allow citezens to retrieve informations about all the different areas of the city.

- G3: Allow public authorities to mine data.

- G4: Prevent access to private informations$1$

- G5: Identify possible unsafe areas.

- G6: Provide suggestions in order to limit the number of violations in a specific area.

- G7: Supply public entities with intelligence to generate traffic ticket.

- G8: Elaborate informations in order to build statistics.

- G9: Be compliant to GDPR specifications.

$1$ the system doesn't provide personal informations about physical users who reported violations and it cannot perform connections between license plates and who commited the infraction.

### 1.2 Scope

The idea of SafeStreets is to improve the condition of the general mobility in the city exploiting a virtuous relationship of collaboration between citizens reporting violations and public authorities. The S2B is thought to guarantee the privacy of users who report violations and to help municipality to check the city through a distributed network of reports. **

The S2B will give to the user the possibility to report traffic infractions providing pictures , license plate (mandatory in the picture but not as input) and informations (date and location) about the violation and its type, such as double parking or using reserved places for people with disabilities. The system will evaluate either to accept or to refuse reports, that must be compliant to the minimum acceptance requirements.Then,Safestreets will validate reports according to his internal logic. Both the acceptance and validation criteria will be explained in details further in the DD. People can also question dynamically the system in order to retrieve various kind of informations,like trends, based on the type of violation and other selectable parameters. Instead more informations can be mined by public authorities that will be also able to visualize the rankings about vehicles which committed more infractions and citizens who reported more violations. 

SafeStreets shares an interface to public authorities with which it can retrieve data and cross them with its own informations. The purpose it is to suggest reasonable solutions to each problem, such as adding barriers between streets and bike lanes or adding stakes on the sidewalk due to an aggressive parking, suggesting more checks in areas where there are double parking or car parked in reserved places for people with disabilities.

All the data collected by the system will be processed and made available for public authorities. In this way,  rifined data will be used by the municipality in order to generate traffic tickets. With feedbacks received by the authorities, SafeStreets builds statistics in order to retrieve indexes and trends with which public entities can evaluate the influence of the system on the community behaviour.

#### 1.3 Definitions, Acronyms and Abbreviations

##### 1.3.1 Definitions

+ **User (or Reporter)**: citizen who reports the infraction.

+ **Authority (or Entity)**: public institutions.

+ **Statistics**: elaborated data. 

+ **Feedback**: response by the municipality concerning the total amount of traffic tickets.

##### 1.3.2 Acronyms

* **S2B** = Software To Be

* **API** = Application Programming Interface

* **UI** = User Interface

* **DD** = Design Document

* **GDPR** =General Data Protection Regulation

##### 1.3.3 Abbreviations

* **Gn** = nth goal

* **Dn** = nth domain assumption

* **Rn** = nth requirement  

#### 1.4 Reference Documents

IEEE Std 830-1998 IEEE Recommended Practice for Software Requirements Specifications

- Specification document: “SafeStreets Mandatory Project Assignment”

- UML diagrams: https://www.uml-diagrams.org/

- Alloy doc: http://alloy.lcs.mit.edu/alloy/documentation/quickguide/seq.html 

#### 1.5 Document Structure

The R.A.S. is structured as a five section Document, each one presented below:

+ **Section 1**: This section is aimed to give a general introduction of the S2B, presenting the identified goals the system has to reach and a deeper description of the analysis of the world and the shared phenomena.

+ **Section 2**:

+ **Section 3**:

+ **Section 4**:

+ **Section 5**:
