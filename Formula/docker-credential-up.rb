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
  version 'v0.40.3'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.40.3/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'a3b24c6c17821c0374a6a5330060c74ee2334bef5044b790b909c3414d9a08bc'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.40.3/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '46e614b4e7ab68cca0930c25c1ba9c49f84b7ca7256e1227929a4e545071c2e5'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.40.3/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '794f46b15989b506794fa62b9ebbd5ddc3593c2043dbd242a83221c8bb77ec79'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.40.3/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'aaf6453972a78f6ee1ebdfc93e1a87e70bbcea7a806bfee91d9cf34f1c124dc8'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
