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
  version 'v0.29.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.29.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '48907457ef588a78daa8163778b9435c27c8db9eca44c5c06dbfd67d1e1d8f70'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.29.0/bundle/up/darwin_arm64.tar.gz'
    sha256 '618b3577583de2a68105040857fdcdbb6c588c7a7f201089eeb35e1886c51953'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.29.0/bundle/up/linux_amd64.tar.gz'
    sha256 'd107a8a5c46a7d1c3135ccfd55de5e70ed258d1709b99b9075b1a58601d412e9'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.29.0/bundle/up/linux_arm.tar.gz'
    sha256 '20a32dfdba347c5a5a555980ab344144182a918e605fb64f8f24fc8241a832f3'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.29.0/bundle/up/linux_arm64.tar.gz'
    sha256 '0e8bbfe5152350dec4738668b2dba36b6e5000e9234445dc3b9d692765877616'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
