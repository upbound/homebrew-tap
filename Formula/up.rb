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
  version 'v0.17.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.17.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '1f97c0222f1a5886609cf94024aeedf5322f0f7562edb59fdad1b10239ff27d8'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.17.0/bundle/up/darwin_arm64.tar.gz'
    sha256 '62ae42e09165408905f952e7fa31c18ad9469b586caa2df87bb09eee801ff4ad'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.17.0/bundle/up/linux_amd64.tar.gz'
    sha256 'fadf5c0b2f94e2e18c487ac369aa917506e9bdcaaa6ec775179a0a323ab71e3a'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.17.0/bundle/up/linux_arm.tar.gz'
    sha256 '0e6e175185e9e12a07a77f79aa617d0a91447b90cbafcab04ce8820800e81746'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.17.0/bundle/up/linux_arm64.tar.gz'
    sha256 '4a9fba4c103ac44bb19978ae84574cae157f962700b28191f8f3b1782afbf6bd'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
