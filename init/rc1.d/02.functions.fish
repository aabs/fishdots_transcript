#!/usr/bin/env fish

function fdt_ls -d 'list events'
  argparse --name=fdt_ls 't/type=' -- $argv
  or return
  if set -q _flag_type
    for i in (get_all_transcripts)
      command cat  $i | jq '.|select(.event_type == "'$_flag_type'")'
    end
  end
end
  
function fdt_ls_meeting -d 'pretty list of meeting'
  fdt_ls -t meeting | jq -r '. | [.when,.who,.topic]|join("\t ")' | sort -r
end
  
function fdt_ls_ideas -d 'pretty list of ideas'
  fdt_ls -t idea | jq -r '. | [.when,.idea]|join("\t")' | sort -r
end
  
function fdt_ls_decision -d 'pretty list of decision'
  fdt_ls -t decision | jq -r '. | [.when,.what]|join("\t")' | sort -r
end
