module ApplicationHelper
  def current_order
    if !session[:order_id].nil?
      @current_order ||= Order.find_by(id: session[:order_id])
    else
      Order.new
    end
  end
end
