if test -z $FDT_TRANSCRIPT_HOME
  set -g FDT_TRANSCRIPT_HOME ~/.transcript
end

function handle_event -e on_event 
  mkdir -p $FDT_TRANSCRIPT_HOME/(date +%Y%m)/
  echo "$argv" >> $FDT_TRANSCRIPT_HOME/(date +%Y%m)/transcript.log
end

function tweet_new_idea -e new_idea 
  set -l ifttt_key (cat ~/.ifttt_key)
  set -g payload "$argv"
  set idea (_get payload idea)
  set -l url https://maker.ifttt.com/trigger/new_idea/with/key/$ifttt_key
  set v1 (echo '\'{"value1":'$idea'}\'')
  set -l x 'curl -X POST -H "Content-Type: application/json" -d '$v1' '$url
  echo $x
  eval $x
end
