#Create a simulator object
set ns [new Simulator]

#Create a trace file
set tracefd [open ourTraceFile.tr w]
$ns trace-all $tracefd

#Create 29 nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]
set n7 [$ns node]
set n8 [$ns node]
set n9 [$ns node]
set n10 [$ns node]
set n11 [$ns node]
set n12 [$ns node]
set n13 [$ns node]
set n14 [$ns node]
set n15 [$ns node]
set n16 [$ns node]
set n17 [$ns node]
set n18 [$ns node]
set n19 [$ns node]
set n20 [$ns node]
set n21 [$ns node]
set n22 [$ns node]
set n23 [$ns node]
set n24 [$ns node]
set n25 [$ns node]
set n26 [$ns node]
set n27 [$ns node]

#Create a duplex link between the nodes
$ns duplex-link $n0 $n13 1Mb 20ms DropTail
$ns duplex-link $n0 $n14 1Mb 20ms DropTail
$ns duplex-link $n0 $n15 1Mb 20ms DropTail
$ns duplex-link $n0 $n16 1Mb 20ms DropTail

$ns duplex-link $n1 $n7 1Mb 20ms DropTail
$ns duplex-link $n1 $n8 1Mb 20ms DropTail
$ns duplex-link $n1 $n9 1Mb 20ms DropTail
$ns duplex-link $n1 $n10 1Mb 20ms DropTail
$ns duplex-link $n1 $n11 1Mb 20ms DropTail
$ns duplex-link $n1 $n12 1Mb 20ms DropTail

$ns duplex-link $n4 $n17 1Mb 20ms DropTail
$ns duplex-link $n4 $n18 1Mb 20ms DropTail
$ns duplex-link $n4 $n19 1Mb 20ms DropTail
$ns duplex-link $n4 $n20 1Mb 20ms DropTail

$ns duplex-link $n5 $n21 1Mb 20ms DropTail
$ns duplex-link $n5 $n22 1Mb 20ms DropTail
$ns duplex-link $n5 $n23 1Mb 20ms DropTail
$ns duplex-link $n5 $n24 1Mb 20ms DropTail

$ns duplex-link $n6 $n25 1Mb 20ms DropTail
$ns duplex-link $n6 $n26 1Mb 20ms DropTail
$ns duplex-link $n6 $n27 1Mb 20ms DropTail

$ns duplex-link $n0 $n2 2Mb 40ms DropTail
$ns duplex-link $n2 $n4 2Mb 40ms DropTail
$ns duplex-link $n3 $n5 2Mb 40ms DropTail
$ns duplex-link $n3 $n6 2Mb 40ms DropTail
$ns duplex-link $n1 $n2 8Mb 50ms DropTail
$ns duplex-link $n1 $n3 8Mb 50ms DropTail
$ns duplex-link $n2 $n3 8Mb 50ms DropTail


#Create a TCP agent and attach it to node n9
set tcp0 [new Agent/TCP]
$ns attach-agent $n9 $tcp0

##Setup a FTP over TCP connection
set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ftp0 set type_ FTP


#Create a TCP agent and attach it to node n9
set tcp1 [new Agent/TCP]
$ns attach-agent $n9 $tcp1

###Setup a FTP over TCP connection
set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1
$ftp1 set type_ FTP




#Create a TCP agent and attach it to node n9
set tcp2 [new Agent/TCP]
$ns attach-agent $n9 $tcp2

###Setup a FTP over TCP connection
set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2
$ftp2 set type_ FTP
#

#Create a TCP agent and attach it to node n9
set tcp3 [new Agent/TCP]
$ns attach-agent $n9 $tcp3
#
####Setup a FTP over TCP connection
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3
$ftp3 set type_ FTP

#Create a TCP agent and attach it to node n9
set tcp4 [new Agent/TCP]
$ns attach-agent $n9 $tcp4
#
####Setup a FTP over TCP connection
set ftp4 [new Application/FTP]
$ftp4 attach-agent $tcp4
$ftp4 set type_ FTP
#

#Create a TCP agent and attach it to node n9
set tcp5 [new Agent/TCP]
$ns attach-agent $n9 $tcp5
#
####Setup a FTP over TCP connection
set ftp5 [new Application/FTP]
$ftp5 attach-agent $tcp5
$ftp5 set type_ FTP
#

#Create a TCPSink agent (a traffic sink) and attach it to node n12
set sink0 [new Agent/TCPSink]
$ns attach-agent $n12 $sink0

#Create a TCPSink agent (a traffic sink) and attach it to node n14
set sink1 [new Agent/TCPSink]
$ns attach-agent $n14 $sink1

#Create a TCPSink agent (a traffic sink) and attach it to node n15
set sink2 [new Agent/TCPSink]
$ns attach-agent $n15 $sink2

#Create a TCPSink agent (a traffic sink) and attach it to node n20
set sink3 [new Agent/TCPSink]
$ns attach-agent $n20 $sink3

#Create a TCPSink agent (a traffic sink) and attach it to node n23
set sink4 [new Agent/TCPSink]
$ns attach-agent $n23 $sink4

#Create a TCPSink agent (a traffic sink) and attach it to node n27
set sink5 [new Agent/TCPSink]
$ns attach-agent $n27 $sink5

#Connect the traffic source with the traffic sink
$ns connect $tcp0 $sink0

#Connect the traffic source with the traffic sink
$ns connect $tcp1 $sink1

#Connect the traffic source with the traffic sink
$ns connect $tcp2 $sink2

#Connect the traffic source with the traffic sink
$ns connect $tcp3 $sink3

#Connect the traffic source with the traffic sink
$ns connect $tcp4 $sink4
#
##Connect the traffic source with the traffic sink
$ns connect $tcp5 $sink5

$tcp0 set fid_ 10
$tcp1 set fid_ 11
$tcp2 set fid_ 12
$tcp3 set fid_ 13
$tcp4 set fid_ 14
$tcp5 set fid_ 15

#Create a UDP agent and attach it to node n13
set udp0 [new Agent/UDP]
$ns attach-agent $n13 $udp0

#Create a UDP agent and attach it to node n13
set udp1 [new Agent/UDP]
$ns attach-agent $n13 $udp1

#Create a UDP agent and attach it to node n13
set udp2 [new Agent/UDP]
$ns attach-agent $n13 $udp2

#Create a UDP agent and attach it to node n13
set udp3 [new Agent/UDP]
$ns attach-agent $n13 $udp3

#Create a UDP agent and attach it to node n13
set udp4 [new Agent/UDP]
$ns attach-agent $n13 $udp4

#Create a UDP agent and attach it to node n13
set udp5 [new Agent/UDP]
$ns attach-agent $n13 $udp5

#Create a UDP agent and attach it to node n13
set udp6 [new Agent/UDP]
$ns attach-agent $n13 $udp6

#Create a UDP agent and attach it to node n13
set udp7 [new Agent/UDP]
$ns attach-agent $n13 $udp7


# Create a CBR traffic source and attach it to udp0
set cbr013 [new Application/Traffic/CBR]
$cbr013 set packetSize_ 800
$cbr013 set interval_ 0.005
$cbr013 set random_ 1
$cbr013 attach-agent $udp0


#Create a CBR traffic source and attach it to udp1
set cbr113 [new Application/Traffic/CBR]
$cbr113 set packetSize_ 800
$cbr113 set interval_ 0.005
$cbr113 set random_ 1
$cbr113 attach-agent $udp1


#Create a CBR traffic source and attach it to udp2
set cbr213 [new Application/Traffic/CBR]
$cbr213 set packetSize_ 800
$cbr213 set interval_ 0.005
$cbr213 set random_ 1
$cbr213 attach-agent $udp2


#Create a CBR traffic source and attach it to udp3
set cbr313 [new Application/Traffic/CBR]
$cbr313 set packetSize_ 800
$cbr313 set interval_ 0.005
$cbr313 set random_ 1
$cbr313 attach-agent $udp3


#Create a CBR traffic source and attach it to udp4
set cbr413 [new Application/Traffic/CBR]
$cbr413 set packetSize_ 800
$cbr413 set interval_ 0.005
$cbr413 set random_ 1
$cbr413 attach-agent $udp4


#Create a CBR traffic source and attach it to udp5
set cbr513 [new Application/Traffic/CBR]
$cbr513 set packetSize_ 800
$cbr513 set interval_ 0.005
$cbr513 set random_ 1
$cbr513 attach-agent $udp5


#Create a CBR traffic source and attach it to udp6
set cbr613 [new Application/Traffic/CBR]
$cbr613 set packetSize_ 800
$cbr613 set interval_ 0.005
$cbr613 set random_ 1
$cbr613 attach-agent $udp6


#Create a CBR traffic source and attach it to udp7
set cbr713 [new Application/Traffic/CBR]
$cbr713 set packetSize_ 800
$cbr713 set interval_ 0.005
$cbr713 set random_ 1
$cbr713 attach-agent $udp7


#Create a Null agent (a traffic sink) and attach it to node n8,n11,n17,n19,n21,n24,n25,n26
set null0 [new Agent/Null]
$ns attach-agent $n8 $null0

set null1 [new Agent/Null]
$ns attach-agent $n11 $null1

set null2 [new Agent/Null]
$ns attach-agent $n17 $null2

set null3 [new Agent/Null]
$ns attach-agent $n19 $null3

set null4 [new Agent/Null]
$ns attach-agent $n21 $null4

set null5 [new Agent/Null]
$ns attach-agent $n24 $null5

set null6 [new Agent/Null]
$ns attach-agent $n25 $null6

set null7 [new Agent/Null]
$ns attach-agent $n26 $null7

#Connect the traffic source with the traffic sink
$ns connect $udp0 $null0

#Connect the traffic source with the traffic sink
$ns connect $udp1 $null1

#Connect the traffic source with the traffic sink
$ns connect $udp2 $null2

#Connect the traffic source with the traffic sink
$ns connect $udp3 $null3

#Connect the traffic source with the traffic sink
$ns connect $udp4 $null4

#Connect the traffic source with the traffic sink
$ns connect $udp5 $null5

#Connect the traffic source with the traffic sink
$ns connect $udp6 $null6

#Connect the traffic source with the traffic sink
$ns connect $udp7 $null7 

$udp0 set fid_ 20
$udp1 set fid_ 21
$udp2 set fid_ 22
$udp3 set fid_ 23
$udp4 set fid_ 24
$udp5 set fid_ 25
$udp6 set fid_ 26
$udp7 set fid_ 27



#Create a UDP agent and attach it to node n10
set udp10 [new Agent/UDP]
$ns attach-agent $n10 $udp10

#Create a UDP agent and attach it to node n16
set udp16 [new Agent/UDP]
$ns attach-agent $n16 $udp16


#Create an Expoo traffic agent and set its configuration parameters
set  exptraffic1 [new Application/Traffic/Exponential]
$exptraffic1 set packetSize_ 2000
$exptraffic1 set burst_time_ 2.5
$exptraffic1 set idle_time_ 1
$exptraffic1 set rate_ 1200000


#Create an Expoo traffic agent and set its configuration parameters
set exptraffic2 [new Application/Traffic/Exponential]
$exptraffic2 set packetSize_ 2000
$exptraffic2 set burst_time_ 2.5
$exptraffic2 set idle_time_ 1
$exptraffic2 set rate_ 1200000


# Attach traffic source to the traffic generator
$exptraffic1 attach-agent $udp10
$exptraffic2 attach-agent $udp16
#
# #Create a LossMonitor agent and attach it to node n18
 set lm1 [new Agent/LossMonitor]
 $ns attach-agent $n18 $lm1
#

#Create a LossMonitor agent and attach it to node n18
set lm2 [new Agent/LossMonitor]
$ns attach-agent $n18 $lm2


#
# #Connect the traffic source with the traffic sink
 $ns connect $udp10 $lm1
#
#
 #Connect the traffic source with the traffic sink
 $ns connect $udp16 $lm2
#
$udp10 set fid_ 31
$udp16 set fid_ 32

#
 #Set Queue Size of link (n0-n13,14,15,16) to 10
 $ns queue-limit $n0 $n13 10
 $ns queue-limit $n0 $n14 10
 $ns queue-limit $n0 $n15 10
 $ns queue-limit $n0 $n16 10
#
 #Set Queue Size of link (n4-n17,18,19,20) to 10
 $ns queue-limit $n4 $n17 10
 $ns queue-limit $n4 $n18 10
 $ns queue-limit $n4 $n19 10
 $ns queue-limit $n4 $n20 10
#
 #Set Queue Size of link (n0-n13,14,15,16) to 10
 $ns queue-limit $n5 $n21 10
 $ns queue-limit $n5 $n22 10
 $ns queue-limit $n5 $n23 10
 $ns queue-limit $n5 $n24 10

 #Set Queue Size of link (n6-n25,26,27) to 10
 $ns queue-limit $n6 $n25 10
 $ns queue-limit $n6 $n26 10
 $ns queue-limit $n6 $n27 10

 #Set Queue Size of link (n1-n7,8,9,10,11,12) to 10
 $ns queue-limit $n1 $n7 10
 $ns queue-limit $n1 $n8 10

$ns queue-limit $n1 $n9 10
$ns queue-limit $n1 $n10 10
$ns queue-limit $n1 $n11 10
$ns queue-limit $n1 $n12 10

#Set Queue Size of link (n0-n2) to 15
$ns queue-limit $n0 $n2 15

#Set Queue Size of link (n2-n4) to 15
$ns queue-limit $n2 $n4 15

#Set Queue Size of link (n3-n5) to 15
$ns queue-limit $n3 $n5 15

##Set Queue Size of link (n3-n6) to 15
$ns queue-limit $n3 $n6 15

##Set Queue Size of link (n1-n2) to 20
$ns queue-limit $n1 $n2 20

#Set Queue Size of link (n1-n3) to 20
$ns queue-limit $n1 $n3 20

#Set Queue Size of link (n2-n3) to 20
$ns queue-limit $n2 $n3 20
#
#
#
#
##Schedule events for the CBR and FTP agents
#
#
#
$ns at 1.0 "$ftp0 start"
$ns at 1.0 "$cbr013 start"
$ns at 1.0 "$ftp1 start"
#
#
$ns at 2.0 "$cbr113 start"
$ns at 2.0 "$ftp2 start"
$ns at 2.0 "$cbr213 start"
#
$ns at 3.0 "$cbr313 start"
$ns at 3.0 "$exptraffic1 start"
$ns at 3.0 "$cbr413 start"
#
#
$ns at 4.0 "$cbr513 start"
$ns at 4.0 "$ftp3 start"
$ns at 4.0 "$cbr613 start"
#
$ns at 5.0 "$ftp4 start"
$ns at 5.0 "$cbr713 start"
$ns at 5.0 "$ftp5 start"
#
$ns at 6.0 "$exptraffic2 start"
#
$ns rtmodel-at 7.0 down $n1 $n3
$ns rtmodel-at 8.0 up $n1 $n3
#
$ns at 10.0 "$exptraffic2 stop"
#
$ns at 10.0 "$ftp5 stop"
$ns at 10.0 "$cbr713 stop"
$ns at 10.0 "$ftp4 stop"
#
$ns at 10.0 "$cbr613 stop"
$ns at 10.0 "$ftp3 stop"
$ns at 10.0 "$cbr513 stop"
#
$ns at 10.0 "$cbr413 stop"
$ns at 10.0 "$exptraffic1 stop"
$ns at 10.0 "$cbr313 stop"
#
$ns at 10.0 "$cbr213 stop"
$ns at 10.0 "$ftp2 stop"
$ns at 10.0 "$cbr113 stop"
#
$ns at 10.0 "$ftp1 stop"
$ns at 11.0 "$cbr013 stop"
$ns at 10.0 "$ftp0 stop"
#


#Run the simulation
$ns run