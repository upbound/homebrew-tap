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
  version 'v0.44.3'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.44.3/bundle/darwin_amd64/up.tar.gz'
    sha256 '46407999a22d1f53ee5100c0d74bf39a7976227dc2c55987369efcd10ea1a19a'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.44.3/bundle/darwin_arm64/up.tar.gz'
    sha256 '84c53f330f206560640e4d2de61a1616c9ddafa35bc797b2f8461fe7fc988734'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.44.3/bundle/linux_amd64/up.tar.gz'
    sha256 '58141be503913c8e5423a3bc41a14fbb4e938bcb38fb0e06fd899a91fcfa15f5'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.44.3/bundle/linux_arm64/up.tar.gz'
    sha256 '012d3401f4aac38ceea98d8426814db379c5da142cdc5be0dd4bc558b002f64e'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
