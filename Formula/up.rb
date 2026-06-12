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
  version 'v0.49.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.49.0/bundle/darwin_amd64/up.tar.gz'
    sha256 'e8869f3e02fa17542b1532570b1a0b8959478a9aa334b9687e0ff6ba24b32faa'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.49.0/bundle/darwin_arm64/up.tar.gz'
    sha256 'be0cd05838bba631789e5e02d6d5b3f854a695c8460b680fc2eebe3a00b19bcf'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.49.0/bundle/linux_amd64/up.tar.gz'
    sha256 '98ad31206de1f41465d7fe63a975be19632add190325c38778e2de13a817961a'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.49.0/bundle/linux_arm64/up.tar.gz'
    sha256 '3d5f300aec80dfe2b83139c53520ebee42b6cbace4d487b31296b8919266bda4'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
