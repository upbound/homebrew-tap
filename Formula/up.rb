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
  version 'v0.42.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.42.1/bundle/darwin_amd64/up.tar.gz'
    sha256 '0c8b4ead5e5c0f9db74fd4138a11bb89ea1e82dee46e612446655403bc798928'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.42.1/bundle/darwin_arm64/up.tar.gz'
    sha256 '5d82de8ca613c2447439c607469bfa275839b53bf723fcfa481d77cdb8bb72a0'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.42.1/bundle/linux_amd64/up.tar.gz'
    sha256 'c71265348567bad1d6fd88e95f0c7e292160d41cb028104ebe9b9c04c1ff7c15'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.42.1/bundle/linux_arm64/up.tar.gz'
    sha256 '3a9ef66a1050878ebcd468120409203ae297defa0bd2249c7b6394f295e75ee3'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
