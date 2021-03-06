class Notification::Mention < Notification::Base

  belongs_to :mentionable, polymorphic: true

  def send_email
    if mentionable.class == Comment
      NotificationMailer.comment_mention(self).deliver_later
    end
    if mentionable.class == Post
      NotificationMailer.post_mention(self).deliver_later
    end
  end
end
