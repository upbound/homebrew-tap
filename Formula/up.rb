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
  version 'v0.54.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.54.0/bundle/darwin_amd64/up.tar.gz'
    sha256 'b0f6ac14a274a8f82270def9eca6459c0bb49ff9867192e321df239685c55a91'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.54.0/bundle/darwin_arm64/up.tar.gz'
    sha256 '3e720192999e2128dc823f96a9ee99e1fb72342985eb74a94a9c08adf9a31c9a'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.54.0/bundle/linux_amd64/up.tar.gz'
    sha256 '7842f19dfa0e816b783b3b441d3932ab720e49ed2fc9bae2ded97f59e5e012f2'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.54.0/bundle/linux_arm64/up.tar.gz'
    sha256 '017b3f2ac0cf9b2c7244572f56ddcf384536514f5e1f3e4a9b05ccc46eaa78c1'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
