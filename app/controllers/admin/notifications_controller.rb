class Admin::NotificationsController < Admin::ApplicationController
  def index
    @visitor_notifications = Notification.where(notifiable_type: 'Visitor').order(id: :desc)
    @comment_notifications = Notification.where(notifiable_type: 'Comment').order(id: :desc)
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    redirect_to :back ,notice: "Notification was successfully deleted"
  end
  def delete_all
    Notification .delete_all
    redirect_to :back, notice: 'All notifications was deleted'
  end
end
