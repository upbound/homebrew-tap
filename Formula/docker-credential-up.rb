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
  version 'v0.36.3'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.36.3/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'cbedf7f764936cd04c0cec5e772aa5c3962893e38c65c2d596e26172a47efc2f'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.36.3/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '61426f79557bd9dfe59855ddcbade9bf2d8ff85de2a5e9b4c94bfd75be8ed6a2'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.36.3/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '5d165909a3af7cd72fb869ea7f06a34c6746be3f68ea2a0f5d9fa0d2091ae8fa'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.36.3/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.36.3/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '2b1f621ae731cde2399000911a13e233207e40269d5088d4832139b14b54fcc3'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
