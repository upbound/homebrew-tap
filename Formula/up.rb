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
  version 'v0.18.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.18.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '859802d4b92f6acb35be31edc171d7ba11493f17f871094039e5ee6c53e6eb11'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.18.0/bundle/up/darwin_arm64.tar.gz'
    sha256 '7bbb8046b39aee664a3d3e8a45289d62c7b1b4ee2b45547c3b31cf8a637773df'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.18.0/bundle/up/linux_amd64.tar.gz'
    sha256 'f85270c7e584217da7545ee294aa428cd2c54ebb84c5590f2a2d321c0b81c556'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.18.0/bundle/up/linux_arm.tar.gz'
    sha256 'a186e2ed627faca6c9da57e2bc212afc423ef8f0ec3c40341c20ab02f55712d4'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.18.0/bundle/up/linux_arm64.tar.gz'
    sha256 'c022f77ce0b88875a9028fe9009512baa43513508f874c7e6fb9a5dede4615b0'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
