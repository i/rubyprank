require 'sinatra'
require 'haml'
require 'oauth'
require 'twilio-ruby'

twiliosid  = "AC566da319c49345fe4fbbbea81ada1de0"
twilioauth = "741080b04bcb6c2471cf9439d939abce"

$client = Twilio::REST::Client.new twiliosid, twilioauth


get '/phone' do
    File.open('./views/browser-phone/browser-phone.php').read
end

get '/' do
    haml :index
end

get '/sms' do
    haml :sms
end

post '/sms' do
    number = params['number']
    message = $client.account.sms.messages.create "Jenny please?! I love you <4", params['number'], "+14159686840"
end

post '/call' do
    #call1 = $client.account.calls.make "+14159686840", params['number1'], "http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient"
    #call2 = $client.account.calls.make "+14159686840", params['number2'], "http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient"
    #call = $client.account.calls.make "+14159686840", params['number1'], "http://twimlets.com/conference?Moderators%5B0%5D=6093067701&Moderators%5B1%5D=2019608602&"
    haml :calling, :locals => {:number1 => params['number1'], :number2 => params['number2']}
    call1 = $client.account.calls.make "+14159686840", params['number1'], "http://twimlets.com/conference?Name=foo"
    call2 = $client.account.calls.make "+14159686840", params['number2'], "http://twimlets.com/conference?Name=foo"

    #call = $client.account.calls.make "+14159686840", params['number1'], "http://twimlets.com/conference?Moderators%5B0%5D=6093067701&Moderators%5B1%5D=2019608602&"
end

get '/fad' do
    @client.class.to_s
end
