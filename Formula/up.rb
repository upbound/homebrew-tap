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
  version 'v0.36.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.36.1/bundle/up/darwin_amd64.tar.gz'
    sha256 '6b842c5e57e69858516310b4c99ef25481e63fc55482081f39949e9cc5c694a0'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.36.1/bundle/up/darwin_arm64.tar.gz'
    sha256 '3cf1e50036c8890fc2005ef8ea5ba5bee1e3c30a35579eb72bd1da7ffec88c42'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.36.1/bundle/up/linux_amd64.tar.gz'
    sha256 'a19d51a4f6402b30a145629485470a3d15e1aa67f71415efa4508808cb1687ec'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.36.1/bundle/up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.36.1/bundle/up/linux_arm64.tar.gz'
    sha256 '9b1b8385d3b49d9928cccb0a88a7033c1b1c82b634a520a124fe53509cfbdbd1'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
