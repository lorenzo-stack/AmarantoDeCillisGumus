# RASD SafeStreets

### Table of Content

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

- G4: Prevent access to private informations. **

- G5: Identify possible unsafe areas.

- G6: Provide suggestions in order to limit the number of violations in a specific area.

- G7: Supply public entities with intelligence to generate traffic ticket.

- G8: Elaborate informations in order to build statistics.

- G9: Be complaint to GDPR specifications.

** the system doesn't provide personal informations about physical users who reported violations and it cannot perform connections between license plates and who commited the infraction.

### 1.2 Scope

SafeStreets is built for citizens and public institutions in order to make more secure the city. The S2B is thought in order to keep safe informations from users who report violations and  help municipality to check the city through a distributed network of reports. 

The S2B will give to the user the possibility to report traffic infractions providing pictures , license plate (mandatory in the picture but not as input) and informations (date and location) about the violation and its type, such as double parking or using reserved places for people with disabilities. The system will process the report in which the proposal can be either validated or not. People can also question the system in order to retrieve informations about streets safety.

SafeStreets provides an interface to public authorities with which share data and  cross them with its own informations. The purpose it is to suggest reasonable solutions to each problem, such as adding barriers between streets and bike lane, adding stakes on the sidewalk due to an aggressive parking or suggesting more checks in areas where there are double parking or car parked in reserved places for people with disabilities.

#### 1.3 Definitions, Acronyms and Abbreviations

##### 1.3.1 Definitions

+ **User (or Reporter)**: citezen who reports the infraction.

+ **Authority (or Entity)**: public institutions.

+ **Statistics**: elaborated data. 

##### 1.3.2 Acronyms

* **S2B** = Software To Be

* **API** = Application Programming Interface

* **UI** = User Interface

##### 1.3.3 Abbreviations

* **Gn** = nth goal

* **Dn** = nth domain assumption

* **Rn** = nth requirement  
