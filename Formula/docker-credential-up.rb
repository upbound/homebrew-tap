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
  version 'v0.36.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.36.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'fa4c2e37af2ca1697835985b63b36bc18c120fd5401b68e64c16b27f52334146'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.36.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '1f924e91a681a38b19886513c7dfa072da7b33bcaf2ee3509a74182e18cd7aba'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.36.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '7c39429759879f0b76aa2e8176f0b7a1a0a4f5df52f2d24dfd58b51c31632864'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.36.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.36.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '925a1838f1a92536097b73d04371e75b1f06b3e5c79ae150a36cdac66a10d4ab'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
