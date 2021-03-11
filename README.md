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

TODO: 
- [ ] Convert `schunk_blue` to `lwa4p`
- [ ] Rename joints and controllers 
- [ ] Test arm_x_joint_position_controller 
- [ ] Test arm_joint_trajectory_controller
- [ ] Use schunk driver with gazebo 
- [ ] Integrate driver part of this package with [schunk_lwa4p_ros] metapackage that contains all 
relevant packages 
