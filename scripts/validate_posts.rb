#!/usr/bin/env ruby
# frozen_string_literal: true

require "date"
require "yaml"

errors = []
post_files = Dir.glob("_posts/**/*.md").sort

if post_files.empty?
  puts "No posts found under _posts/."
  exit 0
end

post_files.each do |file|
  basename = File.basename(file)
  content = File.read(file)
  front_matter_match = content.match(/\A---\s*\n(.*?)\n---\s*\n/m)

  unless front_matter_match
    errors << "#{file}: missing or malformed YAML front matter"
    next
  end

  data = begin
    YAML.safe_load(front_matter_match[1], permitted_classes: [Date, Time], aliases: true) || {}
  rescue Psych::SyntaxError => e
    errors << "#{file}: invalid YAML front matter (#{e.message})"
    next
  end

  %w[layout title date].each do |key|
    value = data[key]
    if value.nil? || value.to_s.strip.empty?
      errors << "#{file}: missing required front matter key '#{key}'"
    end
  end

  if data["layout"] && data["layout"].to_s != "post"
    errors << "#{file}: layout should be 'post'"
  end

  begin
    front_matter_date = Date.parse(data["date"].to_s)
    filename_date = Date.parse(basename[0, 10])
    if front_matter_date != filename_date
      errors << "#{file}: filename date #{filename_date} does not match front matter date #{front_matter_date}"
    end
  rescue Date::Error
    errors << "#{file}: invalid date in filename or front matter"
  end
end

if errors.empty?
  puts "Post front matter validation passed for #{post_files.length} files."
  exit 0
end

puts "Post front matter validation failed:"
errors.each { |err| puts "- #{err}" }
exit 1
