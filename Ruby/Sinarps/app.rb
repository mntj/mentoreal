require 'bundler/setup'
Bundler.require
enable :sessions

get '/' do
  session.clear
  erb :index
end

get '/rps' do
  erb :rps
end

get '/dynamite' do
  erb :dynamite
end

get '/lizard-spock' do
  erb :lizard_spock
end

get '/rps/:move' do
  r = session[:game] || RPS.new
  pass_vars_to_session(r)
  redirect to('/rps')
end

get '/dynamite/:move' do
  d = session[:game] || RPS.new(true, false)
  pass_vars_to_session(d)
  redirect to('/dynamite')
end

get '/lizard-spock/:move' do
  l = session[:game] || RPS.new(false, true)
  pass_vars_to_session(l)
  redirect to('/lizard-spock')
end

get '/reset/:game' do
  path = '/' + params[:game]
  session.clear
  redirect to(path)
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
