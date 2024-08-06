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

class DockerCredentialUp < Formula
  desc 'Upbound Docker credential helper'
  homepage 'https://upbound.io'
  version 'v0.32.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.32.1/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'e653c042df5ffa84c6c53b2a8c6e8ca7238032f39e7ba3027ac544415f859de9'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.32.1/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 'ac91fc9636be19c418dcd594c4bae15efb58e51bf09edf220aafc9dd4ccdb6e4'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.32.1/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '0f11112f5de9d5b165e25cc4d2e538d38eccf8765724c2c9e5035e26a2800ac9'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.32.1/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 'd90ccd9adf5d458b43fe420f3f3b147713f3b3e124037f6b7d5cab8ce2fdd82e'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.32.1/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'ea454018658fdc4c2312899b563056c7e618d7109290ded467265f5316578ee8'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
