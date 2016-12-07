class ProductA
  def do_my_job
    puts "My subclass didn't override this method.It's a lazy product!!!"
  end
end


class CoolProductA < ProductA

  def do_my_job
    puts "I'm a ProductA, doing my stuff COOL!!!"
  end
end

class UncoolProductA < ProductA

  def do_my_job
    puts "I'm a ProductA, doing my stuff UNCOOL!!!"
  end
end

class DeadlyProductA < ProductA
  def do_my_job
    puts "I'm a ProductA, doing my stuff DEADLY!!!"
  end
end