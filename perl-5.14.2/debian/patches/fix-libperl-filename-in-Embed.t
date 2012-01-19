This fixes a bug in the test that occurs when the libperl shared library is
not named libperl.so.

We will make a symlink for libperl.so on install so this fix is only needed
during testing.
--- a/lib/ExtUtils/t/Embed.t
+++ b/lib/ExtUtils/t/Embed.t
@@ -93,6 +93,11 @@
     push(@cmd, '-Zlinker', '/PM:VIO')	# Otherwise puts a warning to STDOUT!
 	if $^O eq 'os2' and $Config{ldflags} =~ /(?<!\S)-Zomf\b/;
     push(@cmd,ldopts());
+    # XXX - hack patch for deb package - we create a libperl.so.5.14.2 and
+    # symlink it during install.
+    @cmd = grep { $_ ne '-lperl' } @cmd;
+    $cmd[-1] =~ s/\n$//;
+    push @cmd, '../libperl.so.5.14.2';
    }
    if ($borl) {
      @cmd = ($cmd[0],(grep{/^-[LI]/}@cmd[1..$#cmd]),(grep{!/^-[LI]/}@cmd[1..$#cmd]));
