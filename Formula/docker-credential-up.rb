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
  version 'v0.36.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.36.2/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '6c80f9eac042e027b7c34a8b2ee6f8a9f686ce6411192afc45ec2ee0b0f032a1'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.36.2/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '3892a7757a626052b1030ab45e52eea805425bdc5058d6fb130aee39f704d9e8'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.36.2/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '75197bad3405891d57931cce7ab328093358e037863844e1876dd20f3ed7bfa5'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.36.2/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.36.2/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '961a70b8bfc890d2d7b6774f2f4fefdb9b472f9a53c26f7aaaee5236f8acb059'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
