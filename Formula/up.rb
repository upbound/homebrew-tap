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
  version 'v0.22.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.22.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '7289ba11fa09f68476807af3d21dcee1f0535f0b9f2fbc90c2568dcc3dc20357'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.22.0/bundle/up/darwin_arm64.tar.gz'
    sha256 '50caa7d68bc10b4075f90cd5e41b64909c31b35825bbda08b96358721ef375fd'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.22.0/bundle/up/linux_amd64.tar.gz'
    sha256 '49fff1f5da08afd26593e81d52b24af90b865848f0896417fff4a548449ae347'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.22.0/bundle/up/linux_arm.tar.gz'
    sha256 '78d2ee502eccd05234f287eaa9e173f3f2dee0243af677145af9979d7261dc0c'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.22.0/bundle/up/linux_arm64.tar.gz'
    sha256 '328177c4c3d6e96016f10a775430ad71636ac6c177777190f72b962d2cfdf75b'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
