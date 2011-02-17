require 'test_config'
require 'fake'

context 'Fake' do
  context 'when adding a property :a with the return value 0' do
    setup { Fake::Fake.new.stub!(:a, 0) }

    asserts(:send).raises(NoMethodError, "undefined method 'send'") { topic.send(:a) }
    asserts(:a) { topic.a }.equals(0)
  end
  
  context '#create' do
    setup { Fake.create(:a => 0) }
    
    asserts(:inspect) {topic.inspect}.equals({[:a, []] => 0})
  end
end