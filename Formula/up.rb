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
  version 'v0.55.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.55.0/bundle/darwin_amd64/up.tar.gz'
    sha256 'a54a360f0e92fab850b851e226f155d814a0e4832bb14998e3e3a0abea92e071'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.55.0/bundle/darwin_arm64/up.tar.gz'
    sha256 'b5cdb1cee8694378fe7a70db0414167b0554ac7c4b6bb9b795f53467fb4449d0'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.55.0/bundle/linux_amd64/up.tar.gz'
    sha256 '4a52d30d098164562e28c2bceb5e2cb8cb7c76ff9e633f017e2d79025c5e9b39'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.55.0/bundle/linux_arm64/up.tar.gz'
    sha256 'a9d1effef7c1ca34302404d6f54d0689280eb8c4c785c535971fdd2b08705b11'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
