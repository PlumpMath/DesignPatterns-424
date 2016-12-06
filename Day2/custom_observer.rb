module CustomObservable
  def initialize
    @observers=[]
  end

  def attach_observer(observer)
    @observers << observer

  end

  def detach_observer(observer)
    @observers.delete(observer)

  end
  def attach_observer_proc(&observer)
    @observers << observer
  end
  def detach_observer_proc(&observer)
    @observers.delete(observer)
  end
  def broadcast_to_observers
    @observers.each do |observer|
      if observer.class == Proc
        observer.call(self)
      else
        observer.update(self)
      end
    end
  end
end