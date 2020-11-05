/**
 * Recreating the ping command.
 */
#include "ft_ping.h"
#include "libft/libft.h"

struct addrinfo *getDestionationInfo(char *node);
int pingloop = 1;


int main(int argc, char ** argv)
{
	char 			*destination;
	int 			param_count;
	FT_FLAGS 		MY_FLAGS;
	char			ipstr[INET6_ADDRSTRLEN];


	struct ping_pkt	pkt;

	// init program start.
	if (init(argc, argv, &MY_FLAGS, &destination) != 0){
		return (2);
	}


	// get addres information.
	struct addrinfo *info = getDestionationInfo(destination);
	if (info == NULL) return (1);


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


	ping(sockfd, info, &pingloop);
	printf("Done with the piniging");

	return (0);

}

struct addrinfo *getDestionationInfo(char *node)
{
	int status;
	struct addrinfo hints;
	struct addrinfo *destInfo;

	memset(&hints, 0, sizeof hints);
	hints.ai_family  = AF_INET;
	hints.ai_socktype = SOCK_STREAM;
	hints.ai_flags = AI_CANONNAME;

	status = getaddrinfo(node, "0", &hints, &destInfo);

	if (status != 0){
		fprintf(stderr, "ft_ping: %s: %s\n",node, gai_strerror(status));
		return NULL;
	}

	return destInfo;
}
