class A
  def hello(message)
    raise Exception
  end

  def no_name_rest(*)
    raise Exception
  end

  def no_name_keyrest(**)
    raise Exception
  end

  def call_private(msg)
    pmethod(10)
  end

  private
  def pmethod(value)
    raise Exception
  end
end

class B
  def hello(value)
    A.new.hello(value)
  end

  def self.class_hello(msg)
    raise
  end

  def m1
    m2
  end

  def m2
    m3
  end

  def m3
    hogepiyo
  end
end

class C
end

C.class_eval {
  def create(req)
    raise Exception
  end
}

class D
  def dfs(value)
    3 / value
    dfs(value-1)
  end
end
