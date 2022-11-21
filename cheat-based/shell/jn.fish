# creates and opens current day journal entry 
function jn
  # set vars
  set date $(date -u +%Y-%m-%d)
  set template ~/notes/.templates/daybook.md
  echo $template
  set file ~/notes/journals/$date-daybook.md

  # if journal with date doesn't exist - create it
  if test ! -f $file
    cp $template $file
  end 

  # open journal for editing
  vim '+$' "$file"
end
