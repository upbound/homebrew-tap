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
  version 'v0.26.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.26.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '6ea2b5a3d1e3201ade0f04bf796849a6100e33d1d76f946b1bd7661736cc83d6'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.26.0/bundle/up/darwin_arm64.tar.gz'
    sha256 'f44620e2d350ee03cbf131c922e6355b992a12f8cbe7f819ff37dcbc5e765637'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.26.0/bundle/up/linux_amd64.tar.gz'
    sha256 'cce1a1685aa08f945192065777c290f5a4791fc2570efc92ca3136c520f3d52d'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.26.0/bundle/up/linux_arm.tar.gz'
    sha256 'b13bac5391a9d7fd3e6ed42b2e0a9e9a1adf2700537c8a858517a937c7a7b432'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.26.0/bundle/up/linux_arm64.tar.gz'
    sha256 'd6dfd8da5386af9fc9a2f6f4ed0b67860e662a9109dbd7bbe8e8b9a7e78d6518'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
