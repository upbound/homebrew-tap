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
  version 'v0.38.3'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.38.3/bundle/up/darwin_amd64.tar.gz'
    sha256 '241b1ad626fcdf49d7e19cbc743aa1e3e759982363adfa93018037edddc5b38d'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.38.3/bundle/up/darwin_arm64.tar.gz'
    sha256 '6eb2a77f4ecc73c26a78cde9efa7fe715f2f9eeeae993342c6f3fd83aba884c0'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.38.3/bundle/up/linux_amd64.tar.gz'
    sha256 '4de2a18b2f55f0ed3cfcb3e038bc1efe337a779300825435e73f509477c52c53'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.38.3/bundle/up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.38.3/bundle/up/linux_arm64.tar.gz'
    sha256 '2550d366404311c63cf722b8e2e1b2d6e9e24c8d924033c9e7ce3d0caf273a99'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
