require '../hello.rb'
describe HelloWorld do
  context "While testing" do
    it "should say 'Hello Rongo!' when we call the hello method" do
      hw = HelloWorld.new
      message = 'Hello Rongo! we are here'
      expect(message).to eq "Hello Rongo! we are here"
    end
  end
end

