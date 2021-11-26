# Schunk robots 

This package contains driver for Schunk LWA4P and LWA4D robotic arms. 

In order to use it and test it please setup `can` as follows: 
```
sudo modprobe peak_usb 
sudo ip link set can0 down
sudo ip link set can0 type can bitrate 500000
sudo ip link set can0 txqueuelen 30 
```

It's also possible to set up those parameters of CAN interface over SocketCAN using 
`/etc/network/interfaces` file as described [here](http://wiki.ros.org/socketcan_interface#Initialize_NIC) in 4.2 
subsection. 

Debugging of CAN messages with `can-utils` can be done as follows: 
```
candump <can_interface> 
``` 
where in our case `<can_interface>` is `can0`. 

After starting SocketCAN can interface on correct baudrate, launch following file to 
start schunk lwa4p driver: 
```
roslaunch schunk_lwa4p schunk_blue.launch
```

If you want to start and initialize robot, call following service: 
```
rosservice call /lwa4p/driver/init
```

At some point I created two config and two launches. 

First one without `bare` prefix is used for specialized separator end effector, 
and another one is used for schunk without separator end effector. 
There are different namespaces and I didn't want to change anything too much to 
make sure i have working configuration for separator end effector.

**At some point, it will be good.  merge those two configs and launches. 
Basically when i fix namespaces for separator end effector. **

TODO: 
- [x] Convert `schunk_blue` to `lwa4p` --> Not neccessary
- [x] Rename joints and controllers 
- [x] Test arm_x_joint_position_controller 
- [x] Test arm_joint_trajectory_controller
- [x] Use schunk driver with gazebo 
- [x] Integrate driver part of this package with [schunk_lwa4p_ros] metapackage that contains all 
relevant packages --> redundant, better if decoupled 
- [ ] Fix namespaces for arm with separator end effector (double lwa4p) 
- [ ] Merge bare and blue into one config file for real robot 
 
