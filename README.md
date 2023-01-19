# Schunk Robots 

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

If you want to set or get certain values from robot that correspond to 
address in robot object dictionary, it's possible to use following 
ROS service call: 
```
rosservice call /lwa4p/driver/get_object "node: 'lwa4p_joint6' object: '6062' cached: false" 
success: True message: '' value: "52715"
```

TODO: 
- [ ] Find out how to reset current joint positions with SDO request
 
