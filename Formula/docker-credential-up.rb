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
  version 'v0.38.3'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.38.3/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '188d42f49e15a91e63d6633f126f2b5ff278bcc89ab13f4a7bc200563ebd2c8e'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.38.3/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 'aebb63f720bb2fd4b6cd04eff364d5bea22facf066e8da49dd2716839e0c393e'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.38.3/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '38f6d310d9d0a016781bd08e8f83b1f0c01ec69229286097ed651a36d0abfea2'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.38.3/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.38.3/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'ae8e85d96403b179d765909b68220739190d55b975658b54c845bc653be0f5e7'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
