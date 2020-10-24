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

#include "libft/libft.h"

#define MAX_PARAMETERS 20

/* This will be how I process my flags for now. 
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

void usage(char *name);
int set_flags(char *in, FT_FLAGS flags);


#endif