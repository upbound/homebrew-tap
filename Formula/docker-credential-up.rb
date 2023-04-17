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
  version 'v0.16.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.16.1/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '3f2129bec7017ef5430576f36c4f77f72b632b0ba9e9430f746a09a366f90732'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.16.1/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 'c498f610ed17e688bf79b5a47d71e140742ca0902d6eeaea3496ef76490d837e'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.16.1/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '71a6cbefbdaa490af2c50a4b40e786c26a0baaaeabfdad29f8d9e1ebddcedd8e'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.16.1/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '69bc4200bd661397576f890a78cba46d8c4c0eebdd993068a112287b2e63c4d5'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.16.1/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'd663d37f3523d43d257c594df6e2ad878922d4a1c7fa4c55b0009084671a2337'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
