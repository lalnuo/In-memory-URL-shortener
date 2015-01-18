class UrlCache
  @links = {}
  @last_hash = "aa1"

  def self.get_link(hash)
    @links[hash]
  end

  def self.shorten_link(url)
    url = "http://#{url}" unless url.start_with?("http")
    @last_hash = @last_hash.next
    @links[@last_hash] = url
    @last_hash
  end
end