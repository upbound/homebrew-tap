# frozen_string_literal: true

# Copyright 2022 Upbound Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class DockerCredentialUp < Formula
  desc 'Upbound Docker credential helper'
  homepage 'https://upbound.io'
  version 'v0.42.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.42.0/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 'f29a94e816d450f2a61450faa3ad4a12e4057e8c03c06ea7a1f3f6f69a299cf0'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.42.0/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '3cb66d1a67bcca9ea337d89c5ef8e837db384bc348752cf43835940f6b18b192'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.42.0/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 '6e38f77c24a3b99b20ab1f53bde05783f588b4ad1fe77d49f5c2e263807a2f1a'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.42.0/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '2aa0803d101bf2b224531bbc3183904567804da7ff1fde2d186c87fd20ac63db'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
