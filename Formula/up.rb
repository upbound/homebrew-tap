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
  version 'v0.50.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.50.0/bundle/darwin_amd64/up.tar.gz'
    sha256 '7f940c4f78db2c145a8a5a243049268b7ec61eb4efa6e3fca4251c7742f94217'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.50.0/bundle/darwin_arm64/up.tar.gz'
    sha256 'fcf5c1453863453315a3a2fef914fa53ae58a5885e668e49f24d7fbd48066c04'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.50.0/bundle/linux_amd64/up.tar.gz'
    sha256 '3627eeef7e415f4cc34115eb6ffaf2fff2a1e697f19d410c654ee119bbac7e96'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.50.0/bundle/linux_arm64/up.tar.gz'
    sha256 '930a8279dc8958a1f13f3deaf1c4b964f22373c3b8def7c890ef189d5885ed04'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
