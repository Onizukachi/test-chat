## Test Chat

to create a message using  API, make a request like this

```bash
$ http POST http://localhost:3000/api/v1/messages room_title=sample message=Hello
```
to get all the rooms

```bash
$ http GET http://localhost:3000/api/v1/messages
```

### Description

Simple chat with Hotwire, Turbo and Stimulus.

Implemented in Ruby 3 using Rails 7 and PostgreSQL.

### Launching

1. Download or clone repo. 


2. Run all services

```bash
$ docker compose up --build
```

3. Ypu can create test guest user for API

```bash
$ docker compose exec web bin/rails db:seed
```
Enjoy....
