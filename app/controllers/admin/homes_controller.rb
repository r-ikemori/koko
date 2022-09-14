class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @post_contents = PostContent.all
  end

end
