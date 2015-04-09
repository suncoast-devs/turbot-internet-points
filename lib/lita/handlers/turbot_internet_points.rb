module Lita
  module Handlers
    class TurbotInternetPoints < Handler

      route(/<@(\w*)>\+\+/, :increment_points)

      def increment_points(response)
        Incrementer.new(response, self).tap do |incrementer|
          incrementer.increment!
          response.reply incrementer.reply
        end
      end
    end

    Lita.register_handler(TurbotInternetPoints)
  end
end

class Incrementer

  def initialize(response, handler)
    @handler = handler
    @response = response
    @redis = handler.redis
  end

  def increment!
    @redis.incr redis_key
  end

  def reply
    if not_a_milestone?
      "#{username}'s now: #{point_count}"
    else
      translation_for_milestone
    end
  end

  private

  def not_a_milestone?
    /translation missing/ =~ translation_for_milestone
  end

  def translation_for_milestone
    @handler.t("points.at_#{point_count}", username: username)
  end

  def point_count
    @redis.get(redis_key).to_i
  end

  def redis_key
    "karma_#{username}"
  end

  def username
    "@" + Lita::User.find_by_id(user_id).mention_name
  end

  def user_id
    @response.pattern.match(@response.message.body)[1]
  end
end
