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
  version 'v0.43.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.43.0/bundle/darwin_amd64/up.tar.gz'
    sha256 '73c618dd2217177d54704e7bca2b58036a3df5c60bd05da661f507af50efa92a'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.43.0/bundle/darwin_arm64/up.tar.gz'
    sha256 '35290957b92e02a6c178fcb2d3580bf6c3078dcf6096d7dce9448077b24baf27'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.43.0/bundle/linux_amd64/up.tar.gz'
    sha256 '979729e8f0fdeed63c164eecad5c83ad932c2d1ef86feff0312574b84a2d6a96'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.43.0/bundle/linux_arm64/up.tar.gz'
    sha256 'a5fb17054421de401084998010931362e0cde01665949444de01a4557a1dc362'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
