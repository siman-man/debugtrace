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
end

class B
  def hello(value)
    A.new.hello(value)
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
