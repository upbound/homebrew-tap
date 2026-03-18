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
  version 'v0.46.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.46.0/bundle/darwin_amd64/up.tar.gz'
    sha256 'a8b95b109f60ebd3ce971186843cebd8e6bcbd36748586523fa1eb57f3f878a5'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.46.0/bundle/darwin_arm64/up.tar.gz'
    sha256 'a648e8cc10bc9b0676af000e73802ef29d678d0b67c1ee6aa26a4dc8e780a446'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.46.0/bundle/linux_amd64/up.tar.gz'
    sha256 'eada354dcc96328d4da609dc2a94b2e657b14e4147bf86ef0d00225c7a62fea7'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.46.0/bundle/linux_arm64/up.tar.gz'
    sha256 '7b1b87298462522a9dd2ac28ff4f07396db6c7a77b720627186a82405d16b068'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
