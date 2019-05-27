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

function create_msg_task -a title pro pri 
  set priority "$pri"; test -z "$priority"; and set priority "M"
  set project "$pro"; test -z "$project"; and set project $CURRENT_PROJECT_SN
  set -g r '{"event_type": "task-new"}'
  _set r title $title
  _set r project $project
  _set r priority $priority
  echo $r
end
