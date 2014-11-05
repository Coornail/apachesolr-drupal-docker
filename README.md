ApacheSolr Docker for Drupal
==============

Docker image for ApacheSolr for Drupal search.


To use:
```sh
git clone git@github.com:Coornail/apachesolr-drupal-docker.git 
cd apachesolr-drupal-docker

docker build -t drupal-solr .
docker run -it -p 8983:8983 -t drupal-solr
```
