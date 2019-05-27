# fishdots_transcript

Transcript, to keep track of what you are working on, who you spoke to and so on.  The idea being to create an event based ecosystem of interesting events and ways to use and consume them.  

## IDEAS

- Provide a set of commands for things like:

  - conversations, tracking who, what and when
  - decisions
  - thoughts
  - tasks completed
  - tasks started
  - tasks queued

- Use fish shell events to hook into other plugins to either get or provide inputs.  
Start with a set of useful functions that make it easy to declare an event type and the data it involves.  Q: Is there a way I could define some sort of schema? Perhaps by passing around structured data rather than sets of params - use an external parser to make sense of the data.

- Hook into social media to broadcast or receive events that may be worth capturing

- Decouple the system(s) that generate the events from those that act on them
- Provide a way to allow plugins to register new events for publication. Q: How could this system use such registrations?
- Have a variety of ways to handle events (i.e. log to notes, standup comms, social media, time trackers, ledgers, taskwarrior etc)

## Events

Possible Events could include:
  - New meeting
  - New conversation
  - New Idea
  - New task
  - Task started
  - Task finished
  - Task halted
  - New Decision
  - New note created
  - New Problem
  - Problem Solved
