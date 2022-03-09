# The Mobility House DevOps Homework

Naturally, this code must be written by you alone, but you may
use the internet to solve various aspects as required, as would
be done in day-to-day work. We appreciate you taking the time!

So, fork this repo and have a go.

## Task 1

Please write a BASH script which does the following:

Starting in the /opt directory, locate all directories which contain
a file called .prune-enable

In those directories, delete any files named crash.dump

In those directories, for any file having the suffix ".log", if the
file is larger than one megabyte, replace the file with a file containing
only the last 20,000 lines.


## Task 2

Please provide a Dockerfile and supporting files to build a docker image.

The image should contain a webserver to serve static files that will be
hosted in /opt/html.

Internally, the container should run as a non-root user.

Curl should also be installed in the container for testing purposes.

The exposed port should be configurable.


## Task 3

- RMQ: RabbitMQ
- rmq shovel: RMQ plugin which pushes data from one RMQ instance to another
- IoT: Internet of Things

Assume a data "path" which looks something like this:

    [IoT RMQ]-----(rmq shovel)---->[AWS RMQ]<-------[Logstash]----->[Elasticsearch]

Assumptions:

- There are many [IoT RMQ] instances in the public internet and they push
  JSON data to [AWS RMQ] using RMQ plugin called Shovel
- That (JSON) data consists of monitoring data as well as core metrics
  like battery charge, etc
- You have to use RMQ and Elasticsearch
- Our Data Science team are competent data scientists, however, they don't
  like working with Elasticsearch
- Our data scientists use Python
- There is so much data that, after some time, we have to archive Elasticsearch data,
  which makes it unavailable to the Data Science team

Your task is to come up with a design which would leave RMQ and Elasticsearch in place
but would also funnel data into some data store which the Data Science team
will use to do their data science stuff.

Submit a few paragraphs explaining your design and (optionally) a basic architecture diagram.
There are no "right" answers or technologies here, but please do explain your reasoning.
