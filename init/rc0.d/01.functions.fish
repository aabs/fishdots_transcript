#!/usr/bin/env fish

function x -d 'dispatcher'

  switch $argv[1]
    case t
      sed -e "s/TITLE/$argv[2]/" -e 's/PRIORITY/M/' -e 's/PROJECT/fd/'  event_templates/task.json
  end
end

