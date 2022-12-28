module InstanceCounter
  def self.included(place)
    place.extend ClassMethods
    place.include InstanceMethods
  end

  module ClassMethods
    def instances
      @instances
    end

  end

  module InstanceMethods

    protected

    def register_instance
      self.class.instances += 1
    end
  end
end
