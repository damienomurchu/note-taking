# creates and opens note for meeting
function mn
  # validate inputs
  set slot $argv[1]
  set title $argv[2]

  if test -z $slot
    echo 'Add meeting time (hhmm):'
    echo '  $ mn hhmm meeting-title'
    return 1
  end

  if test -z $title
    echo 'Add meeting title:'
    echo '  $ mn hhmm meeting-title'
    return 1
  end

  # set remaining vars
  set date $(date -u +%Y-%m-%d)
  set template ~/notes/.templates/meeting.md
  set file ~/notes/meetings/$date-$slot-$title.md
  echo $file

  # if journal with date doesn't exist - create it
  if test ! -f $file
    cp $template $file
  end 

  # open journal for editing
  vim '+$' "$file"
end⏎ 
