#!/bin/bash

# In order to disable the MATE panel we can remove it from the required components

settings get org.mate.session.required-components panel

# Then kill it

killall mate-panel

echo "Now log out and in"
