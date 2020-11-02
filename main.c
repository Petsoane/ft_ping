/**
 * Recreating the ping command.
 */
#include "ft_ping.h"
#include <netdb.h>
#include <netinet/in.h>
#include <netinet/ip_icmp.h>
#include <stdio.h>
#include <sys/socket.h>

struct addrinfo *getDestionationInfo(char *node);
	struct ping_pkt{
		struct icmphdr hdr;
		char msg[64 - sizeof(struct icmphdr)];
	};

unsigned short checksum (void *b, int len)
{
	unsigned short *buf = b;
	unsigned int sum =0;
	unsigned short result;

	for ( sum = 0; len > 1; len -= 2){
		sum = *buf++;
	}
	if (len == 1){
		sum += *buf++;

	}

	sum = (sum >> 16) + (sum & 0xFFFF);
	sum += (sum >> 16);
	result -= ~sum;

	return result;	
}

int main(int argc, char ** argv)
{
	char 			*destination;
	int 			param_count;
	FT_FLAGS 		MY_FLAGS;
	char			ipstr[INET6_ADDRSTRLEN];

	struct ping_pkt	pkt;

	// get the flags.
	int i = 1;
	char *tmp;
	for ( ; i < argc; i++){
		tmp = ft_strtrim(argv[i]);

		if (tmp[0] == '-' ){
			
			if (set_flags(tmp, MY_FLAGS) == -1){
				puts("Invalid parameter.");
				return (1);
			}
		}
	}

	// Check the arguments.
	if (argc - i -1  == 0){
		usage(argv[0]);
		return (1);
	}

	destination = ft_strdup(tmp);


	// get addres information.
	struct addrinfo *info = getDestionationInfo(destination);
	if (info == NULL) return (1);

	// // Testing the results of the return statement.
	// struct addrinfo *p;
	// for (p = info; p != NULL; p = p->ai_next){
	// 	void *addr;
	// 	char *ipver;

	// 	// get the pointer of the addres itself
	// 	if (p->ai_family == AF_INET){
	// 		struct sockaddr_in *ipv4 = (struct sockaddr_in *)p ->ai_addr;
	// 		addr = &(ipv4->sin_addr);
	// 		ipver = "IPV$";
	// 	}
	// 	else {
	// 		struct sockaddr_in *raw = (struct sockaddr_in *)p->ai_addr;
	// 	}
	// 	inet_ntop(p->ai_family, addr, ipstr, sizeof ipstr);
	// 	printf("%s: %s\n", p->ai_canonname, ipstr);
	// }
	


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

	


	int msg_count = 0, flag =1;
	for (int i = 0; i < 1000; i++){
		flag = 1;
		// fill icmp packet
		bzero(&pkt, sizeof(pkt));

		pkt.hdr.type = ICMP_ECHO;
		pkt.hdr.un.echo.id = getpid();
		int k =0;
		for ( ; k < sizeof(pkt.msg) -1 ; k++){
			pkt.msg[k] = k + '0';
		}
		pkt.msg[k] = 0;
		pkt.hdr.un.echo.sequence = msg_count++;
		// pkt.hdr.checksum = checksum(&pkt, sizeof(pkt));

		usleep(PING_SLEEP_RATE);

		// send the packet
		struct sockaddr *tmp = info->ai_addr;
		sstatus = sendto(sockfd, &pkt, sizeof(pkt), 0, (struct sockaddr *)tmp, sizeof(*tmp));
		if (sstatus <= 0){
			fprintf(stderr, "\nPacket sending failed: %d - %s \n", sstatus, gai_strerror(sstatus));
			flag = 0;
		}

		// reciev packet
		struct sockaddr_in r_addr;
		int addr_len = sizeof(r_addr);

		sstatus = recvfrom(sockfd, &pkt, sizeof(pkt), 0, (struct sockaddr *)&r_addr, &addr_len);
		if (sstatus <=0 && msg_count > 1){
			printf("\nPacket reciev failed");
		}
		else {
			if (flag){
				if (!(pkt.hdr.type == 69 && pkt.hdr.code == 0)){
					printf("Error... packet recieved with ICMP type %d, code %d \n", pkt.hdr.type, pkt.hdr.code);
				}
				else{
					printf("ping recieved\n");
				}
			}
		}


	}
		printf("Done with the piniging");


	// awit for response

	// fill the icmp echo


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
