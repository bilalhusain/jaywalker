a simple crawler for plus.google.com
---

Jaywalker is your socially retarded self who likes to creep into socially apt people's profile while lazily enjoying its stride. It's written in coffeescript and uses nodejs + mongodb.

* Start with a profile
* Collect name, some link information (for demo)
* Repeat for friends in circle
* Profit

This project was meant to be a concept and has skipped design decisions like optimization or consideration for memory or CPU. And, yeah, definitely not for skiddies. (It can screw up your OS while summoning viruses and death!!!)

To run:
    $MONGO_HOME/bin/mongod -dbpath .
    coffee jaywalker.coffee

Probably means $ for spammers and agenda for privacy experts. Okay :(

