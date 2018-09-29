require 'test_helper'

class PostTest < MiniTest::Unit::TestCase
  def setup
    @post = Mark::Post.new(File.expand_path('../fixtures/valid_post.md', __FILE__))
  end

  def test_meta_returns_hash
    assert_instance_of Hash, @post.meta
  end

  def test_meta_parses_title
    assert_equal 'Valid Test Post', @post.meta['title']
  end

  def test_meta_parses_date
    assert_equal Date.new(1992, 2, 27), @post.meta['date']
  end

  def test_content_valid
    assert_equal "<h1>Valid Test Content</h1>\n", @post.content
  end
end
