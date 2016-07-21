require 'net/http'

require 'rubygems'
require 'json'

class Client
  def initialize(username, password)
    @user = username
    @passwd = password
    @host = 'api.artifacia.com'
  end

  def upload_user_data(data.json)
    @post_ws = "/v1/users"
    @payload={
    	data.json
      }.to_json

    req = Net::HTTP::Post.new(@post_ws, initheader = {'Content-Type' =>'application/json'})
         req.basic_auth @user, @pass
         req.body = @payload
         response = Net::HTTP.new(@host).start {|http| http.request(req) }
        #  puts "Response #{response.code} #{response.message}:
        #  #{response.body}"

    return response.body
  end

  def upload_item_data(data.json)
    @post_ws = "/v1/items"
    @payload={
    	data.json
      }.to_json

    req = Net::HTTP::Post.new(@post_ws, initheader = {'Content-Type' =>'application/json'})
         req.basic_auth @user, @pass
         req.body = @payload
         response = Net::HTTP.new(@host).start {|http| http.request(req) }
        #  puts "Response #{response.code} #{response.message}:
        #  #{response.body}"

    return response.body
  end

  def delete_item_data(item_ids)
    @post_ws = "/v1/items"
    @payload={
    	item_ids
      }.to_json
    req = Net::HTTP::Delete.new(@post_ws, initheader = {'Content-Type' =>'application/json'})
         req.basic_auth @user, @pass
         req.body = @payload
         response = Net::HTTP.new(@host).start {|http| http.request(req) }
        #  puts "Response #{response.code} #{response.message}:
        #  #{response.body}"
    return response.body
  end

  def get_visual_recommendation(prod_id)
    @post_ws = "/v1/recommendation/similar/#{prod_id}"
    req = Net::HTTP::Get.new(@post_ws, initheader = {'Content-Type' =>'application/json'})
         req.basic_auth @user, @pass
         response = Net::HTTP.new(@host).start {|http| http.request(req) }
        #  puts "Response #{response.code} #{response.message}:
        #  #{response.body}"

    return response.body
  end

  def get_cpr_recommendation(prod_id)
    @post_ws = "/v1/recommendation/collections/#{prod_id}"
    req = Net::HTTP::Get.new(@post_ws, initheader = {'Content-Type' =>'application/json'})
         req.basic_auth @user, @pass
         response = Net::HTTP.new(@host).start {|http| http.request(req) }
        #  puts "Response #{response.code} #{response.message}:
        #  #{response.body}"

    return response.body
  end

  def get_smart_recommendation(prod_id)
    @post_ws = "/v1/recommendation/user/#{prod_id}"
    req = Net::HTTP::Get.new(@post_ws, initheader = {'Content-Type' =>'application/json'})
         req.basic_auth @user, @pass
         response = Net::HTTP.new(@host).start {|http| http.request(req) }
        #  puts "Response #{response.code} #{response.message}:
        #  #{response.body}"

    return response.body
  end
end
