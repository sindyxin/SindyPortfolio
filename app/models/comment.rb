class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  validates :content, presence: true, length: { minimum: 5, maximimum: 1000 }
  #add a callback, we need a process that is going to run right after a creation process has occurred.
  #with web socket connection is different with default 

  #perform_later means to perform this when ever you have a chance but it doesn't have to be right at this very second
  after_create_commit { CommentBroadcastJob.perform_later(self) }

end
