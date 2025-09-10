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
  version 'v0.41.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.41.0/bundle/darwin_amd64/up.tar.gz'
    sha256 '92a82dae1c551933a8f16ae983ecc5d5b9e80273e47f6e614d3692a392151113'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.41.0/bundle/darwin_arm64/up.tar.gz'
    sha256 '8c082a70384f4707316057fc9b6cf67b38cd710164beb63d0afdaa7cc0702faa'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.41.0/bundle/linux_amd64/up.tar.gz'
    sha256 'b07f90e422eb9fa54dee8bd151f2f3f19ee8398daa8219c3f9ec57a875ebcc5a'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.41.0/bundle/linux_arm64/up.tar.gz'
    sha256 '647f236896f1cb7fcd13679ae5bcfac50e359ee8876a49459caf3a1a6961dc84'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
