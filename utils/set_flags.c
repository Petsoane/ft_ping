/**
 * Processes all the flags given...
 *
 * It returns 0 on successful processing of flags, 
 * else it will return -1.
 * 
 */

#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include "../ft_ping.h"


int set_flags(char *input_string, FT_FLAGS MY_FLAGS)
{
	int start_point = 1;
	int status = 0;

	while (input_string[start_point]){
		switch(input_string[start_point]){
			case 'h': MY_FLAGS.h = 1; break;
			case 'v': MY_FLAGS.v = 1; break;
			default:  status = -1; break;
		}
		start_point++;
	}

	return status;
}
