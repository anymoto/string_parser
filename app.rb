require 'sinatra'

here = File.expand_path File.dirname(__FILE__)
lib = File.expand_path "#{here}/lib"
$: << lib

require 'string_parser'

class ParserApplication < Sinatra::Base
  get '/' do
    'Hello!'
  end

  get '/:first_string/:second_string' do
    parser = StringParser.new(params[:first_string], params[:second_string])
    "The new string is #{parser.parse}"
  end
end
