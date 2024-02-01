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
  version 'v0.23.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.23.0/bundle/up/darwin_amd64.tar.gz'
    sha256 'd81416612c845d093a864c327624add50dc4e6a0af02bc61169c557f866be132'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.23.0/bundle/up/darwin_arm64.tar.gz'
    sha256 '78cadd198ebdfea86d8d41ac02c63ba45cbc24e6fb8bd673fdfbfce6c092ec9f'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.23.0/bundle/up/linux_amd64.tar.gz'
    sha256 'fb1b2de78dc688bed280e20e808ba62c76de0cdac29d540bc74c763942801ec7'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.23.0/bundle/up/linux_arm.tar.gz'
    sha256 '2486ae0e7b82d7de8a16773e3e43596c6c8da6b6e9cbad9c47ffefbb481c3995'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.23.0/bundle/up/linux_arm64.tar.gz'
    sha256 '65f4168bf920a28797685de6df3600eeb89eedad6d5fa9551c5f0074e2ce6a0b'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
