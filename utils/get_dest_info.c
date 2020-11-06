#include "../ft_ping.h"

int get_dest_info(t_destination *node)
{
	int status;
	struct addrinfo hints;
	struct addrinfo *destInfo;

	memset(&hints, 0, sizeof hints);
	hints.ai_family  = AF_INET;
	hints.ai_socktype = SOCK_STREAM;
	hints.ai_flags = AI_CANONNAME;

	status = getaddrinfo(node->ping_dest, "0", &hints, &destInfo);

	if (status != 0){
		fprintf(stderr, "ft_ping: %s: %s\n",node->ping_dest, gai_strerror(status));
		return -1;
	}
    node->info = destInfo;
	return 0;
}
