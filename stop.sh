#!/bin/bash

echo "Stoping lm_purged_msisdn module for all operator....."

## Stop lm_purged_msisdn for cellcard operator ##
./stop_by_operator.sh cc

## Stop lm_purged_msisdn for smart operator ##
./stop_by_operator.sh sm

## Stop lm_purged_msisdn for seatel operator ##
./stop_by_operator.sh st

## Stop lm_purged_msisdn for metfone operator ##
./stop_by_operator.sh vt

