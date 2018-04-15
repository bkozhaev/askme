class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Baur',
      username: '@baur',
      avatar_url: 'http://orig09.deviantart.net/5db1/f/2012/092/7/f/communist_mario_by_fraxworks-d4uqi8v.png'
    )
  end
end
