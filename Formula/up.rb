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
  version 'v0.55.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.55.1/bundle/darwin_amd64/up.tar.gz'
    sha256 '848b6d1533aaca9dc97713bb04ee647b1b0a9f957f7cc77769192b8366371ac2'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.55.1/bundle/darwin_arm64/up.tar.gz'
    sha256 '7e86e60453c64ea6adc182bdaff01390c39a85b11496643dac73f56005aa4aa1'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.55.1/bundle/linux_amd64/up.tar.gz'
    sha256 '058a4b54e340289dd9f754471608cb976c4b9abbafb261ad6dd01a36f92169f0'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.55.1/bundle/linux_arm64/up.tar.gz'
    sha256 'db0b0392bd99aa3e304c006de3f628762c47902416755e3d617903d4898efa64'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
