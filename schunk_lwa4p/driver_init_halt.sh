#!/bin/bash

bash -c "source /opt/ros/melodic/setup.bash; rosservice call /lwa4p/driver/init {}"
bash -c "source /opt/ros/melodic/setup.bash; resservice call /lwa4p/driver/halt {}"
