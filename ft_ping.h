/**
 * Recreating the ping command.
 */

#ifndef FT_PING
#define FT_PING
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <netinet/ip_icmp.h>
#include <signal.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <time.h>
#include <unistd.h>

#include "libft/libft.h"


#define PING_SLEEP_RATE 1000

/* 
 * This will be how I process my flags for now. 
 * I am using bitfields cause I only need true or false
 * values for each flag.
 *
 * Maybe later I can then use but manipulation for added speed.
 *
 */
typedef struct {
	int 			h;
	int 			v;
} 					FT_FLAGS;

struct ping_pkt{
	struct icmphdr hdr;
	char msg[64 - sizeof(struct icmphdr)];
};


// Utility functions
void usage(char *name);
int set_flags(char *in, FT_FLAGS flags);

// Core functions
unsigned short checksum (void *b, int len);
int init(int argc, char **argv, FT_FLAGS *flags, char **destination);

void ping(int sockfd, struct addrinfo *info, int *pingloop);
#endif
