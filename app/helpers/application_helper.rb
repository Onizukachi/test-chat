module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.prepend 'flash', partial: 'shared/flash'
  end

  def flash_color(key, type, opacity)
    if key == 'success'
      "#{type}-green-#{opacity}"
    else
      "#{type}-red-#{opacity}"
    end
  end
end
