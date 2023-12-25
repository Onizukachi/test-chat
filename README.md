## Test Chat

### Description

Simple chat with Hotwire, Turbo and Stimulus.

Implemented in Ruby 3 using Rails 7 and PostgreSQL.

### Launching

1. Download or clone repo. 


2. Run all services

```bash
$ docker compose up --build
```

To create a message using  API, make a request like this

```bash
$ http POST http://localhost:3000/api/v1/messages room_title=sample message=Hello
```
but before you need create guest user

```bash
$ docker compose exec web bin/rails db:seed
```

to get all the rooms

```bash
$ http GET http://localhost:3000/api/v1/messages
```
Enjoy....
