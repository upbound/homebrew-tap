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
  version 'v0.13.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.13.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '19837ded578b121a58b89c33fec0e66cf4a82cd7b464f6d0941060397e1bf26d'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.13.0/bundle/up/darwin_arm64.tar.gz'
    sha256 'fddcfd2b29cb300c4e1883bc45ae5819f868190af8a4ec6bf828fe49f190060d'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.13.0/bundle/up/linux_amd64.tar.gz'
    sha256 'fa9817753a131f6b9f8c3be77c0c6f5b35e01925052b68ea32e64c88f0399db2'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.13.0/bundle/up/linux_arm.tar.gz'
    sha256 '9e8bc45bccfebb19f180e652b831280a36fbaa8403ea3320f4ddd02f4f59695e'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.13.0/bundle/up/linux_arm64.tar.gz'
    sha256 'ae8181730dffd95058666640975e0ee2621b82c04e4932ca2e371255b04f28b2'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
