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
  version 'v0.34.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.34.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '6c6ae8cf95a5ce55919e7d3888646f26e36db8f75ba5f980012ad1adb7b4f82a'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.34.0/bundle/up/darwin_arm64.tar.gz'
    sha256 '5b8e05a8f24f346c6aad223a0c833c08adf098ae3e10aa7e1d75842d9cef41e6'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.34.0/bundle/up/linux_amd64.tar.gz'
    sha256 '30c81573e51fe1785568f5241616e6636c6af416f976078beaf648ffe357f44a'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.34.0/bundle/up/linux_arm.tar.gz'
    sha256 'fe8ad0f98aeaa7d3b3c92a5eb4de8d67ebb1a264da4bca3ca31861626891d20b'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.34.0/bundle/up/linux_arm64.tar.gz'
    sha256 '2b76276650d7dfbb0c9af599e270bfdb7e318f02faafa7895cf4c9803fcc5fad'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
