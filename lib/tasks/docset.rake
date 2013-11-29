require 'fileutils'
require 'sqlite3'
require 'nokogiri'

task :docset do
  `jekyll build`
  puts "Generating docset directories..."
  generate_docset_dirs
  puts "Copying docset assets..."
  copy_plist_file
  copy_docset_markup
  puts "Generating docset database..."
  generate_database
  puts "Generating feed..."
  generate_feed
  puts "Archiving package..."
  archive_package
  puts "Cleaning up..."
  delete_package_file
end

def generate_docset_dirs
  FileUtils.mkdir_p([docset_path, images_path])
end

def copy_plist_file
  FileUtils.cp_r("#{doc_assets_path}/Info.plist", contents_path)
end

def copy_docset_markup
  FileUtils.cp_r("#{site_path}/docset/index.html", docset_path)
  FileUtils.cp_r("#{site_path}/css/docs.css", docset_path)
  FileUtils.cp_r("#{site_path}/images/logotype.svg", images_path)
  FileUtils.cp_r("#{doc_assets_path}/icon.tiff", package_path)
  `curl -s -o #{docset_path}/jquery.min.js http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js`
end

def delete_package_file
  FileUtils.rm_rf(package_path)
end

def generate_database
  database = SQLite3::Database.new database_file
  database.execute("CREATE TABLE searchIndex(id INTEGER PRIMARY KEY, name TEXT, type TEXT, path TEXT)")

  parse_elements.each_with_index do |element, index|
    name = element.css('h2').text.sub(%r((?i)view source), '').strip
    type = element['data-type'].capitalize
    path = "docset/index.html##{element['id']}"
    database.execute("INSERT INTO searchIndex (id, name, type, path) VALUES (?, ?, ?, ?)", [index+1, name, type, path])
  end
end

def generate_feed
  feed = Nokogiri::XML::Builder.new do |xml|
    xml.entry {
      xml.version Neat::VERSION
      xml.url "http://neat.bourbon.io/docset/neat.tgz"
    }
  end

  File.open("#{root_path}/docset/Neat.xml", 'w') do |file|
    file << (feed.to_xml :save_with => 3) # Removes XML header
  end
end

def archive_package
  `cd #{root_path}/docset && tar --exclude='.DS_Store' -czf neat.tgz Neat.docset`
end

private

def root_path
  File.dirname(File.dirname(File.dirname(__FILE__)))
end

def package_path
  File.join(root_path, 'docset', 'Neat.docset')
end

def contents_path
  File.join(package_path, 'Contents')
end

def resources_path
  File.join(contents_path, 'Resources')
end

def documents_path
  File.join(resources_path, 'Documents')
end

def doc_assets_path
  File.join(root_path, 'gh-docs')
end

def site_path
  File.join(root_path, 'public')
end

def docset_path
  @docset_path ||= Pathname.new("#{documents_path}/docset")
end

def images_path
  @images_path ||= Pathname.new("#{documents_path}/images")
end

def docset_generated?
  File.exists?(docset_path)
end

def database_file
  File.join(resources_path, 'docSet.dsidx')
end

def parse_elements
  page = Nokogiri::HTML(open("#{docset_path}/index.html"))
  @elements = page.css('[data-type]')
end
