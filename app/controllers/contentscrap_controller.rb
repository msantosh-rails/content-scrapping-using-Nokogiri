require 'mechanize'
require 'open-uri'
require 'nokogiri'

class ContentscrapController < ApplicationController

  def index
  
  	agent = Mechanize.new
  	page = agent.get('http://google.com/')
	google_form = page.form('f')

	unless params[:contentscrap].blank?
		google_form.q = params[:contentscrap][:search]
		@page = agent.submit(google_form, google_form.buttons.first)
		
		content =  @page.body
		page = Nokogiri::HTML content
		result = page.search('div[@id="resultStats"]').inner_text	

	end
  end
end
