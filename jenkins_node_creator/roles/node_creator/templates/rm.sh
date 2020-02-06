#!/bin/bash

sudo docker stop {{ node_name }}.cicd && sudo docker rm {{ node_name }}.cicd
