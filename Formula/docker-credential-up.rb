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
  version 'v0.35.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.35.2/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'eeb482f1cec1343f6b3131a0c3e76b10b62f3023f28e826bf4b3ec91d7bd8708'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.35.2/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '6b86d996fdfafb90325264330c5e5484750df9cd25e926abb591cd9cde28e72b'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.35.2/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '7b6310ddab3fcd2c39e72c0de6097953ca6ec24aea44d6a2703b0d6d820fe3f4'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.35.2/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.35.2/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'b4d30ac11e45715e8b3713c378a2149e9b466dea9ebfc8e6d431fd12f90fc07a'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
