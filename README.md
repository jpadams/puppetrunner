puppetrunner
=======
MCO plugin that allows you to run puppet agent -t on remote machines with --detailed-exitcodes
https://docs.puppet.com/puppet/latest/reference/man/agent.html#OPTIONS

Updated for PE 2015 and beyond. Works on *nix and Windows. To use, add this module to your Puppetfile and then classify the master and all agents that you want to control with the `puppetrunner` class. Run puppet to have the MCO plugins installed, then you're good to go. Invoke the plugin using MCO basic RPC style invocation.

example command-line invocation: `su - peadmin -c "mco rpc puppetrunner run -I server2012r2a.pdx.puppet.vm"`

If you're automating testing or deployment, here are some examples of a script, let's call it `run.sh`, that could drive puppetrunner. You could have such a script called by a CI/CD system to have Puppet prepare a system by configuring OS, installing middleware, and deploying an application, for example:

example script invocation: `run.sh server2012r2a.pdx.puppet.vm`

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
