class UsersController < ApplicationController
  def index
    @users = [
        User.new(
            id:1,
            name: 'Baur',
            username: 'baur',
            avatar_url: 'http://orig09.deviantart.net/5db1/f/2012/092/7/f/communist_mario_by_fraxworks-d4uqi8v.png'
        ),
        User.new(
            id:2,
            name: 'Misha',
            username: 'aristofun'
        )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      id:1,
      name: 'Baur',
      username: 'baur',
      avatar_url: 'http://orig09.deviantart.net/5db1/f/2012/092/7/f/communist_mario_by_fraxworks-d4uqi8v.png'
    )

    @questions = [
        Question.new(text: 'Как дела?', created_at: Date.parse('27.03.2016')),
        Question.new(text: 'В чем смысл жизни', created_at: Date.parse('27.03.2016'))
    ]

    @new_question = Question.new
  end
end
