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
  version 'v0.52.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.52.0/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '941a5547b57be09c52d26ada71dd12d788a96a1e23dec2da546dedec88ee171b'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.52.0/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '70ec67f0941938852fc1a232e3e9c8496a67444ad0bbe6c5e6714e35c2a2bd0e'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.52.0/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 '7a42bf42be39f30b06a2cb80ee0a271c8f4cac6a53c341c0ef9f7233a2be750e'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.52.0/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '372a0af4f4ca2866b60e0a43348888484e49ca3164cccdb35621e44c8df56594'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
