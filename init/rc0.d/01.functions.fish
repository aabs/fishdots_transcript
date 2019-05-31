#!/usr/bin/env fish

function _set -a varName key value -d 'add property to JSON formatted property set using JQ'
  if test -z $varName
    set -g $varName "{}"
  end
  set -g $varName (echo $$varName | jq ".$key |= \"$value\"")
end

function _get -a varName key -d 'get property value from JSON formatted property set using JQ'
  echo $$varName | jq ".$key"
end

function get_all_transcripts
  find $FDT_TRANSCRIPT_HOME -iname "transcript.log"
end
