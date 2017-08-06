# A Full example illustrating the use of PlaceholdersKit tool ! 

# Goals :

We will use the Microsoft's template MVC dotnet application for this full example of using the PlaceholdersKit tool. It's a frontend application. We will update the homepage of the web site for adding several sentences **with placeholders**. The delimiters of these placeholders will be **{{...}}**. 

We will use the **new feature multi-stage building of Docker** by first building the dotnet solution (dotnet restore and dotnet publish goals) before creating our target docker image with only the fruits of this building (dotnet run goal). This docker application image will be always the same for all our deployments, **we will be in aenvironment-independent and thus reusable**. 

Then we will deploy the dotnet application (as a stack application Docker) in **INTEGRATION-DEV** environment by using all the Key Names taken in an external KV Consul Store, from the INTEGRATION-DEV endpoint. Then, after changing the environement as **PRODUCTION** by pointing to PRODUCTION endpoint, we will upadte the Docker service/stack application by re-deploying the same stack. 
