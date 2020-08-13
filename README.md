# LiftingLog-VaporBackend

This is a very simple backend written in Swift / Vapor for the [LiftingLog app](https://github.com/tssandor/LiftingLog-UIKit).

It is a barebone implementation of Vapor without any database, as it only stores one data point (the total weight moved by all weighlifters using the app).

## API endpoints

The API lives at `https://liftinglog-backend.herokuapp.com`.

`/getWeight`
This GET request returns a string that can be converted into a float.

`/addWeight`
This POST request takes one string parameter `weight` and adds it to the total.

## Web interface

There is a _very_ simple [web interface](https://liftinglog-backend.herokuapp.com) where you can see the total weight :]

## Possible improvements

Adding a database, obviously!