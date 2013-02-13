module CommentsHelper
  def comment_box(model=nil, url=nil)
    if model.nil?
      model = resource
    end
    if url.nil?
      url = polymorphic_url([model, :comments], format: :js)
      
    end
    content_tag(:div, '', id: "comments_for_#{model.html_id}", class: 'comments_list', data: {load_from: url})
  end
end
