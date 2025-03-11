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
  version 'v0.38.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.38.1/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '4546de7dc880d6dec33bce0cd1fce4ac32cb750960b8f347a56ba3581d8ed656'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.38.1/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 'fca1c5b433c8654a7d2243bab5bef13b1d416e0091110a34c4d803ee360c7df9'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.38.1/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '8fb1b9ca2f874bf3b7eac3033c7689dd05676eab435c3114f4952f11c9b7b3e8'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.38.1/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.38.1/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'd8d47d28c753491b12e12b5cd665df2f4ae9fc85d568005b9e4d217d3ab4fd9f'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
