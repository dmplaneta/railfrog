require File.dirname(__FILE__) + '/../test_helper'
require 'railfrog'

class TransformTest < ActiveSupport::TestCase


  def test_transform_manager
    tm = Railfrog::Transform::TransformManager.instance
    # Register a stupid transform to check the plumbing
    tm.register(Railfrog::Transform::BaseTransformer.new, Mime::JS, Mime::HTML)
    hello = "Hello"
    tmmm=tm.transform(hello, Mime::JS, Mime::HTML)
    assert_equal("<div class='railfrog-error'><p style='color:red'>We're sorry, this content cannot be processed.<br/>Railfrog error: transformer not installed<br/>The site administrator has been notified.<br/>Here is the unprocessed content:</p><p><pre>Hello</pre></p></div>", tmmm.at(0))
  end

  def test_maruku
    tm = Railfrog::Transform::TransformManager.instance
    tmm=tm.register(Railfrog::Transform::MarukuTransformer.new, Mime::MARKDOWN, Mime::HTML)    
    hello = "#Aloha\n\n**Hello** and welcome to reality."
    tmmm=tm.transform(hello, Mime::MARKDOWN, Mime::HTML)
    assert_equal("<h1 id='aloha'>Aloha</h1>\n\n<p><strong>Hello</strong> and welcome to reality.</p>", tmmm.at(0))
  end
end

