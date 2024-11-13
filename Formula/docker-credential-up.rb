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
  version 'v0.35.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.35.1/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'caf856f8c42771d7d7508a93adf52fa690f47da437118e8d7799507a91134633'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.35.1/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '6b8d9b5dfb527137af9003f85050d1bcc0d6592cf671619815b4d47c18084f06'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.35.1/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 'd93b24cb1423711845e376f53a92d365c33296391aa4f5b27804780dbd2174a7'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.35.1/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.35.1/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '84675772e0353debc3eb81c5f3aa9ec1609aaf34ca62a5b185566ad9eb2529aa'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
