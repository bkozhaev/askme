class TagsController < ApplicationController

  def hashtags
    tag = Tag.find_by(name: params[:name])
    @questions = tag.questions
  end
end
