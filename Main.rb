require "rubygems"
require "net/http"
require "uri"
require "json"
require "openSSL"
require "csv"
require_relative 'User'


#Reading users data from API
uri=URI.parse("https://api.github.com/users")
http=Net::HTTP.new(uri.host, uri.port)
http.use_ssl=(uri.scheme == 'https')
http.verify_mode=OpenSSL::SSL::VERIFY_NONE
request=Net::HTTP::Get.new(uri.request_uri)
res=http.request(request)
response=JSON.parse(res.body)


#Filling the array with Data
ary = Array.new
response.each do |user|
  ary.push(User.new(user['id'],user['login'],user['avatar_url'],user['url'],user['type'],user['site_admin']))
end


#Sorting the array
ary= ary.sort_by {|obj| obj.getLogin().downcase}
puts ary

#Writing to file
CSV.open("Users.csv", "w") do |csv|
  csv <<["id","login","avatar_url","url","type","site_admin"]
  ary.each do |user|
    csv << [ user.getID(), user.getLogin(), user.getAvatar_url(), user.getUrl(), user.getUser_type(), user.getSite_admin() ]
  end
end

