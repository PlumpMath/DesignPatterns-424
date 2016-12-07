class ProductB
  def do_my_job
    puts "My subclass didn't override this method.It's a lazy product!!!"
  end
end

class CoolProductB < ProductB
  def do_my_job
    puts "I'm a ProductB, doing it COOL!!!"
  end
end

class UncoolProductB < ProductB
  def do_my_job
    puts "I'm a ProductB, doing it UNCOOL!!!"
  end
end

class DeadlyProductB < ProductB
  def do_my_job
    puts "I'm a ProductB, doing it  DEADLY!!!"
  end
end