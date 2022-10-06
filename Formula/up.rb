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
  version 'v0.14.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.14.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '628d0a74d129a5832de089027cb7ab8bd28c7ad5a08f5f2b73cdf5205ed490f2'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.14.0/bundle/up/darwin_arm64.tar.gz'
    sha256 '5fad8d569244b219a84340a245fe52a0e0ce3e47e574c9b1ea0e016ccd91e006'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.14.0/bundle/up/linux_amd64.tar.gz'
    sha256 'fa9817753a131f6b9f8c3be77c0c6f5b35e01925052b68ea32e64c88f0399db2'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.14.0/bundle/up/linux_arm.tar.gz'
    sha256 'ee090b2f8b9449af5ce1631db65f80ea10af3a2e6b40e433ef623494120634cd'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.14.0/bundle/up/linux_arm64.tar.gz'
    sha256 '8f284b065d21a442684ae3fbcee51b2df8e69b01659ac98dd771d42b9d65fc94'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
