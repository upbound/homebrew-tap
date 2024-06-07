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
  version 'v0.31.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.31.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '780e89c2bd835d2b3b4a42be506469bd53a0acf44bfff37a4a97a9136fccf6cc'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.31.0/bundle/up/darwin_arm64.tar.gz'
    sha256 '83d898b51686ffafa138b68f9e32d2d85e6909d017d7502f499222b9b144ebed'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.31.0/bundle/up/linux_amd64.tar.gz'
    sha256 '4497b00cc1b551cac7296984512b9a6c13abc9d4b60270809adbd8cfa6746208'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.31.0/bundle/up/linux_arm.tar.gz'
    sha256 'a94d6241a50b487fc8b51c5ed9114617c2144a5fc982e89e5e42826a8dcff972'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.31.0/bundle/up/linux_arm64.tar.gz'
    sha256 '1e0fcd703d0f4a824c4d289297ef408afe6d0ba46978303e6c06b676a8fb8dc6'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
