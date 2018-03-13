class WechatsController < ApplicationController
  # to allow using wechat message DSL and web page helper
  wechat_responder

  # default text responder when no other match
  on :text do |request, content|
    request.reply.text "echo: #{content}" # Just echo
  end

  # When receive 'help', will trigger this responder
  on :text, with: 'help' do |request|
    request.reply.text 'help content'
  end

  on :event, with: 'subscribe' do |request|
    request.reply.text "#{request[:FromUserName]} subscribe now"
  end

  # When user click the menu button
  on :click, with: 'BOOK_LUNCH' do |request, key|
    request.reply.text "User: #{request[:FromUserName]} click #{key}"
  end

  # When user view URL in the menu button
  on :view, with: 'http://wechat.somewhere.com/view_url' do |request, view|
    request.reply.text "#{request[:FromUserName]} view #{view}"
  end

  # Any not match above will fail to below
  on :fallback, respond: 'fallback message'
end
