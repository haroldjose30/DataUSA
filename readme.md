# Project Structure Overview:

 - App/DataUSA: App configuration and entry point.
 - CoreLayer: All Protocols and common code that can be shared between all modules.
 - DependencyInjection: All the dependency injection setup and orchestration. This is how the Horizontal dependency is working. Only this module and App module has access to all modules.
 - DomainLayer: All the business logic here
 - DataLayer: All the data related code. Repositories, DataSources, Services, etc.
 
 - NOTE: Integration Tests and Unit Testes was developed only in DataLayer Module

# SPM - Swift Package Manager Used:

 - AJDependencyInjection: Developed by me, has the responsability to be an independent module responsible for register and resolver dependency injections. 
    - https://github.com/haroldjose30/AJDependencyInjection
 - AJHttpClient:  Developed by me has responsability to be an independent module responsible for all HTTP request handlers. 
    - https://github.com/haroldjose30/AJHttpClient


# App Screenshots

| Name | Image |
| --- | --- |
| Main                     | <img src="./Screens/MainPage.png" width="200" height="400"> | 
| PopulationByYear Chart   | <img src="./Screens/PopulationByYearChart.png" width="200" height="400"> |
| PopulationByYear Data    | <img src="./Screens/PopulationByYearData.png" width="200" height="400"> | 
| PopulationByState Chart  | <img src="./Screens/PopulationByStateChart.png" width="200" height="400"> |
| PopulationByState Data   | <img src="./Screens/PopulationByStateData.png" width="200" height="400"> | 
| PopulationByState Picker |<img src="./Screens/PopulationByStatePicker.png" width="200" height="400">|





