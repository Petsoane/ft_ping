#include "ft_ping.h"
char* reverse_dns_lookup(char *ip_addr) 
{ 
    struct sockaddr_in temp_addr;     
    socklen_t len; 
    char buf[NI_MAXHOST], *ret_buf; 
  
    temp_addr.sin_family = AF_INET; 
    temp_addr.sin_addr.s_addr = inet_addr(ip_addr); 
    len = sizeof(struct sockaddr_in); 
  
    if (getnameinfo((struct sockaddr *) &temp_addr, len, buf,  
                    sizeof(buf), NULL, 0, NI_NAMEREQD))  
    { 
        printf("Could not resolve reverse lookup of hostname\n"); 
        return NULL; 
    } 
    ret_buf = (char*)malloc((strlen(buf) +1)*sizeof(char) ); 
    strcpy(ret_buf, buf); 
    return ret_buf; 
} 

int init(int argc, char **argv, FT_FLAGS *flags, t_destination *dest)
{
    int i = 1;
    char *tmp;
    char *out;

    out = NULL;

    for (; i < argc; i++){
        tmp = ft_strtrim(argv[i]);

        if (tmp[0] == '-'){
            if (set_flags(tmp, flags)){
                puts("Invalid parameter.");
                free(tmp);
                return (-1);
            }
            free(tmp);
        }
        else {
            if (out != NULL){
                help();
                return -1;
            }
            out = tmp;
        }
    }

    // check the arguments.
    if (argc - i - 1 == 0 ){
        usage(argv[0]);
        return (-1);
    }

    if (out == NULL){
        return 0;
    }

    dest->ping_dest = ft_strdup(out);
    free(out);

   	// get addres information.
	if (get_dest_info(dest) != 0) return (-1);

    struct sockaddr_in *ipv4 = (struct sockaddr_in *)dest->info->ai_addr;
    void *addr = &(ipv4->sin_addr);
    inet_ntop(dest->info->ai_family, addr, dest->ipstr, sizeof(dest->ipstr));

    dest->fqdn = reverse_dns_lookup(dest->ipstr);
    return 0;
}


