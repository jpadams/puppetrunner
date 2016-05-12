puppetrunner
=======

Allow you to run puppet agent -t on remote machines with --detailed-exitcodes

Here's an example of a script that could drive this:

```
#!/bin/bash

puppet_exit_code=$(su - peadmin -c "mco rpc puppetrunner run -I $1" | grep "Return Value:" | cut -d: -f2 | tr -d [[:space:]])

case "$puppet_exit_code" in
  0)
    status="run succeeded with no changes and no failures";;
  1)
    status="run failed or aborted due to run already in progress";;
  2)
    status="run succeeded with some changes";;
  4)
    status="run succeeded with some failures";;
  6)
    status="run succeeded with both some changes and some failures";;
  *)
    status="error: valid exit codes for puppet are [0,1,2,4,6] but got: $puppet_exit_code";;
esac

echo $status
```
