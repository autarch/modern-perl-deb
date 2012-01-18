#
# Regular cron jobs for the perl package
#
0 4	* * *	root	[ -x /usr/bin/perl_maintenance ] && /usr/bin/perl_maintenance
