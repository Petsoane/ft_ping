/**
 * Recreating the ping command.
 */
#include "ft_ping.h"

int main(int argc, char ** argv)
{
	char 			*parameters[MAX_PARAMETERS];
	int 			start;
	int 			param_count;
	FT_FLAGS 		MY_FLAGS;


	param_count = 0;
	// get the flags.
	for (int i = 1; i < argc; i++){
		char *tmp = ft_strtrim(argv[i]);
		puts(tmp);
		if (tmp[0] == '-' ){
			puts(tmp);
			if (set_flags(tmp, MY_FLAGS) == -1){
				puts("Invalid parameter.");
				return (1);
			}
		}
		else{
			parameters[param_count++] = ft_strdup(tmp);
		}
	}

	// Check the arguments.
	if (argc == 0 || param_count > 2){
		usage(argv[0]);
		return (1);
	}






	return (0);

}
