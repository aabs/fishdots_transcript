#!/usr/bin/env fish

function x -d 'dispatcher'

  switch $argv[1]
    case t
      sed -e "s/TITLE/$argv[2]/" -e 's/PRIORITY/M/' -e 's/PROJECT/fd/'  event_templates/task.json
  end
end

function _set -a varName key value -d 'add property to JSON formatted property set using JQ'
  if test -z $varName
    set -g $varName "{}"
  end
  set -g $varName (echo $$varName | jq ".$key |= \"$value\"")
end

function _get -a varName key -d 'get property value from JSON formatted property set using JQ'
  echo $$varName | jq ".$key"
end

function create_msg_task -a title pri pro
  test -z pri; or set pri "M"
  test -z pro; or set pro $CURRENT_PROJECT_SN
  set -g r '{"event-type": "task-new"}'
  _set r title $title
  _set r project $pro
  _set r priority $pri
  echo $r
end
