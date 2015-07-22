#NYCapable
NYCapable is a project designed to make it easier for commuters to find the closest wheelchair-accessible MTA station. We hope that it will help an underserved population of the city quickly navigate the MTA system. This app provides directions to the 5 closest accessible subway stations from any given location with the exact location of ADA-compliant entrances and elevators. Future features include directions to and from any location and full, real-time status updates.

You can find the current version on Heroku [here](https://nycapable.herokuapp.com/). We believe that this project is just the beginning, and we'd love for you to contribute in a project that can help open up the transit
system to everyone.

###The NYCapable Team
- [Julia Castro](https://github.com/julia-castro)
- [Ben Cohen](https://github.com/benjamincohen1989)
- [Taylor Hang](https://github.com/sixthand6th)
- [Denny Tek](https://github.com/tekd)

###Contributions
You can find an ongoing list of features for future implementation on the [NYCapable Trello Board](https://trello.com/b/F8JDyx1o/accessible-nyc). If you would like to contribute to the project, feel free to choose a feature and let us know when you're ready to make a pull request. You can also join the [NYCapable Slack Channel](https://accessiblenyc.slack.com/messages/general/) if you've like to give us some feedback or discuss your contribution.

### Installation

```sh
$ git clone [git-repo-url]
$ cd /NYCapable
$ bundle
$ rake db:create
$ rake db:migrate
$ rake db:seed
$ rails s
```

###How to contribute to the project
You can create an issue to make us aware of any bugs or problems or you can work on a feature by:
- Forking the respository
- Implementing your feature
- Making a pull request and tagging us so we can review it.


###API Reference
- We used the [MTA Developer Resources](http://datamine.mta.info/) to get static and real-time information on routes and service status. We developed our own database to pinpoint the precise location of ADA-compliant entrances and elevators.

- We used the [Google Maps Places API](https://developers.google.com/places/) and the [Google Maps Javascript API](https://developers.google.com/maps/documentation/javascript/) for geolocation, directions, and map creation.

###License
This is an open-source project freely distributed under the MIT License.
