#!/bin/bash

. /utils.sh

echo "args: $@"

echo "This is a test execution"
echo "happy: $happy"

./out_test.sh

execScript() {
    script=$1
    $script
    exitCode=$?
    [ $exitCode -ne 0 ] && exit $exitCode
}
echo "action: $externalAction"

print_log "This is log message for action: $action"

result="hostName: testsite
ipAddress: 192.168.1.8
environment:
   hello: nice
   foo: 323
   Foo: 323
   FoO: 323
   instanceName: test_instance
   instanceType: dummy
   serviceType: custom"

print_ext_service_result "$result"