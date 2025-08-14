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
  version 'v0.40.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.40.1/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'cf8ebd33642c34f5e1112d3ab4f254ac756f829d94a2604b05e58a32e8d7f802'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.40.1/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '20317c56c5eec77d323d17fab67d19573523616387f0cf51c64b8225e89023db'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.40.1/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '1001d8518516c1739622e642427be9d6abaeddcd82b1a3bd9d672a069346322d'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.40.1/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.40.1/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'db935221775b5dae916220207d1a3d18800fefdbaf6ca328a50b0efa715c0cb4'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
