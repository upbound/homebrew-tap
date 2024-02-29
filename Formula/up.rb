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
  version 'v0.24.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.24.2/bundle/up/darwin_amd64.tar.gz'
    sha256 '4a69f296a3ced2cca28cb4a5bd71f69fecfcebdd2646fecc656e2e90ed30a555'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.24.2/bundle/up/darwin_arm64.tar.gz'
    sha256 '14207ae905d59ac148cad4348c07ecaf95ec9b178b01a7cbbdfa83c709f22a02'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.24.2/bundle/up/linux_amd64.tar.gz'
    sha256 '34fd4b8cb77480967c4db53b96b6695eff906ab33f345811fba85689ebfbc325'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.24.2/bundle/up/linux_arm.tar.gz'
    sha256 'ae521eba14eb0ff4a542e37948ae3fbbc5d386c3a6e0a241479a10d6d2bcf63d'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.24.2/bundle/up/linux_arm64.tar.gz'
    sha256 'c92e692977d4c4bd3888268d99bbc201213d1658e9ae279921c02ca9578fd63c'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
