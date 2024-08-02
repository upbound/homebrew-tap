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
  version 'v0.32.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.32.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'c0da1bd0cab2f53794385582aa1b7ce1d0c74e936abdd2ddef868be0d70832e4'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.32.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '9e57c7382a55993fbc4ac3a0369d832e997567a99c03e47899debbb94a8b799c'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.32.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '71b34281039b47efebfe9333deb014fb7c8caf73efa0837da86a3ff8d99b8559'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.32.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '7e9672cb80718353889831968ffe1375aad9798767b57fb12eb623a8c4ad0901'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.32.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'ce9a303273f55bbb4637d415c3d417ac419f8aaf9fb78f41a62a67ffbabb7fc3'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
