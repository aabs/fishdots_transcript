if test -z $FDT_TRANSCRIPT_HOME
  set -g FDT_TRANSCRIPT_HOME ~/.transcript
end

function handle_event -e new_event 
  mkdir -p $FDT_TRANSCRIPT_HOME/(date +%Y%m)/
  echo "$argv" >> $FDT_TRANSCRIPT_HOME/(date +%Y%m)/transcript.log
end

