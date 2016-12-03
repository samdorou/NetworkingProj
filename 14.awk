BEGIN {
    time1 = 0.0;
    time2 = 0.0;

    bytes_count_for_14to27 = 0;
    highest_packet_id_14to27 = 0;
    packet_count_for_14to27 = 0;
    packet_count_received_for_14to27 = 0;
    packet_dropped_for_14to27 = 0;
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
	throughput = bytes_count_for_14to27 / (time2 - time1);
	printf("%f \t %f\n", time2, throughput) > "14throughput.xls";

	packet_average_sent = packet_count_for_14to27 / (time2 - time1);
	printf("%f \t %f\n", time2, packet_average_sent) > "14sent.xls";

	packet_average_received = packet_count_received_for_14to27 / (time2 - time1);
	printf("%f \t %f\n", time2, packet_average_received) > "14received.xls";

	packet_average_dropped = packet_dropped_for_14to27 / (time2 - time1);
	printf("%f \t %f\n", time2, packet_average_dropped) > "14dropped.xls";

	time1 = time;

	bytes_count_for_14to27 = 0;
	packet_count_for_14to27 = 0;
	packet_count_received_for_14to27 = 0;
	packet_dropped_for_14to27 = 0;
    }

    if (action == "r" && to == 27 && type == "exp") {
	bytes_count_for_14to27 += pktsize;
	num_packets_14to27++;
    }

    if (action == "r" && to == 0 && flow_id == 14027) {
	packet_count_for_14to27++;
    }

    if (action == "r" && to == 27  && flow_id == 14027) {
	packet_count_received_for_14to27++;
    }

    if (action == "d" && flow_id == 14027) {
	packet_dropped_for_14to27++;
    }

    if (packet_id > highest_packet_id_14to27 && flow_id == 14027)
	highest_packet_id_14to27 = packet_id;

    if ( start_time[packet_id] == 0 ) {
	start_time[packet_id] = time;
	flow_ID[packet_id] = flow_id;
	
	pkt_seqno[packet_id] = seq_no;
	start_time[packet_id] = time;

    }

    if ( flow_id == 14027 && action != "d" ) {
	if ( action == "r" )
	    end_time[packet_id] = time
	else
	    end_time[packet_id] = -1;
    }
}

END {
    last_seqno = 0;
    last_delay = 0;
    seqno_diff = 0;

    for ( packet_id = 0; packet_id <= highest_packet_id_14to27; packet_id++ ) {
	if (flow_ID[packet_id] == 14027) {
	    start = start_time[packet_id];
	    end = end_time[packet_id];
	    packet_duration = end - start;

	    if ( start < end) {
		printf("%f \t %f\n", start, packet_duration) > "14delay.xls";

		seqno_diff = pkt_seqno[packet_id] - last_seqno;
		delay_diff = packet_duration - last_delay;

		if (seqno_diff == 0) {
		    jitter = 0;
		}

		else {
		    jitter = delay_diff/seqno_diff;
		}

		printf("%f \t %f\n", start, jitter) > "14jitter.xls";

		last_seqno = pkt_seqno[packet_id];
		last_delay = packet_duration;
	    }
	}
    }
}
