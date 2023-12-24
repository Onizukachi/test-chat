module ApplicationHelper
  def render_turbo_stream_notices
    turbo_stream.prepend 'notices', partial: 'shared/notice'
  end
end
