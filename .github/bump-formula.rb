#!/usr/bin/env ruby
# frozen_string_literal: true

ARCHS = %w[darwin_amd64 darwin_arm64 linux_amd64 linux_arm linux_arm64].freeze

OLD_VERSION = ARGV[0]
NEW_VERSION = ARGV[1]
REPO_ROOT = ENV['GITHUB_WORKSPACE']

Dir.entries("#{REPO_ROOT}/Formula/").each do |file|
  next unless file.end_with?('.rb')

  puts "Processing #{file}"

  refs = {}

  ARCHS.each do |arch|
    formula = file.chomp('.rb')

    url = "https://cli.upbound.io/stable/#{OLD_VERSION}/bundle/#{formula}/#{arch}.tar.gz"
    old_sha256 = `curl -sSL #{url} | sha256sum | cut -d' ' -f1`.strip

    url = "https://cli.upbound.io/stable/#{NEW_VERSION}/bundle/#{formula}/#{arch}.tar.gz"
    new_sha256 = `curl -sSL #{url} | sha256sum | cut -d' ' -f1`.strip

    refs[arch] = {
      old_sha256: old_sha256,
      new_sha256: new_sha256
    }
  end

  text = File.read("#{REPO_ROOT}/Formula/" + file)
  text.gsub!(OLD_VERSION, NEW_VERSION)
  ARCHS.each do |arch|
    text.gsub!(refs[arch][:old_sha256], refs[arch][:new_sha256])
  end

  File.open("#{REPO_ROOT}/Formula/" + file, 'w') do |f|
    f.write(text)
  end
end
