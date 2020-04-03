class WidgetController < ApplicationController
  def index
    widgets_index = Widget.get_widgets_index
    if widgets_index['message'] == 'Success'
      @widgets_index = widgets_index['data']
    end
    render :index
  end
end
