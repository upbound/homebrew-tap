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
  version 'v0.30.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.30.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '1bba19f54e1313d23d60944222f1388197d7264534c62e2a697e0122afe50f9e'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.30.0/bundle/up/darwin_arm64.tar.gz'
    sha256 'ea52fef7909bd13872ee16960fb65f2e566b52d3ce76e987d2f99414af42411a'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.30.0/bundle/up/linux_amd64.tar.gz'
    sha256 'c1f5dcb83c0772be337cc98a32b373cf4e422c993953eadb0e1567d7bfbf7243'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.30.0/bundle/up/linux_arm.tar.gz'
    sha256 'e95db0b139d7d16ce371d88a8983a44ed085ba863fa06acdde02d2fa716cbafe'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.30.0/bundle/up/linux_arm64.tar.gz'
    sha256 '61927aac5823a49c44ba6e406cde97563d0b5f68b6bdb432f88f973b198975f3'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
