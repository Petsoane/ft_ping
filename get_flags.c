#include "ft_ping.h"


int init(int argc, char **argv, FT_FLAGS *flags, char **dest)
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

    *dest = ft_strdup(out);
    free(out);

    return 0;
}