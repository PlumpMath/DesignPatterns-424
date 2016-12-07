class ProductC
  def do_my_job
    puts "My subclass didn't override this method.It's a lazy product!!!"
  end
end

class CoolProductC < ProductC
  def do_my_job
    puts "I'm a ProductC, performing COOL!!!"
  end
end

class UncoolProductC < ProductC
  def do_my_job
    puts "I'm a ProductC, performing UNCOOL!!!"
  end
end

class DeadlyProductC < ProductC
  def do_my_job
    puts "I'm a ProductC, performing DEADLY!!!"
  end
end