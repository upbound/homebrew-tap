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
  version 'v0.37.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.37.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '8c9574497f7a22ccfbf84d0c390e9aab7283c0566de249d356e0d4de24880bee'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.37.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '5ae342ec4d62fd88a4c1edeeab51f17f89a903382a7bd4fab48d8316a24562af'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.37.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '124f314d42858d87a469e7bef2b8e338a4904358d7ddab32bd56bf8c04d64797'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.37.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.37.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '6f9ca53c9c485642371036392054c7965ff817a283b502e6edeabc27b7869ad0'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
