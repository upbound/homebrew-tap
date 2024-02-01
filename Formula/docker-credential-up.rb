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
  version 'v0.24.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.24.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '3394e092f4f9f901066742692eb9f0470994f08f68c8e62332a51c6350f17118'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.24.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '123a8e67936c0f6bdfb29245fcc7754af7dad70f0d3af1c8e6d6f11a09a5bc0c'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.24.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '08a80f457fd67ff90b551e79e53a74a5bc19ce2bf4908f0b2e880fcd7787a0fc'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.24.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 'cfa77a4b29eeefb5e33d060c68b8a613ae865fc4970c640977d1f181f7cf2c72'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.24.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '455b4cac817ca61a1a7337dec2431d0b66f372a9f9991d65cbaabd732c435e0e'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
