function event_new_task -a title pro pri 
  set priority "$pri"; test -z "$priority"; and set priority "M"
  set project "$pro"; test -z "$project"; and set project $CURRENT_PROJECT_SN
  set -g r '{"event_type": "task-new"}'
  _set r when (date --iso-8601=minutes)
  _set r title $title
  _set r project $project
  _set r priority $priority
  emit on_event $r
  emit task_new $r
end

function event_task_started -a taskid
  set -g r '{"event_type": "task-started"}'
  _set r when (date --iso-8601=minutes)
  _set r taskid $taskid
  emit on_event $r
end

function event_task_halted -a taskid
  set -g r '{"event_type": "task-halted"}'
  _set r when (date --iso-8601=minutes)
  _set r taskid $taskid
  emit on_event $r
end

function event_task_completed -a taskid
  set -g r '{"event_type": "task-completed"}'
  _set r when (date --iso-8601=minutes)
  _set r taskid $taskid
  emit on_event $r
end

function event_meeting -a who topic
  set subject "$topic"; test -z "$subject"; and set subject "Misc"
  set -g r '{"event_type": "meeting"}'
  _set r when (date --iso-8601=minutes)
  _set r who $who
  _set r topic $subject
  emit on_event $r
end

function event_conversation -a who
  set -g r '{"event_type": "conversation"}'
  _set r when (date --iso-8601=minutes)
  _set r who $who
  emit on_event $r
end

function event_decision -a what
  set -g r '{"event_type": "decision"}'
  _set r when (date --iso-8601=minutes)
  _set r what $what
  emit on_event $r
end

function event_idea -a idea
  set -g r '{"event_type": "idea"}'
  _set r when (date --iso-8601=minutes)
  _set r idea $idea
  emit on_event $r
end

function event_new_note -a title
  set -g r '{"event_type": "new-note"}'
  _set r when (date --iso-8601=minutes)
  _set r title $title
  emit on_event $r
end

function event_new_problem -a title question
  set -g r '{"event_type": "new-problem"}'
  _set r when (date --iso-8601=minutes)
  _set r title $title
  _set r question $question
  emit on_event $r
end

function event_problem_solution -a title explanation
  set -g r '{"event_type": "problem-solution"}'
  _set r when (date --iso-8601=minutes)
  _set r title $title
  _set r solution $solution
  emit on_event $r
end

function event_new_project -a sn ln path
  set -g r '{"event_type": "new-project"}'
  _set r when (date --iso-8601=minutes)
  _set r shortname $sn
  _set r longname $ln
  _set r path $path
  emit on_event $r
end

