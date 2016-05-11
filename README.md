puppetrunner
=======

Allow you to run puppet agent -t on remote machines with --detailed-exitcodes

This means that you'll be able to see if:
 - no changes were needed => 0
 - changes were applied successfully => 2
 - it was a failure => 4
 - there was a mix of successful changes and failure => 6
