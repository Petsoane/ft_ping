/**
 * Recreating the ping command.
 */
#include "ft_ping.h"
#include "libft/libft.h"

int pingloop = 1;

void intHandler(int dummy){
	pingloop = 0;
}

int main(int argc, char ** argv)
{
	t_destination 	destination;
	t_msg 			msg;
	int 			param_count;
	FT_FLAGS 		flags;
	char			ipstr[INET6_ADDRSTRLEN];
	struct			timespec time_from_start, time_from_end;

	struct ping_pkt	pkt;

	if (argc < 2){
		usage("./ft_ping");
		return (0);
	}
	// init program start.
	if (init(argc, argv, &flags, &destination) != 0){
		return (2);
	}
	if (flags.h == 1){
		help();
		return (0);
	}
	if (flags.v == 1 && argc < 3){
		usage("./ft_ping");
		return (1);
	}

	/* main ping loop starts here */
	// open a raw socket connection.
	int sockfd = socket(AF_INET, SOCK_RAW, IPPROTO_ICMP);
	if (sockfd < 0 ){
		fprintf(stderr, "ft_ping: socket creation: %s", gai_strerror(sockfd));
		return (1);
	}

	// set ttl value
	int ttl_val = 64;
	int sstatus = setsockopt(sockfd, SOL_IP, IP_TTL, &ttl_val, sizeof(ttl_val));
	if ( sstatus != 0){
		fprintf(stderr, "ttl_val: %s", gai_strerror(sstatus));
		return 1;
	}

	// set timout for recv function
	struct timeval time_out;
	int RECV_TIMEOUT = 1;

	time_out.tv_sec = RECV_TIMEOUT;
	time_out.tv_usec = 0;

	sstatus = setsockopt(sockfd, SOL_SOCKET, SO_RCVTIMEO, (const char *)&time_out, sizeof time_out);
	if (sstatus != 0){
		fprintf(stderr, "Error setting timeout value: %s", gai_strerror(sstatus));
		return (1);
	}

	// Set the signal interrupt handler.
	signal(SIGINT, intHandler);

	// clock the current time, ping and clock the closing time.
	clock_gettime(CLOCK_MONOTONIC, &time_from_start);
	ping(sockfd, destination, &pingloop, &msg, &flags);
	clock_gettime(CLOCK_MONOTONIC, &time_from_end);

	// calculate the time it took to run the ping.
	double timeElapsed = ((double)(time_from_end.tv_nsec
							- time_from_start.tv_nsec)) / 1000000.0;
	double total_msec = 0;
	total_msec = (time_from_end.tv_sec - time_from_start.tv_sec) * 1000.0 + timeElapsed;

	// Print the statistics for the ping..
	printf("\n===%s ping statistics===\n", destination.info->ai_canonname);
	printf("\n%d packets sent, %d packets received, %.3f percent packet loss. Total time: %.3f ms.\n\n",
				msg.total_sent, msg.received, ((msg.total_sent - msg.received) / msg.total_sent)*100.0, total_msec);

	return (0);

}
