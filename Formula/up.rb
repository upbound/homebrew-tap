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
  version 'v0.38.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.38.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '9f706722b998d11f390ba1f69d63dd27fa273a26d4eb6b25964d700ece5173eb'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.38.0/bundle/up/darwin_arm64.tar.gz'
    sha256 '92cc7e7470f00fc814c5e79ff77587cb7bcfb68425450f11e8eae889857250c6'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.38.0/bundle/up/linux_amd64.tar.gz'
    sha256 'e75ec877d304f2332aca4c5f26fcb8f40178b7ba3d89b9057cd7937f25e4d954'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.38.0/bundle/up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.38.0/bundle/up/linux_arm64.tar.gz'
    sha256 '543cb9132d0a5360b83aecab19dba26e3d18ba05c7d4c2da5d782aa29527961d'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
