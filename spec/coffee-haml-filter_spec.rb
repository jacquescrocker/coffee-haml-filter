require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "CoffeeHamlFilter" do
  it "should render valid coffeescript" do
    template = read_fixture('win.haml')
    engine = Haml::Engine.new(template)
    rendered = engine.render
    rendered.should == "<script type='text/javascript'>\n  //<![CDATA[\n    (function(){\n  alert('Win!');\n})();\n\n  //]]>\n</script>\n"
  end

  it "should show errors for invalid coffee script" do
    template = read_fixture('invalid.haml')
    lambda { Haml::Engine.new(template) }.should raise_error(SyntaxError)
  end
end
