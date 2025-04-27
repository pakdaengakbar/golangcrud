Before running the golang server, please follow the guide to setting up the MySQL database below:

1. Create a db_project database in MySQL
2. Run the db_project.sql file in MySQL
3. Reset the user password in the connection folder

After that run in postmant to get token
1. http://localhost:8080/login
2. Authorization
   Basic Auth :
     Username <username>
     Password <password>

     Login
     This endpoint is used to authenticate and obtain access and refresh tokens.
     Request Body
     username (text, required): The username of the user.
     password (text, required): The password of the user.
    
     Response
     Status: 200 OK
     Content-Type: application/json
     access_token (string): The access token for the authenticated user.
     refresh_token (string): The refresh token for the authenticated user.
    
