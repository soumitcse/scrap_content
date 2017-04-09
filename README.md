
# README

This README would normally document whatever steps are necessary to get the
application up and running.

# scrap_content
Scrap website by url and Save H1 H2 H3 and Links tags in a db


Things you may want to cover:

* Rails 5
* Ruby 2.3.0p0
* Database - sqlite

* Run Rake db:migrate

* For test GUI is available go to localhost://3000 you will get the view to enter url of the site

List all the saved links with ids
http://localhost:3000/api/v1/welcomes

Providing New url link

curl --data "new_url= YOUR URL "  GET   http://localhost:3000/api/v1/welcomes

Get Headers H1 for specific link
/api/v1/welcomes/:ID/header1s

Get Headers H2 for specific link
/api/v1/welcomes/:ID/header2s


Get Headers H3 for specific link
/api/v1/welcomes/:id/header3s

Get Links Tags for specific link
/api/v1/welcomes/:id/link_urls
