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

1. Download or clone repo. Install all dependencies using bundle

```bash
$ bundle
```

2. Run postgresql and redis

```bash
$ docker compose up --build redis postgresql
```

3. Prepare databases

```bash
$ rails db:prepare
$ rails db:migrate
```

2. Start server

```bash
$ bin/dev
```
