module TasksHelper
  def task_status_badge(task)
    css = task_status_css_mapping[task.status.to_sym]
    content_tag :span, task.status_text, class: css
  end

  def task_next_status_button(task)
    return unless task.next_status.present?

    text = I18n.t("next_status.#{task.next_status}")
    css = task_next_status_css_mapping[task.next_status]
    css << ' btn btn-sm btn-update-status'

    link_to text, backlog_path(task), class: css, method: :patch
  end

  private

  def task_next_status_css_mapping
    {
      inprogress: 'btn-primary',
      closed: 'btn-light'
    }
  end

  def task_status_css_mapping
    {
      open: 'badge badge-primary',
      inprogress: 'badge badge-success',
      closed: 'badge badge-secondary'
    }
  end
end
