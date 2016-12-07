class ProductD
  def do_my_job
    puts "NEW:My subclass didn't override this method.It's a lazy product!!!"
  end
end

class CoolProductD < ProductD
  def do_my_job
    puts "NEW:I'm a ProductD, revolutionising COOL!!!"
  end
end

class UncoolProductD < ProductD
  def do_my_job
    puts "NEW:I'm a ProductD, revolutionising UNCOOL!!!"
  end
end

class DeadlyProductD < ProductD
  def do_my_job
    puts "NEW:I'm a ProductD, revolutionising DEADLY!!!"
  end
end