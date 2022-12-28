module InstanceCounter
  # такой параметр (place) нужен, так как на место этого параметра будет передаватся
  # сам класс куда мы подключаем этот модуль. Я абсолютно уверен, что я всё правильно делаю 
  def self.included(place)
    place.extend ClassMethods
    place.include InstanceMethods
  end
  module ClassMethods

    def instances
      @instances ||= 0
      @instances += 1
    end
  end

  module InstanceMethods

    protected

    def register_instance
      self.class.instances += 1
    end
  end
end
