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
  version 'v0.16.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.16.1/bundle/up/darwin_amd64.tar.gz'
    sha256 'adcee10ec87297c414906f27ceaf7e4af8bf49e50e4dd0e222b544f65e115f80'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.16.1/bundle/up/darwin_arm64.tar.gz'
    sha256 'ecc1aa5b8ffbe9a0e8552f48887927e420c78b6e8019019625e644dd42c1b4d6'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.16.1/bundle/up/linux_amd64.tar.gz'
    sha256 '724ed8d2d8b81aea688763cc001682b4fbca82eae4885219600ef7c4993326d0'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.16.1/bundle/up/linux_arm.tar.gz'
    sha256 '8a7d330922060cc46bd8e732ae3353c912bed0d224ec7f48be228428623981a0'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.16.1/bundle/up/linux_arm64.tar.gz'
    sha256 '07638ea2e3d6570c4a7bd64f6f042fdb25007e47dc5c2951f622703b1a7de10b'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
