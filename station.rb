require_relative 'instance_method'

class Station
  include InstanceCounter

  attr_reader :name, :trains

  # Создаем массив класса
  @@all_stations = []
  
  def self.all
    @@all_stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << name
  end

  # Может принимать поезда (по одному за раз)
  def get_train(train)
    @trains << train
  end

  # Может возвращать список всех поездов на станции, находящиеся в текущий момент
  def trains_in_station
    puts "На станции #{name} в данный момент находятся след поезда:"
    trains.each { |train| puts " #{train.number} - #{train.type} - #{train.wagon_count}" }
  end

  # Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
  def trains_type_in_station(type)
    puts "Поезда на станции #{name} типа #{type}: "
    trains.select { |train| train.type == type }
  end

  # Метод отдающий кол-во по типу
  def count_trains_by(type)
    trains.count { |x| x.type == type }
  end

  # Может отправлять поезда(по одному за раз, поезда удаляются из списка)
  def send_train(train)
    @trains.delete(train)
    puts "Из станции #{name} отправляется поезд с номером № #{train.number}"
  end
end
