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
  version 'v0.55.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.55.2/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '8c6f1dfc530058165fe5854f1ca7f401f035126c57a5012755bcbcc9422ed82f'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.55.2/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 'ae7a5da6cdb6f85975a39f95ef53fcb6edc4dcc714002a3511e95a007cd794f6'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.55.2/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 '72b1bb6256022090802d108d593b53cd4492826476d72bde89f6adab31561301'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.55.2/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '7eeb34639978f0764c0247863257dd51e43d4f1e36e891e153a89ea80ef0c973'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
