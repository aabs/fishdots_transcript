#!/usr/bin/env fish

function get_all_transcripts
  find $FDT_TRANSCRIPT_HOME -iname "transcript.log"
end
