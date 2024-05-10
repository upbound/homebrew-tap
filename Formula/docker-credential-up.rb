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
  version 'v0.30.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.30.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '51643a409e959be1a7ae83373987886a957fc9434426c72892b3722bc81dff9c'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.30.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '12ce95ffd15fce37d49adb287210dc43b700cf2261752df557eb74684a8a5848'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.30.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '1c4277465a5bc4c2ce7231f04ba5c7fe20febd2865b9381bc90a54a7f85dd541'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.30.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '34a1f61d45217d76d6f0b9be268b62d668ab8970ce791f0d2c61dca3c6ada2af'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.30.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'b8244f3e94ca5b6d9b977d1ab6b05415f704093ec00e6538b0f48969fa35b766'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
