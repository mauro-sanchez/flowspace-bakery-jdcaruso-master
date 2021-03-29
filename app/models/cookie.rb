class Cookie < ActiveRecord::Base
  belongs_to :storage, polymorphic: :true
  after_commit :cook!, on: :create
  
  validates :storage, presence: true

  private
  def cook!
    CookieCookerWorker.perform_in(10.seconds, self.id)
  end
end
