require 'fixtures/example'

RSpec.describe Debugtrace do
  let(:a) { A.new }
  let(:b) { B.new }
  let(:c) { C.new }
  let(:d) { D.new }

  it 'simple test' do
    begin
      a.hello('hello')
    rescue Exception
      expect($@).to include(%r(`hello' {:arguments=>{:message=>"hello"}}))
    end
  end

  it 'no name rest arg' do
    begin
      a.no_name_rest(1, 2, 3)
    rescue Exception
      expect($@).to include(%r(`no_name_rest' {:arguments=>{}}))
    end
  end

  it 'no name keyrest arg' do
    begin
      a.no_name_keyrest(a: 1, b: 2, c: 3)
    rescue Exception
      expect($@).to include(%r(`no_name_keyrest' {:arguments=>{}}))
    end
  end

  it 'simple test' do
    begin
      b.hello('update')
    rescue Exception
      expect($@).to include(
                        %r(`hello' {:arguments=>{:message=>"update"}}),
                        %r(`hello' {:arguments=>{:value=>"update"}})
                    )
    end
  end

  it 'class_eval' do
    begin
      c.create('user')
    rescue Exception
      expect($@).to include(%r( `create' {:arguments=>{:req=>"user"}}))
    end
  end

  it 'recursive test' do
    begin
      d.dfs(3)
    rescue Exception
      expect($@).to include(
                        %r(`dfs' {:arguments=>{:value=>0}}),
                        %r(`dfs' {:arguments=>{:value=>3}})
                    )
    end
  end
end
