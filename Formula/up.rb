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

class Up < Formula
  desc 'The official Upbound CLI'
  homepage 'https://upbound.io'
  version 'v0.36.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.36.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '713e09f24ea9055e1736ac44b03551d3222a3d954c489b6eea7b499dee93b2ee'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.36.0/bundle/up/darwin_arm64.tar.gz'
    sha256 'eeefedcc1d6e7994e4924ad76c774ccbee6e6d99b15f4e77b0dbf87cd72b70fd'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.36.0/bundle/up/linux_amd64.tar.gz'
    sha256 '49efc48c8eafa96433e45f51fb75f8714367672b71339249c4be607f85cc532a'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.36.0/bundle/up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.36.0/bundle/up/linux_arm64.tar.gz'
    sha256 '218d213a338d985a98e8a54ed858fadf97c78831b373d478c3bd4b522c12fd72'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
