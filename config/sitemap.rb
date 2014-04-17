
SitemapGenerator::Sitemap.create_index = false
SitemapGenerator::Sitemap.default_host = "http://www.jugglebugsapp.com"
SitemapGenerator::Sitemap.public_path = 'tmp/'

SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new
SitemapGenerator::Sitemap.sitemaps_host = "http://#{ENV['FOG_DIRECTORY']}.s3.amazonaws.com/"
SitemapGenerator::Sitemap.sitemaps_path = 'com/sitemaps/'

SitemapGenerator::Sitemap.create do
	add '/'
	SwellMedia::Media.active.each do |media|
		add media.path, lastmod: media.updated_at
	end
end