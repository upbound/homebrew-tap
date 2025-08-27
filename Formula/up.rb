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
  version 'v0.40.3'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.40.3/bundle/up/darwin_amd64.tar.gz'
    sha256 '92dda9bc02520caf7506b1c3db51cf5f5f979e479068f7d73e9af41b093afbc3'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.40.3/bundle/up/darwin_arm64.tar.gz'
    sha256 'f60c187a398de66bb6b586073a2682fd1ff7f08764b1928fdfa0545de73f2bd5'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.40.3/bundle/up/linux_amd64.tar.gz'
    sha256 'd7b0b62206dafdaa4a238893bbc848ce5708ecf917000c0cfdeaa805eb96729c'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.40.3/bundle/up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.40.3/bundle/up/linux_arm64.tar.gz'
    sha256 '5e21ad3ab5847c5f0242fb2bbadca23f65d719a01fb74582d36b2a8974ce06ab'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
