#include "ft_ping.h"

void ping(int sockfd, t_destination dest, int *pingloop, t_msg *msg, FT_FLAGS *flags)
{
    int msg_count = 0, msg_recv = 0;
    int flag = 1;
    int k;
    int sstatus;
    int addr_len;
    struct timespec start, end;

    struct ping_pkt pkt;

    printf("PING %s (%s) 64 bytes of data\n", dest.ping_dest, dest.ipstr);

    while (*pingloop){
        flag = 1;

        // fill out ICMP packet
        bzero(&pkt, sizeof(pkt));

        pkt.hdr.type = ICMP_ECHO;
        pkt.hdr.un.echo.id = getpid();
        for (k = 0; k < sizeof(pkt.msg) - 1; k++){
            pkt.msg[k] = k + '0';
        }
        pkt.msg[k] = 0;
        pkt.hdr.un.echo.sequence = msg_count++;
        pkt.hdr.checksum = checksum(&pkt, sizeof(pkt));

        usleep(PING_SLEEP_RATE);

        // send the packet
        clock_gettime(CLOCK_MONOTONIC, &start);
        struct sockaddr *tmp = dest.info->ai_addr;
        sstatus = sendto(sockfd, &pkt, sizeof(pkt), 0, tmp, sizeof(*tmp));
        if (sstatus <= 0)
            // fprintf(stderr, "\nPacket sending failed: %d - %s \n", sstatus, gai_strerror(sstatus));
            flag = 0;

        // recieve pkt.
        struct sockaddr_in r_addr;
        addr_len = sizeof(r_addr);

        sstatus = recvfrom(sockfd, &pkt, sizeof(pkt), 0, (struct sockaddr *)&r_addr, &addr_len);
        if (sstatus <= 0 && msg_count > 1){
            // printf("\n Packet recieve failed");
        }
        else{
            clock_gettime(CLOCK_MONOTONIC, &end);

            double timeElapsed = ((double)(end.tv_nsec - start.tv_nsec))/1000000.0;
            long double rtt_msec = (end.tv_sec -start.tv_sec) * 1000.0 + timeElapsed;

            if (flag){
                if (!(pkt.hdr.type == 69 && pkt.hdr.code == 0)){
                    // printf("Error... packet recieved with ICMP type %d, code %d\n",
                    // pkt.hdr.type, pkt.hdr.code);
                    if (flags->v ==1)
                        printf("%d bytes from %s (%s): mesg_seq=%d ttl=%d rtt=%Lf ms.\n",
                                64, dest.info->ai_canonname, dest.ipstr, msg_count, 64, rtt_msec);
                }
                else {
                    printf("%d bytes from %s (%s): icmp_seq=%d ttl=%d rtt=%Lf ms\n",
                                64, dest.fqdn, dest.ipstr, msg_count, 64, rtt_msec);
                    msg_recv++;
                }
            }
        }
    }

    msg->total_sent = msg_count;
    msg->received = msg_recv;
}