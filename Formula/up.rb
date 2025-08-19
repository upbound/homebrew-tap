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
  version 'v0.40.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.40.2/bundle/up/darwin_amd64.tar.gz'
    sha256 '549ea57e76c4ae3d500b7d91ac3f9f8eb258d2fd7adb2880732c702890ceb110'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.40.2/bundle/up/darwin_arm64.tar.gz'
    sha256 'b7e1db27a11703fe6151a12e40f62d34b5d7e0162c3a1f16d8f83794daa437a9'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.40.2/bundle/up/linux_amd64.tar.gz'
    sha256 '34f498a3cf801eda365ed07a1a3da5673b01cf13cc677c413c815a3ae7101eee'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.40.2/bundle/up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.40.2/bundle/up/linux_arm64.tar.gz'
    sha256 'c7286451dab4a92280f9881f58680d9e8745196c49aa185662f2fcb0e28761c2'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
