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
  version 'v0.24.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.24.1/bundle/up/darwin_amd64.tar.gz'
    sha256 '024f15c057d219c8184929f19795f4309af6321644199ee4b85fb093ca148830'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.24.1/bundle/up/darwin_arm64.tar.gz'
    sha256 '333ef9eff9dd69531c0d10d1ffe7cdca258fd3745553cfc7771744c173d4e36e'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.24.1/bundle/up/linux_amd64.tar.gz'
    sha256 'eb68150c63cf3f91562abd7d8ee708829c4f1b1894ef743587b65a91580df499'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.24.1/bundle/up/linux_arm.tar.gz'
    sha256 'e217f573ae437244ef5c226547f0f6755257289bd17a0d2ae648d9829ae12881'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.24.1/bundle/up/linux_arm64.tar.gz'
    sha256 '330658777e111e44bffb5aa43434770427c72af82a0efbe6460fe2e564630e75'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
