/**
 * Recreating the ping command.
 */
#include "ft_ping.h"

int main(int argc, char ** argv)
{
	char 			*destination;
	int 			param_count;
	FT_FLAGS 		MY_FLAGS;

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
	puts(destination);

	
	return (0);

}
