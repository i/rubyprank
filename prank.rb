require 'erubis'
require 'sinatra'
require 'haml'
require 'oauth'
require 'twilio-ruby'
require 'uuid'

$client = Twilio::REST::Client.new twiliosid, twilioauth
$capability = Twilio::Util::Capability.new twiliosid, twilioauth
$capability.allow_client_outgoing appsid

$token = $capability.generate

get '/phone' do
    haml :calling, :locals => {:token => $token}
end

get '/' do
    haml :index
end

get '/sms' do
    haml :sms
end

post '/sms' do
    number = params['number']
    message = $client.account.sms.messages.create "Jenny please?! I love you <4", params['number'], "4159686840"
end

post '/call' do
    uuid = UUID.generate
    haml :calling, :locals => {:number1 => params['number1'], :number2 => params['number2']}
    call1 = $client.account.calls.make "+14159686840", params['number1'], "http://twimlets.com/conference?Name=#{uuid}&Message=%20"
    call2 = $client.account.calls.make "+14159686840", params['number2'], "http://twimlets.com/conference?Name=#{uuid}&Message=%20"
    call3 = $client.account.calls.make "+14159686840", params['number3'], "http://twimlets.com/conference?Name=#{uuid}&Message=%20"
end


get '/fad' do
    @client.class.to_s
end

get '/monkey' do
    # Find these values at twilio.com/user/account
    # This application sid will play a Welcome Message.
    demo_app_sid = 'APabe7650f654fc34655fc81ae71caa3ff'
    capability = Twilio::Util::Capability.new twiliosid, twilioauth
    capability.allow_client_outgoing demo_app_sid
    token = capability.generate
    erb :dex, :locals => {:token => token}
end

