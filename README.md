## What civic issue does this address?

Streets and parking spots in Chicago (and other cities) are often inaccessible on an ad-hoc basis, due to
exigent circumstances like police activity, snow, fallen trees, festivals, parades, movie permitting, street cleaning,
downed power lines, repairs, and other events. Although the city publishes a list of street closures, it is exclusive of many of these circumstances.
Ignorance of local parking spot closures can cause people inconvenience at best and to incur fines and penalties at worst.

Our app allows users to update a map with local parking and street closures.

## Who is your core user?

We have two users; one user is individuals who could both make use of the map and update it as they travel around the city;
the other core 'user' would be city officials (such as police officers, metering officers, repairmen, etc.) who would be responsible
for updating the app as part of their official duties (thus providing users with an initial reason to use it).

## What existing dataset did you use?

Since our app is based around reporting of ad-hoc and temporary events, there is no existing dataset that covers these circumstances.

##  Briefly describe the technologies you used (ie language, database, hosting, and any design frameworks you used)

This app is powered by Ruby on Rails 5.2.3, using Ruby's default SQLite db on the backend.
It uses Google Maps and javascript to power the map functionality. It is hosted on Heroku.

## Identify 2-3 metrics you would use to assess the app’s impact

Number of reported closures (broken down by officials and citizens), number of passive 'viewers'; a decline in the number of parking
citations in areas with a lot of reporting could also be indicative of an impact

## If you worked in a group: briefly describe each student’s contribution

We were jointly responsible for the concept and design of the app; Sam coded the core Rails app, Tim handled front-end and hosting work.
