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
  version 'v0.33.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.33.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '94d1911f25e1fcfca634456badd5e4b3ebbcf3948469f360ca42f803c753d1cb'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.33.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 'ec1967747ba3e17c91a5fd3d7a8b4622c7cbfe95b6853a6834f2c6fcc635af9f'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.33.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '1c8462687c93f11e0d8c948b0b7c7a146eb186df9f56541c18a1fda941e02efe'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.33.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '2e3ac5d11fe790f772f7d899d2c8150ca9d4e76acae4826508c868d34410e5a8'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.33.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '6e34d73d2dba79f5a4bd88224713f804c5314f9b7ddef0ceda8d4ec380409c6e'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
