module TasksHelper
  def task_status_badge(task)
    css = task_status_css_mapping[task.status.to_sym]
    content_tag :span, task.status_text, class: css
  end

  private

  def task_status_css_mapping
    {
      open: 'badge badge-primary',
      inprogress: 'badge badge-success',
      closed: 'badge badge-secondary'
    }
  end
end
