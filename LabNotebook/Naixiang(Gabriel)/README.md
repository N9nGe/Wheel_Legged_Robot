# Naixiang(Gabriel) Gao Development Log
1. [Motor Selection](#MotorSelection)
2. [Establish Physical Model](#PhysicalModel)

# Motor Selection <a name="MotorSelection"></a>
### Wheel Motors
1. Better for direct drive motor(withour gearbox).
2. Output torque should be approximately linear and be stable at the low speed.
3. Accept high power input.

The reason is that we want to use this motor as a "torque controller", which can decrease the complexity of the whole model. Gaps between the gear sets may affect the efficiency of the torque output and the accuracy of the returned data. Also, we don't want the output unstable, resulting in oscillating or even disrupted equilibrium states. 

### Leg Motors
1. Stable data communication at high voltage or high power.
2. Excellent heat dissipation.
3. The peak of output torque $\ge 20 N\cdot m$ 

The reason is that we want the motor can receive and send the data or signal when we have instantaneous large torque. The instantaneous large torque will lead the instantaneous large power, which might interfere with the data signal. When we use the motor to output a large torque, we need to ensure its excellent heat dissipation to avoid burn it. When the robot is descending stairs, we need to have enough torque to counter the falling momentum of the robot.

# Establish Physical Model <a name="PhysicalModel"></a>