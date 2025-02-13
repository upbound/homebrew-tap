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
  version 'v0.37.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.37.1/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '54d278cc823e44af36ba53744d1c2b978b696e740a2022a170a9b5adee1b2496'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.37.1/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '238a73b1cf2547bc3b445b8f8a0ee7500a0b84eae276ba1b8259c63402bffc49'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.37.1/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '2fb02bdcd86c3069dedc038227c216aca0654a5798a8a539166f4344df0364f5'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.37.1/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.37.1/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '3d524e37407360c377bc1947200201c9c7cef63bf2d4a4677a54a73d3b09ea98'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
