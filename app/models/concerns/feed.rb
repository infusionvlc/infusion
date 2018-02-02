module Feed
  extend ActiveSupport::Concern
  def create_activity(user_id)
    Activity.create(user_id: user_id,
                    objective_id: self.id,
                    objective_type: self.class.name)
  end
end
