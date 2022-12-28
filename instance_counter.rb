module InstanceCounter
  def self.include(place)
    place.extend ClassMethods
    place.include InstanceMethods
  end

  module ClassMethods
    def instances
      @instances ||= 0
    end

    private

    def instances_increases
      @instances += 1
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.instances
      self.class.send(:instances_increases)
    end
  end
end
