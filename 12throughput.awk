#Esmond Liang & Sam Doroudi

BEGIN {
    time1 = 0.0;
    time2 = 0.0;

    bytes_count_for_12to28 = 0;
}

{
    action = $1;
    time = $2;
    from = $3;
    to = $4;
    type = $5;
    pktsize = $6;
    flow_id = $8;
    src = $9;
    dst = $10;
    seq_no = $11;
    packet_id = $12;

    time2 = time;

    if (time2 - time1 > 0.5) {
	throughput = bytes_count_for_12to28 / (time2 - time1);
	printf("%f \t %f\n", time2, throughput) > "12throughput.xls";

	time1 = time;

	bytes_count_for_12to28 = 0;
    }

    if (action == "r" && to == 28 && type == "tcp" && flow_id == 12028) {
	bytes_count_for_12to28 += pktsize;
	num_packets_12to28++;
    }
}
