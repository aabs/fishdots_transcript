#!/usr/bin/env fish


function republish_to_ifttt -a event_type value1 # value2 value3
  set -l ifttt_key (cat ~/.ifttt_key)
  set -g payload "$argv"
  set -l url https://maker.ifttt.com/trigger/$event_type/with/key/$ifttt_key
  set v1 (echo '\'{"value1":'$value1'}\'')
  set -l x 'curl -X POST -H "Content-Type: application/json" -d '$v1' '$url
  eval $x
end

function republish_to_ifttt_new_task -e task_new 
  set -g payload "$argv"
  republish_to_ifttt 'task_new' (_get payload title)
end

function republish_to_ifttt_new_idea -e new_idea 
  set -g payload "$argv"
  republish_to_ifttt 'new_idea' (_get payload idea)
end
