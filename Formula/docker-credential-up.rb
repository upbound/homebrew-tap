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
  version 'v0.36.4'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.36.4/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'c838854186b77fcdb0a4fe8398624e7a3cfa0e6e2e8b4b5c3f0cae491ebf670a'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.36.4/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 'b54fe3528ab0240751ec1e38a5b5473512b72dbe283dabc450e9e4a3fe2e91ec'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.36.4/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '5abc51b3394562d34f4c13e229709c884060c1c13d874fd8da1485bceb9d7fb7'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.36.4/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.36.4/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '6ecc078fe702051f327235b2f42f3f6db9785052319076389a452e169710ebf6'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
