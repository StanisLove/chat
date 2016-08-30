module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags "ActionCable", "User #{current_user.id}"
    end

    protected

      def find_verified_user
        env['rack.session'].send(:load_for_read!)

        if id = env['rack.session']['user_id']
          User.find(id)
        else
          reject_unauthorized_connection
        end
      end
  end
end
