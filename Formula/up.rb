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
  version 'v0.39.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.39.1/bundle/up/darwin_amd64.tar.gz'
    sha256 '97500f9192f4c9824f71f27aab33a7ff953f9a885f3c35e543e4be02948a3c95'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.39.1/bundle/up/darwin_arm64.tar.gz'
    sha256 '8e570010a24153c5bc4ae8cc4eae3e63758c0e6ec54f6198650e3bdb9c9940dd'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.39.1/bundle/up/linux_amd64.tar.gz'
    sha256 'e2ea5777b8395c3c2d33049bb2e652c0e54d9075e33620783fd4cd5c64ea7097'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.39.1/bundle/up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.39.1/bundle/up/linux_arm64.tar.gz'
    sha256 '989a14471a06e4f522ec99edb7a1edcaeb76681d453aaf6f358c6fac13501189'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
