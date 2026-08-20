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
  version 'v0.53.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.53.2/bundle/darwin_amd64/up.tar.gz'
    sha256 '0638edb000545b7e4763578706073c40f2c4b434dbafededb89ca3292c222925'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.53.2/bundle/darwin_arm64/up.tar.gz'
    sha256 '9112a1b8750a77345e931ae0bf7bf98ace4742b6d1ac5534551e654bae4d44fc'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.53.2/bundle/linux_amd64/up.tar.gz'
    sha256 '9be2853000cbf90b18086d567f3f4eac82c0fe996a98f1b1f3497b5d4aca802f'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.53.2/bundle/linux_arm64/up.tar.gz'
    sha256 'acb60ea60e2c745a253510de58291aee8cbab15812472b6a4205ac8690d08b6c'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
