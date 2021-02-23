# README

This is a basic RestApi that requires the user to be logged in to access his lists and items

#### User is logged in *VIA SESSION* and *NOT AUTHENTICATION TOKEN*, session will *EXPIRE in 6 HOURS*

**Live version of the Api at :** https://todo-rest-api-p17134.herokuapp.com/

### The Api supports the following URIs :

| Endpoint | Functionality |
| --- | --- |
| POST /signup | Signup |
| POST /auth/login | Login |
| GET /auth/logout | Logout |
| GET /todos | List all todos |
| POST /todos | Create a new todo |
| GET /todos/:id | Get a todo |
| PUT /todos/:id | Update a todo |
| DELETE /todos/:id | Delete a todo and its items |
| GET /todos/:id/items | List all todo's items |
| POST /todos/:id/items | Create a new todo item |
| GET /todos/:id/items/:id | Get a todo item |
| PUT /todos/:id/items/:id | Update a todo item |
| DELETE /todos/:id/items/:id | Delete a todo item |

### Running test for the Api on httpie

Sign up (automatically logs in user):
```
http --session=heroku-log todo-rest-api-p17134.herokuapp.com/signup name=John email=email@gmail.com password=pass1 password_confirmation=pass1
```
Login :
```
http --session=heroku-log todo-rest-api-p17134.herokuapp.com/auth/login email=email@gmail.com password=pass1
```
Logout :
```
http --session=heroku-log todo-rest-api-p17134.herokuapp.com/auth/logout
```
Create new todo list :
```
http --session=heroku-log todo-rest-api-p17134.herokuapp.com/todos title="My todo list"
```
Create new todo list item, **default done set to false** :
```
http --session=heroku-log todo-rest-api-p17134.herokuapp.com/todos/4/items name="My todo list item"
```
or **done set manually (true or false)**
```
http --session=heroku-log todo-rest-api-p17134.herokuapp.com/todos/4/items name="My todo list item" done=true
```
