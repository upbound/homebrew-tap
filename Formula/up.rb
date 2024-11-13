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
  version 'v0.35.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.35.2/bundle/up/darwin_amd64.tar.gz'
    sha256 'dc5515d73d8327a0ce730e41c584d44c978857c9e4dcedc051463303ff60e63d'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.35.2/bundle/up/darwin_arm64.tar.gz'
    sha256 '8f04e297d73f464c19915a2c078dedb7b7872c9a4dcbd3258fe03b30a3bfa672'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.35.2/bundle/up/linux_amd64.tar.gz'
    sha256 '32913e0fe12090576ec2a2883d4d929a63e1ec2bf5517cafe1ef639b5b7cbf2d'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.35.2/bundle/up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.35.2/bundle/up/linux_arm64.tar.gz'
    sha256 'bede073316a7b612f2f44090c0de85f8b414facd6cd7a1d32394b0e1f17fe67c'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
