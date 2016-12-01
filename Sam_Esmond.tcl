### Sam Doroudi & Esmond Liang
### CS436

#Create a simulator object
set ns [new Simulator]

#Create a trace file
set tracefd [open Sam_Esmond.tr w]
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

#Create UDP at node 7
set udp0 [new Agent/UDP]
$ns attach-agent $n7 $udp0

#Create CBR traffic attach to udp0
set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 1500
$cbr0 set interval_ 0.005
$cbr0 set random_ 1
$cbr0 attach-agent $udp0

#Set Queue Size of links
#queue limit for yellow links
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

#queue for purple links
$ns queue-limit $n2 $n4 15
$ns queue-limit $n3 $n5 15
$ns queue-limit $n3 $n6 15

#queue for black links
$ns queue-limit $n0 $n1 20
$ns queue-limit $n0 $n2 20
$ns queue-limit $n2 $n3 20
$ns queue-limit $n1 $n3 20

#LossMonitor traffic consumer at dest. per RED connection
#n7 to -->> 15, 16, 17, 19, 21, 24, 25, 26

