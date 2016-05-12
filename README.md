puppetrunner
=======

Allow you to run puppet agent -t on remote machines with --detailed-exitcodes

Here's are some examples of a script, let's call it `run.sh`, that could drive this:

invocation: `run.sh server2012r2a.pdx.puppet.vm`

```
#!/bin/bash

puppet_exit_code=$(su - peadmin -c "mco rpc puppetrunner run -I $1" | grep "Return Value:" | cut -d: -f2 | tr -d [[:space:]])

case "$puppet_exit_code" in
  0)
    status="success";;
  2)
    status="success";;
  1)
    status="failure";;
  4)
    status="failure";;
  6)
    status="failure";;
  *)
    status="error: valid exit codes for puppet are [0,1,2,4,6] but got: $puppet_exit_code";;
esac

echo $status
```

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
