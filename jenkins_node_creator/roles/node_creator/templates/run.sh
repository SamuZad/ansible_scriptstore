#!/bin/bash

sudo docker run                                                                                           \
  --hostname {{ node_name }}.cicd                                                                         \
  -v /var/run/docker.sock:/var/run/docker.sock                                                            \
  -v /data/docker/workers/{{ node_name }}/workspace:/home/dockerusr/workspace                             \
  -v /etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem:/etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem  \
  -v /etc/pki/ca-trust/extracted/java/cacerts:/home/dockerusr/jdk/jre/lib/security/cacerts                \
  -v /home/USER/runtime/cicd/{{ node_name }}/id_rsa.pub:/home/dockerusr/.ssh/authorized_keys         \
  --group-add $(getent group dockerroot | cut -d: -f3)                                                    \
  --group-add $(getent group dockergrp | cut -d: -f3)                                                     \
  -d                                                                                                      \
  --name {{ node_name }}.cicd                                                                             \
  -e no_proxy="{{ proxy_info }}"                                                                          \
  -e NO_PROXY="{{ proxy_info }}"                                                                          \
  --network cicdnetwork                                                                                   \
  --privileged                                                                                            \
  -m 8g                                                                                                   \
  --cpu-shares 1024                                                                                       \
  --pids-limit 1000                                                                                       \
  {{ additional_lines }}                                                                                  \
  {{ image_name }}
