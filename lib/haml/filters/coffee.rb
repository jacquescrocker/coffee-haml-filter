module Haml::Filters::Coffee
  include Haml::Filters::Base

  def render_with_options(text, options)
    <<END
<script type=#{options[:attr_wrapper]}text/javascript#{options[:attr_wrapper]}>
  //<![CDATA[
    IO.popen('coffee -s', 'rw') do |c|
      c.puts text
      c.readlines.join("\n")
    end
  //]]>
</script>
END
  end
end
