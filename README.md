# ft_ping
This project is about recoding the ping command.

# What is ping?
Ping is a simple internet tool allowing users to check if a particular IP address exists and can accept requests.

# How does it work?
Ping uses a series of ICMP Echo messages to check if the remote host is active, how long does each echo request take, and if the destination can get an echo reply within the timeout limit.

By default, the ping command sends several echo requests. The result of each echo request is displayed as how many bytes were recieved, the time to live (TTL), how long it took to respond, and some statistics about packet loss and round trip times.

# What is ICMP?
ICMP stands for Internet Controll Message Protocol. This protocol works on the device level and generates error messages when issies prevent IP packets from getting through.

# Important instructions and contraints
* Use a makefile for the compilation of the project.
* Code must be norm complient (?)
* All errors must handled. The program should not quit unexpectedly.
* The result must be identical to the real ping command, baring the RTT line.
* Allowed functions:
	* getpid
	* getuid
	* getaddrinfo
	* gettimeofday
	* inet_ntop
	* inet_pton
	* exit
	* signal
	* alarm
	* setsocketopt
	* recvmsg
	* sendto
	* socket
	* printf (and all varients)
	* My libft

* DO NOT USE:
	* fcntl, poll, ppoll functions..

# Mandatory requirements.
* The executable should be named ft_ping.
* Manage -h and -v options.
* Manage simple IPv4 pings.
* manage FQDN without doing DNS resolution in the packet return.


# Bonuses
* IPv6 management.
* Additional flags -f -m -l -L ....

