require 'sinatra'
require 'haml'
require 'oauth'
require 'twilio-ruby'

twiliosid  = "AC566da319c49345fe4fbbbea81ada1de0"
twilioauth = "741080b04bcb6c2471cf9439d939abce"

$client = Twilio::REST::Client.new twiliosid, twilioauth

get '/' do
    haml :index
end

post '/call' do
    $number = params['number']
    call = $client.account.calls.make "+14159686840", "+1#{$number}", "http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient"
    haml :calling, :locals => {:number => params['number']}
end

get '/fad' do
    @client.class
end
