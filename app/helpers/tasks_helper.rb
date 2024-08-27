# frozen_string_literal: true

module TasksHelper
  def task_priority_text(priority)
    {
      high: 'HIGH PRIORITY',
      medium: 'MEDIUM PRIORITY',
      low: 'LOW PRIORITY'
    }[priority.to_sym]
  end

  def task_priority_badge_style(priority)
    {
      high: 'text-red-500 bg-red-50',
      medium: 'text-orange-500 bg-orange-50',
      low: 'text-green-500 bg-green-50'
    }[priority.to_sym]
  end
end
