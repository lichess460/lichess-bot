#  [lichess460](https://github.com/lichess460)

[![Python](https://github.com/OIVAS7572/lichess-bot/actions/workflows/Python.yml/badge.svg)](https://github.com/OIVAS7572/lichess-bot/actions/workflows/Python.yml)
[![Docker](https://github.com/OIVAS7572/lichess-bot/actions/workflows/Docker.yml/badge.svg)](https://github.com/OIVAS7572/lichess-bot/actions/workflows/Docker.yml)

# lichess-bot

- A bridge between [Lichess API](https://lichess.org/api#tag/Bot) and bots.
- This bot is using Docker and concentrated on Heroku server.

## How to Install In Heroku

- Import or Fork this repository to your Github repository.
- Open config.yml and insert API accses token in to token option and commit changes
- Install Heroku CLI and create app in Heroku.com.
- Run this in cmd `heroku stack:set container -a appname` replace app name with your app's name.
- Connect app with Github and deploy app in Heroku.
- After deploying turn worker on in Resources menu in heroku. 

## INFO

ENGINE:
- STOCKFISH 13 SSE4.1 + POPCNT

OPENING BOOKS: 
- Aaricia_2012.bin
- Drawkiller_EloZoom_big.bin

**If you want to run bot localy on PC, read the [lichess-bot manual](https://github.com/ShailChoksi/lichess-bot#lichess-bot).**
