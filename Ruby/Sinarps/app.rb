require 'bundler/setup'
Bundler.require
enable :sessions

get '/' do
  erb :index
end

get '/rps' do
  erb :rps
end

get '/reset' do
  session.clear
  redirect to('/')
end

get '/dynamite' do
  d ||= RPS.new(true,false)
  erb :dynamite
end

get '/lizard-spock' do
  l ||= RPS.new(false,true)
  erb :lizard_spock
end

get '/rps/:move' do
  r = session[:game] || RPS.new
  pass_vars_to_session(r)
  redirect to('/rps')
end

def pass_vars_to_session(game)
  session[:game] = game
  session[:score_board] = game.play(params[:move])
  session[:score] = game.score
  session[:computer_score] = game.computer_score
  session[:wins] = game.wins
  session[:losses] = game.losses
  session[:string] = game.instance_variable_get(:@string)
  session[:player_move] = game.instance_variable_get(:@player_move)
  session[:computer_move] = game.instance_variable_get(:@computer_move)
end
