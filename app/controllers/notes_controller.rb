class NotesController < ApplicationController
  require "uri"
  require "net/http"

  before_action :authenticate_user!

  def show
    @note = Note.find(params[:id])
  end

  def create
    @course = params[:note][:course_id]
    note = Note.new(body: params[:note][:body], course_id: params[:note][:course_id], user_id: current_user.id)
    if note.save
      redirect_to note
    else
      flash[:danger] = "Can't save!"
      render @course
    end


    uri = URI('https://1jwjnlh7r4.execute-api.us-east-2.amazonaws.com/prod/text2test')
    req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    req.body = {inputTranscript: note.body}.to_json

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    res = http.request(req)

    puts "RESPONSE!!!!!!!!!!!!"
    parsed_res = ActiveSupport::JSON.decode(res.body)

    parsed_res["body"].each do |question|
      fill_in = FillInQuestion.create(question: question["question"], answer: question["answer"], course_id: 1)
      puts "#{fill_in.question}:#{fill_in.answer}"
    end


  end
end

