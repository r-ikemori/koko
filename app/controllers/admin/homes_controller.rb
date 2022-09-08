class Admin::HomesController < ApplicationController
  def top
    @post_contents = PostContent.all
  end

end
