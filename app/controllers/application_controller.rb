class ApplicationController < ActionController::Base
  respond_to :html, :js
  protect_from_forgery with: :exception
  before_filter :authenticate_member!, :if => :authentication_required?
  
  helper_method :title
  
  def current_ability
    @current_ability ||= Ability.new(current_member)
  end
  
  def title(new_title=nil)
    if new_title
      @title = new_title
    end
    @title || "Polestar Astrology"
  end
  
  def resource_var_name
    names = self.class.name.underscore.split('_')
    names.pop
    name = names.join('_')
    "@" + name.singularize
  end
  
  def resource
    instance_variable_get resource_var_name
  end
  
  private

  def self.parents_list
    @parents_list
  end
  
  def parent_class
    @parent.class
  end
  
  def parent
    @parent
  end

  helper_method :parent, :parent_class, :resource
  
  def authentication_required?
    if devise_controller? || self.kind_of?(LunarDatesController)
      false
    else
      true
    end
  end
  
  def after_sign_in_path_for(member)
    a = member.last_sign_in_at

    q = Article.where("date_posted > ?", a)
    # q.all
    if q.exists?
      blog_path
    else
      root_path
    end
  end
end
