#include "ft_ping.h"
#include <netdb.h>

void ping(int sockfd, struct addrinfo *info, int *pingloop)
{
    int msg_count = 0;
    int flag = 1;
    int k;
    int sstatus;
    int addr_len;

    struct ping_pkt pkt;

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

        struct sockaddr *tmp = info->ai_addr;
        sstatus = sendto(sockfd, &pkt, sizeof(pkt), 0, tmp, sizeof(*tmp));
        if (sstatus <= 0){
            fprintf(stderr, "\nPacket sending failed: %d - %s \n", sstatus, gai_strerror(sstatus));
            flag = 0;
        }

        // recieve pkt.
        struct sockaddr_in r_addr;
        addr_len = sizeof(r_addr);

        sstatus = recvfrom(sockfd, &pkt, sizeof(pkt), 0, (struct sockaddr *)&r_addr, &addr_len);
        if (sstatus <= 0 && msg_count > 1){
            printf("\n Packet recieve failed");
        }
        else{
            if (flag){
                if (!(pkt.hdr.type == 69 && pkt.hdr.code == 0)){
                    printf("Error... packet recieved with ICMP type %d, code %d\n",
                    pkt.hdr.type, pkt.hdr.code);
                }
                else {
                    printf("ping recieved");
                }
            }
        }
    }
}