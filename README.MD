# _Volunteer Ruby_

#### _Friday Project, 05/05/17_

#### By _** Jason Lazzuri**_

## Specifications

* This app will let you create projects, update or delete those projects names, add volunteers to the projects and update or delete those volunteers names

* First it will ask for the name of a Project you want to create and then put that name on a list of projects.


* Then you can either add volunteers to those projects to edit the projects name, or just delete both altogether.

## Setup/Installation Requirements

* _Must have Postgres installed. Run the database instructions below._


## PSQL Commands
* _CREATE DATABASE volunteer_tracker_
* _CREATE TABLE projects (id serial PRIMARY KEY, name varchar)_
* _CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, project_id int)_
* _CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker_

The repository for this project can be accessed at https://github.com/JasonLazzuri/volunteerFriday

* _Using Terminal, run the command 'git clone https://github.com/JasonLazzuri/volunteerFriday' in the desktop directory_
* _now run the command 'cd volunteerFriday' to change into that directory/folder_
* _Open all files using atom by typing the command 'atom .'_
* _Now in Terminal type 'ruby app.rb' to broadcast the website using Sinatra_
* _Now, type localhost:4567 into your browser to see the page._

## Support and contact details

_Please contact Jason Lazzuri through email at Jason.Lazzuri@gmail.com_

## Technologies Used

_Ruby_
_HTML_
_Postgres/SQL_


Copyright (c) 2017 **_Jason Lazzuri_**
