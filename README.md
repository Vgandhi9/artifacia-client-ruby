# Artifacia Ruby Client

This ruby client is a simple wrapper around our powerful Visual Discovery [API](http://docs.artifacia.com/).

The wrapper allows you to create your own indexes of images on which you would like to enhance the product discovery experiences. It also allows you to get various types of recommendations which are listed below.

* Visual Recommendation
* Cross Product Recommendation
* Smart Recommendation

## Installation

To install the package you can follow the steps:-

```ruby
rubygem install artifacia
```

## Getting Started

The API is really easy and simple to use. First you need to create an account [here]() and there you will get a username and a password. Using that credentials you can create your constructor and get stated. 

```ruby
require 'artifacia'
user_name = <your_username>
password = <your_password>
client = Client.new(user_name, password)
```

### Creating your index
The first step is to create a index of the items that you would like to store in our databases to perform search against. If you don't have data ready right now you can quickly get started with our [sample data](). Once the data is stored and indexed we will inform you shortly.

```ruby
sample_data = {
    "item_details" => [{"prod_id"=> 11145, "image_url"=> \
    "http://cdn3.bombayelectric.in/7957/gallery/DSC00977-edit.jpg",\
    "item_category"=> "Dress","item_pattern"=> "Animal Print", \
    "item_color"=> "Blue","item_high_level_cat"=>"Top","item_material"=> \  
    "Cotton", "item_length"=>"Full Length"},{"prod_id"=> 1135,"image_url"=> \
    "http://cdn3.bombayelectric.in/7957/gallery/DSC00977-edit.jpg", \
    "item_category"=>"Tops","item_pattern"=>"Animal Print","item_color"=>"Black",\
    "item_length"=>"Full Length","item_material"=>"Polyester",\
    "item_high_level_cat"=>"Top"} ]
  }.to_json
data_indexing_response = client.upload_item_data(sample_data)
puts data_indexing_response
```

### Performing Visual Recommendation
Once you receive a notification form us about the status of the indexed data, you are ready to search.
You can search for a product ID indexed in the sample data you inserted/uploaded.

```ruby
sample_prod_id = 2761
query_response = client.get_visual_recommendations(sample_prod_id)
puts query_response
```
