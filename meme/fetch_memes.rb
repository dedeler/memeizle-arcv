#!/usr/bin/env ruby

require "mongo"
require "uri"
include Mongo

mongo_uri = "mongodb://..."
db_name = "memetabani"
coll_name = "memeadayi"
client = MongoClient.from_uri(mongo_uri)
db = client.db(db_name)

coll = db.collection(coll_name)

memes = coll.find("url" => { "$ne" => "" } ).to_a

memes.each do |meme|
  if meme["url"] =~ URI::regexp && !/memeizle.com/.match(meme["url"])
    # wget parameters:
    # -nc, --no-clobber              skip downloads that would download to 
    #                                existing files.
    `wget -nc --max-redirect 0 #{meme["url"]}`
  end
end