###############################################################
# Sam Doroudi & Esmond Liang
# CS436
# Networking Project ns2
###############################################################

#Functions make life easier
##EXP traffic
proc attach-exp-traffic {node sink size burst idle rate id} {
	set ns [Simulator instance]

	#create UDP
	set source [new Agent/UDP]
	$ns attach-agent $node $source

	set traffic [new Application/Traffic/Exponential]
	$traffic set packetSize_ $size
	$traffic set burst_time_ $burst
	$traffic set idle_time_ $idle
	$traffic set rate_ $rate
	$traffic attach-agent $source
	
	#Connect
	$ns connect $source $sink
	$source set fid_ $id
	return $traffic
}

##CBR traffic
proc attach-cbr-traffic {node sink size interval random id} {
	set ns [Simulator instance]

	#create UDP 
	set source [new Agent/UDP]
	$ns attach-agent $node $source

	set traffic [new Application/Traffic/CBR]
	$traffic set packetSize_ $size
	$traffic set interval_ $interval
	$traffic set random_ $random
    
    $traffic attach-agent $source
	#Connect
	$ns connect $source $sink
	$source set fid_ $id
	return $traffic
}

##
proc finish {} {
   # global ns tracefd
    #$ns flush-trace        
    #close $tracefd
    #exec nam trace.nam & 

    #exit 0
    global ns nf
    
    $ns flush-trace
    #Close the trace file
    close $nf

    exit 0
}

#Create a simulator object
set ns [new Simulator]

$ns color 7019 RED
$ns color 14027 BLUE
$ns color 12028 GREEN
$ns color 13028 GREEN

#Create a trace files
set tracefd [open Sam_Esmond.tr w]
$ns trace-all $tracefd

set nf [open Sam_Esmond_Trace.nam w]
$ns namtrace-all $nf

#Create nodes (0 - 28)
#We could've done a for loop
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
set n28 [$ns node]

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
$ns duplex-link $n6 $n28 1Mb 20ms DropTail

$ns duplex-link $n0 $n1 8Mb 50ms DropTail
$ns duplex-link $n0 $n2 8Mb 50ms DropTail
$ns duplex-link $n1 $n3 8Mb 50ms DropTail
$ns duplex-link $n2 $n3 8Mb 50ms DropTail

$ns duplex-link $n2 $n4 2Mb 40ms DropTail
$ns duplex-link $n3 $n5 2Mb 40ms DropTail
$ns duplex-link $n3 $n6 2Mb 40ms DropTail

###

#Set Queue Size of links
#queue limit for YELLOW links
$ns queue-limit $n0 $n13 10
$ns queue-limit $n0 $n14 10
$ns queue-limit $n0 $n15 10
$ns queue-limit $n0 $n16 10

$ns queue-limit $n1 $n7 10
$ns queue-limit $n1 $n8 10
$ns queue-limit $n1 $n9 10
$ns queue-limit $n1 $n10 10
$ns queue-limit $n1 $n11 10
$ns queue-limit $n1 $n12 10

$ns queue-limit $n4 $n17 10
$ns queue-limit $n4 $n18 10
$ns queue-limit $n4 $n19 10
$ns queue-limit $n4 $n20 10

$ns queue-limit $n5 $n21 10
$ns queue-limit $n5 $n22 10
$ns queue-limit $n5 $n23 10
$ns queue-limit $n5 $n24 10

$ns queue-limit $n6 $n25 10
$ns queue-limit $n6 $n26 10
$ns queue-limit $n6 $n27 10
$ns queue-limit $n6 $n28 10

#queue for PURPLE links
$ns queue-limit $n2 $n4 15
$ns queue-limit $n3 $n5 15
$ns queue-limit $n3 $n6 15

#queue for BLACK links
$ns queue-limit $n0 $n1 20
$ns queue-limit $n0 $n2 20
$ns queue-limit $n2 $n3 20
$ns queue-limit $n1 $n3 20

#Create traffic for BLUE
set sink8 [new Agent/LossMonitor]
set sink9 [new Agent/LossMonitor]
set sink11 [new Agent/LossMonitor]
set sink18 [new Agent/LossMonitor]
set sink20 [new Agent/LossMonitor]
set sink23 [new Agent/LossMonitor]
set sink27 [new Agent/LossMonitor]

$ns attach-agent $n14 $sink8
$ns attach-agent $n14 $sink9
$ns attach-agent $n14 $sink11
$ns attach-agent $n14 $sink18
$ns attach-agent $n14 $sink20
$ns attach-agent $n14 $sink23
$ns attach-agent $n14 $sink27


#Create traffic for RED
set sink15 [new Agent/LossMonitor]
set sink16 [new Agent/LossMonitor]
set sink17 [new Agent/LossMonitor]
set sink19 [new Agent/LossMonitor]
set sink21 [new Agent/LossMonitor]
set sink24 [new Agent/LossMonitor]
set sink25 [new Agent/LossMonitor]
set sink26 [new Agent/LossMonitor]

$ns attach-agent $n7 $sink15
$ns attach-agent $n7 $sink16
$ns attach-agent $n7 $sink17
$ns attach-agent $n7 $sink19
$ns attach-agent $n7 $sink21
$ns attach-agent $n7 $sink24
$ns attach-agent $n7 $sink25
$ns attach-agent $n7 $sink26

#Create traffic for GREEN
set sink28_1 [new Agent/LossMonitor]
set sink28_2 [new Agent/LossMonitor]

$ns attach-agent $n28 $sink28_1
$ns attach-agent $n28 $sink28_2

###now connect clients to servers

#RED connection --> server 7
set RED7to15 [attach-cbr-traffic $n7 $sink15 1500 0.005 1 0]
set RED7to16 [attach-cbr-traffic $n7 $sink16 1500 0.005 1 0]
set RED7to17 [attach-cbr-traffic $n7 $sink17 1500 0.005 1 0]
set RED7to19 [attach-cbr-traffic $n7 $sink19 1500 0.005 1 7019]
set RED7to21 [attach-cbr-traffic $n7 $sink21 1500 0.005 1 0]
set RED7to24 [attach-cbr-traffic $n7 $sink24 1500 0.005 1 0]
set RED7to25 [attach-cbr-traffic $n7 $sink25 1500 0.005 1 0]
set RED7to26 [attach-cbr-traffic $n7 $sink26 1500 0.005 1 0]

#BLUE connecton --> server 14
set BLUE14to8  [attach-exp-traffic $n14 $sink8 2000 0.5s 0.5s 2000000 0]
set BLUE14to9  [attach-exp-traffic $n14 $sink9 2000 0.5s 0.5s 2000000 0]
set BLUE14to11 [attach-exp-traffic $n14 $sink11 2000 0.5s 0.5s 2000000 0]
set BLUE14to18 [attach-exp-traffic $n14 $sink18 2000 0.5s 0.5s 2000000 0]
set BLUE14to20 [attach-exp-traffic $n14 $sink20 2000 0.5s 0.5s 2000000 0]
set BLUE14to23 [attach-exp-traffic $n14 $sink23 2000 0.5s 0.5s 2000000 0]
set BLUE14to27 [attach-exp-traffic $n14 $sink27 2000 0.5s 0.5s 2000000 14027]

#Server 12
#TCP at n12
set tcp12 [new Agent/TCP]
$tcp12 set class_ 2 
$ns attach-agent $n12 $tcp12

#CBR traffic at udp12
set GREEN12to28 [new Application/Traffic/CBR]
$GREEN12to28 set packetSize_ 1000
$GREEN12to28 set interval_ 0.005
$GREEN12to28 set random_ 1
$GREEN12to28 attach-agent $tcp12

#Server 13
#TCP at n13
set tcp13 [new Agent/TCP]
$tcp13 set class_ 2
$ns attach-agent $n13 $tcp13

#CBR traffic att udp13
set GREEN13to28 [new Application/Traffic/CBR]
$GREEN13to28 set packetSize_ 1000
$GREEN13to28 set interval_ 0.005
$GREEN13to28 set random_ 1
$GREEN13to28 attach-agent $tcp13

#Green connection --> Server 12 & 13
$ns connect $tcp12 $sink28_1
$tcp12 set fid_ 12028

$ns connect $tcp13 $sink28_2
$tcp13 set fid_ 13028

#Times
$ns at 1.0s "$RED7to15 start"
$ns at 1.0s "$RED7to16 start"
$ns at 1.0s "$RED7to17 start"
$ns at 1.0s "$RED7to19 start"
$ns at 1.0s "$RED7to21 start"
$ns at 1.0s "$RED7to24 start"
$ns at 1.0s "$RED7to25 start"
$ns at 1.0s "$RED7to26 start"

$ns at 2.0s "$BLUE14to8 start"
$ns at 2.0s "$BLUE14to9 start"
$ns at 2.0s "$BLUE14to11 start"
$ns at 2.0s "$BLUE14to18 start" 
$ns at 2.0s "$BLUE14to20 start" 
$ns at 2.0s "$BLUE14to23 start" 
$ns at 2.0s "$BLUE14to27 start" 

$ns at 3.0 "$GREEN12to28 start"
$ns at 4.0 "$GREEN13to28 start"

$ns rtmodel-at 6.0 down $n2 $n3
$ns rtmodel-at 7.0 up $n2 $n3

$ns at 10.0s "$RED7to15 stop"
$ns at 10.0s "$RED7to16 stop"
$ns at 10.0s "$RED7to17 stop"
$ns at 10.0s "$RED7to19 stop"
$ns at 10.0s "$RED7to21 stop"
$ns at 10.0s "$RED7to24 stop"
$ns at 10.0s "$RED7to25 stop"
$ns at 10.0s "$RED7to26 stop"

$ns at 10.0s "$BLUE14to8 stop"
$ns at 10.0s "$BLUE14to9 stop"
$ns at 10.0s "$BLUE14to11 stop"
$ns at 10.0s "$BLUE14to18 stop" 
$ns at 10.0s "$BLUE14to20 stop" 
$ns at 10.0s "$BLUE14to23 stop" 
$ns at 10.0s "$BLUE14to27 stop"

$ns at 10.0s "$GREEN12to28 stop"
$ns at 10.0s "$GREEN13to28 stop"

#Wrap it up
$ns at 10.0 "finish"

#Run
$ns run
