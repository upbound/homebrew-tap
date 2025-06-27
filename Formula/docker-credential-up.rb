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
  version 'v0.39.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.39.1/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'ae04e9dcd3e2e1a7a245d21b21e5c06246f71ea0f79449035fc661705953119d'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.39.1/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '89fcdce687f68696468dbc3091fe2248280ebf970ca17331388663a9fc48c080'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.39.1/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '983fd37e014a6c10b639c645e4e677bdef25f641cd44e9dbd63ab95d49af67bc'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.39.1/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.39.1/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '426b6b9380c832c522232d8bea85910b5d57bebe93957baa3b1a64877e8b5e86'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
