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
  version 'v0.15.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.15.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '84ccce60cd8a819ac5eaf6d0548c1625c167f5797bd941bb2736a9a06a66bba3'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.15.0/bundle/up/darwin_arm64.tar.gz'
    sha256 '98be20f2b94db2e49baa74d86e6ca3381a5af534677cf6bb49f76891c536f998'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.15.0/bundle/up/linux_amd64.tar.gz'
    sha256 'dbc6524c997f01eba6c721c7235bc63287181a354fabad6efaf62db3468a3422'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.15.0/bundle/up/linux_arm.tar.gz'
    sha256 'd60d0f7d6c3b15bf0640cd84a81841dfb8da1cbb396087c1034099aa7a755902'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.15.0/bundle/up/linux_arm64.tar.gz'
    sha256 '486c6eebd0c456886acd42b7a87e428c390a4e388bfa4606674140bab204ccec'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
