# frozen_string_literal: true

ActiveRecord::Base.transaction do
  Task.create(
    title: 'Call references',
    sub_title: 'Job: ABC123 - UX Designer',
    priority: Task.priorities[:high],
    due_date: DateTime.current + 2.days
  )

  Task.create(
    title: 'Conduct police check & send emails',
    sub_title: 'Application: 1280349 - Calliope Maddison',
    priority: Task.priorities[:medium],
    due_date: DateTime.current + 2.days
  )

  Task.create(
    title: 'Ask candidates about driver licenses and blue card',
    sub_title: 'Job: ABC321 - Aboriginal - Family Partnership Worker',
    priority: Task.priorities[:low],
    due_date: DateTime.current + 2.days
  )
end
