require 'net/https'

require 'rubygems'
require 'json'

class Client
  def initialize(username, password)
    @user = username
    @pass = password
    @host = 'api.artifacia.com'
  end

  def upload_user_purchased_items(user_id, data)
    @post_ws = "/v1/users/#{user_id}/purchased_items"
    req = Net::HTTP::Post.new(@post_ws, initheader = {'Content-Type' =>'application/json'})
         req.basic_auth @user, @pass
         req.body = data
         response = Net::HTTP.new(@host).start {|http| http.request(req) }
    return response.body
  end

  def upload_user_viewed_items(user_id, data)
    @post_ws = "/v1/users/#{user_id}/viewed_items"
    req = Net::HTTP::Post.new(@post_ws, initheader = {'Content-Type' =>'application/json'})
         req.basic_auth @user, @pass
         req.body = data
         response = Net::HTTP.new(@host).start {|http| http.request(req) }
    return response.body
  end

  def upload_item_data(data)
    @post_ws = "/v1/items"
    req = Net::HTTP::Post.new(@post_ws, initheader = {'Content-Type' =>'application/json'})
         req.basic_auth @user, @pass
         req.body = data
         response = Net::HTTP.new(@host).start {|http| http.request(req) }
    return response.body
  end

  def delete_item_data(item_ids)
    @post_ws = "/v1/items"
    req = Net::HTTP::Delete.new(@post_ws, initheader = {'Content-Type' =>'application/json'})
         req.basic_auth @user, @pass
         req.body = item_ids
         response = Net::HTTP.new(@host).start {|http| http.request(req) }
    return response.body
  end

  def get_visual_recommendation(prod_id, num)
    @post_ws = "/v1/recommendation/similar/#{prod_id}/#{num}"
    req = Net::HTTP::Get.new(@post_ws, initheader = {'Content-Type' =>'application/json'})
         req.basic_auth @user, @pass
         response = Net::HTTP.new(@host).start {|http| http.request(req) }
    return response.body
  end

  def get_cpr_recommendation(prod_id, num)
    @post_ws = "/v1/recommendation/collections/#{prod_id}/#{num}"
    req = Net::HTTP::Get.new(@post_ws, initheader = {'Content-Type' =>'application/json'})
         req.basic_auth @user, @pass
         response = Net::HTTP.new(@host).start {|http| http.request(req) }
    return response.body
  end

  def get_personalized_recommendation(user_id, num)
    @post_ws = "/v1/recommendation/user/#{user_id}/#{num}"
    req = Net::HTTP::Get.new(@post_ws, initheader = {'Content-Type' =>'application/json'})
         req.basic_auth @user, @pass
         response = Net::HTTP.new(@host).start {|http| http.request(req) }
    return response.body
  end
end
