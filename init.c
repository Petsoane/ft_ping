#include "ft_ping.h"


int init(int argc, char **argv, FT_FLAGS *flags, t_destination *dest)
{
    int i = 1;
    char *tmp;
    char *out;

    for (; i < argc; i++){
        tmp = ft_strtrim(argv[i]);

        if (tmp[0] == '-'){
            if (set_flags(tmp, *flags)){
                puts("Invalid parameter.");
                free(tmp);
                return (-1);
            }
            free(tmp);
        }
        else {
            out = tmp;
        }
    }

    // check the arguments.
    if (argc - i - 1 == 0 ){
        usage(argv[0]);
        return (-1);
    }

    dest->ping_dest = ft_strdup(out);
    free(out);

   	// get addres information.
	if (get_dest_info(dest) != 0) return (-1);

    struct sockaddr_in *ipv4 = (struct sockaddr_in *)dest->info->ai_addr;
    void *addr = &(ipv4->sin_addr);
    inet_ntop(dest->info->ai_family, addr, dest->ipstr, sizeof(dest->ipstr));

    return 0;
}
