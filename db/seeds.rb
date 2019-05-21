# sample tasks
sample_tasks = ["finish mod-5 project", "find serenity", "traverse the boundaries of space time until finding the critical inconsistency"]

sample_tasks.each do |task|
  Task.create(content: task)
end
