require 'test_helper'

class BsFriendlyIdTest < ActiveSupport::TestCase
  def setup
    @article = Article.create(title: "Friendly Id Article")
  end
  
  test "it should load the correct model when #find is given a stringified id." do
    assert_equal Article.find(@article.id.to_s), @article
  end
  
  test "it should set the slug to the parameterized title." do
    @article.reload
    assert_equal @article.title.parameterize, @article.slug
  end
  
  test "it should call base #find if called with a stringified ID." do
    assert_equal @article, Article.find(@article.id.to_s)
  end
  
  test "on update should re-save the slug if the title changed." do
    @article.reload
    @article.title = "Nice Stuff"
    @article.save
    @article.reload
    
    assert_equal @article.title.parameterize, @article.slug
  end
  
  test "on update should maintain the same slug if the title stays the same." do
    @article.reload
    @article.body = "blah blah"
    @article.save
    @article.reload
    
    assert_equal @article.title.parameterize, @article.slug
  end
end

