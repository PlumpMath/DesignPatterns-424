class Product
  def do_my_job
    puts "I didn't define my job. I am a lazy and shitty product"
  end
end
class ProductA < Product

  def do_my_job
    puts "I'm a ProductA, doing my stuff"
  end
end

class ProductB < Product
  def do_my_job
    puts "I'm a ProductB, doing it"
  end
end

class ProductC < Product
  def do_my_job
    puts "I'm a ProductC, performing"
  end
end