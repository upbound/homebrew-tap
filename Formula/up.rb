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

class Up < Formula
  desc 'The official Upbound CLI'
  homepage 'https://upbound.io'
  version 'v0.47.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.47.0/bundle/darwin_amd64/up.tar.gz'
    sha256 '0db40ebe9fdb003b4dad65cdec15136a9480a3ca6ce08b653b4be75c58001bbd'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.47.0/bundle/darwin_arm64/up.tar.gz'
    sha256 '7c24b58a10e837bfb9a94c3f4b6a899e0f4cc22d1d030996f23a4ccb9592ce7d'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.47.0/bundle/linux_amd64/up.tar.gz'
    sha256 '77b4f1c62c2f992d9d251ef6652d7d71aeadb381a770e8216c9f552ea46d6d42'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.47.0/bundle/linux_arm64/up.tar.gz'
    sha256 'd2be61a890c125e09e723f18970801681e9d6de1b0324a0018a6a136a9d8c1a0'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
