# Fishdots Transcript

Transcript, to keep track of what you are working on, who you spoke to and so
on.  The idea being to create an event based ecosystem of interesting events
and ways to use and consume them.  

## Tasks
* [ ] Convert all task event emitters in fishdots_todo to make use of utility
  functions
* [ ] Convert all task event handlers to consume std task events
* [ ] Find a way to bring std task events into `fishdots_todo` plugin
* [ ] Come up with a std way of documenting events a plugin generates and how to
  consume them etc
* [ ] Reduce `fishdots_transcript` to just being a logger of last resort

## Ideas

- Provide a set of commands for things like:

  - conversations, tracking who, what and when
  - decisions
  - thoughts
  - tasks completed
  - tasks started
  - tasks queued

- Use fish shell events to hook into other plugins to either get or provide  
  inputs. Start with a set of useful functions that make it easy to declare an
  event type and the data it involves. Q: Is there a way I could define some
  sort of schema? Perhaps by passing around structured data rather than sets of
  params - use an external parser to make sense of the data.

- Hook into social media to broadcast or receive events that may be worth capturing

- Decouple the system(s) that generate the events from those that act on them
- Provide a way to allow plugins to register new events for publication. Q: How
  could this system use such registrations?
- Have a variety of ways to handle events (i.e. log to notes, standup comms,
  social media, time trackers, ledgers, taskwarrior etc)

## Events

### Event Generators

there are a variety of generator functions that will create standard events and
emit them for you. the idea is that you can hook into these events and handle
them in custom ways that suit you.

| Function              | Arguments           | Comments                                                                    |
|:----------------------|---------------------|-----------------------------------------------------------------------------|
| `on_new_task`         | `title [pro] [pri]` | `pro` defaults to contents of `$CURRENT_PROJECT_SN` and `pri` defaults to M |
| `on_task_started`     | `taskid`            | `taskid` is local instance identifier (i.e. of TaskWarrior)                 |
| `on_task_halted`      | `taskid`            | `taskid` is local instance identifier                                       |
| `on_task_completed`   | `taskid`            | `taskid` is local instance identifier                                       |
| `on_meeting`          | `who topic`         | who did you meet with and what did you talk about?                          |
| `on_conversation`     | `who`               | who did you talk to?                                                        |
| `on_decision`         | `what`              | what did you decide?                                                        |
| `on_idea`             | `idea`              | what was your idea                                                          |
| `on_new_note`         | `title`             | what was the title of the new note created                                  |
| `on_new_problem`      | `title question`    | what was the new problem, and a short description                           |
| `on_problem_solution` | `title explanation` | what problme was solved, and what was the solution                          |
| `on_new_project`      | `sn ln path`        | a new project was create with short name, long name and working path        |


### Utility Functions

| Function        | Arguments | Comments                                                        |
|:----------------|-----------|-----------------------------------------------------------------|
| `find_meeting`  | `pattern` | search through all meeting records for ones matching `pattern`  |
| `find_idea`     | `pattern` | search through all idea records for ones matching `pattern`     |
| `find_decision` | `pattern` | search through all decision records for ones matching `pattern` |


Possible Events could include:
  - [X] New meeting
  - [ ] New conversation
  - [X] New Idea
  - [X] New task
  - [X] Task started
  - [X] Task finished
  - [X] Task halted
  - [X] New Decision
  - [ ] New note created
  - [ ] New Problem
  - [ ] Problem Solved

## Questions

- how to document the events on offer and how to invoke them
- how to expose the event functions (naming conventions etc)
- where int he boot cycle should event handlers and publishers be defined
- should this functionality be part of fishdots core, so it is available by the
  time the plugins start to load
- how to register a new event type
- how to dynamically consume a new event type you never knew about previously
- how to use this to decouple event producers from handlers (i.e. like to
  create a better decoupling from taskwarrior in fishdots_todo)
  
<!--  
vim: tw=80 sw=2 ts=2 wrap
-->
