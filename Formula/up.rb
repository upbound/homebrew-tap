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
  version 'v0.56.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.56.0/bundle/darwin_amd64/up.tar.gz'
    sha256 '45b5282ecab308fec5851630cac4b5d259be8a3f6cd4705f633e02579c257a91'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.56.0/bundle/darwin_arm64/up.tar.gz'
    sha256 '386bd0be87f854dc98cc3871fb7ea58e39972cd5ec5456fc147640a8b2b0c2e8'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.56.0/bundle/linux_amd64/up.tar.gz'
    sha256 '933962be3af2793dd1145bfe5101dd75e25271136ac916544d1af39993d160af'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.56.0/bundle/linux_arm64/up.tar.gz'
    sha256 '2545453ac30370e6bb9b8c7436b3218772b1967b8f3632159db528d456a1883e'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
