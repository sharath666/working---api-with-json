if @tasks.empty?
node(:notice){"no tasks found"}
else
collection @tasks
attributes :id, :title, :due_date, :is_completed
end