require 'net/https'
require 'rubygems'
require 'json'

class Client
  def initialize(api_key)
    @api_key = api_key
    @host = 'api.artifacia.com'
    @port = 443
    @http = Net::HTTP.new(@host, @port)
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

  def upload_user_purchased_items(user_id, data)
    @post_ws = "/v1/users/#{user_id}/purchased_items"
    req = Net::HTTP::Post.new(@post_ws, initheader = {'Content-Type' =>'application/json', 'api_key' => @api_key})
         response = @http.request(req)
    return response.body
  end

  def upload_user_viewed_items(user_id, data)
    @post_ws = "/v1/users/#{user_id}/viewed_items"
    req = Net::HTTP::Post.new(@post_ws, initheader = {'Content-Type' =>'application/json', 'api_key' => @api_key})
         req.body = data
         response = @http.request(req)
    return response.body
  end

  def upload_item_data(data)
    @post_ws = "/v1/items"
    req = Net::HTTP::Post.new(@post_ws, initheader = {'Content-Type' =>'application/json', 'api_key' => @api_key})
         req.body = data
         response = @http.request(req)
    return response.body
  end

  def delete_item_data(item_ids)
    @post_ws = "/v1/items"
    req = Net::HTTP::Delete.new(@post_ws, initheader = {'Content-Type' =>'application/json', 'api_key' => @api_key})
         req.body = item_ids
         response = @http.request(req)
    return response.body
  end

  def get_visual_recommendation(prod_id, num, filters)
    @post_ws = "/v1/recommendation/similar/#{prod_id}/#{num}?"
    filters.each do |key, value|
      @post_ws = @post_ws+"#{key}=#{value}&"
      
    req = Net::HTTP::Get.new(@post_ws, initheader = {'api_key' => @api_key})
         response = @http.request(req)
    return response.body
  end

  def get_cpr_recommendation(prod_id, num)
    @post_ws = "/v1/recommendation/collections/#{prod_id}/#{num}"
    req = Net::HTTP::Get.new(@post_ws, initheader = {'api_key' => @api_key})
         response = @http.request(req)
    return response.body
  end

  def get_personalized_recommendation(user_id, num)
    @post_ws = "/v1/recommendation/user/#{user_id}/#{num}"
    req = Net::HTTP::Get.new(@post_ws, initheader = {'api_key' => @api_key})
         response = @http.request(req)
    return response.body
  end
end
