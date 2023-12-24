## Test Chat

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
