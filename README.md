# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:


* Ruby version <br>
  ruby 2.7.1

* Database creation <br>
  rails db:setup

* Demo App
  http://tsd.up.km.ua/

## Test access

- user: john@doe.com/123456 (or you can sing up with you own user)

## Functionality



## Run postgres:
1. Run `docker build -t  postgres_tsd -f postgres.Dockerfile .`
2. Create image container, only first run
   `docker run  -p 54321:5432 --name postgres_tsd  -d  postgres_tsd`
3. Stop/Start
   3.1  Stop `docker stop postgres_tsd`
   3.2  Start `docker start postgres_tsd`
4. Check `PGPASSWORD=password psql -U postgres -h localhost -p 54321`
5. Create user `CREATE USER admin WITH PASSWORD 'password';`
6. GRANT user `ALTER USER admin CREATEDB;`
7. Check `PGPASSWORD=password psql -U user -h 127.0.0.1 -p 54321 -d postgres`

## `EDITOR=nano rails credentials:edit`



