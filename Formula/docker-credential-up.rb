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
  version 'v0.34.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.34.1/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '42bd70cfee4603f5e811cbb0ac2c2d9595d259f124875cdf6e55cc95b4724063'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.34.1/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '2aa1575536ab2d55988ccd3d18151541913b3d0968635c5a3ba6d4ca98a0e3ca'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.34.1/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '7a88c39a84454e16ec05023c1d29fb7972bdf80f90f7764590269cb76c3f7f18'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.34.1/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '8b091530770178e4bfbbf42d12ce532e55e04d253c3e39ec0e9d46c6f105768d'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.34.1/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '99be7a2ba5a206813fab8782b5a2023a3c5c7d9e1ea266219df33897e17f9aec'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
