module InstanceCounter
  def self.include(place)
    place.extend ClassMethods
    place.include InstanceMethods
  end

  module ClassMethods
    attr_reader :instances

    private

    def register_instance
      @instances ||= 0
      @instances += 1
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.instances
      self.class.send(:increment_instances)
    end
  end
end
