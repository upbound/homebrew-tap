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
  version 'v0.21.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.21.0/bundle/up/darwin_amd64.tar.gz'
    sha256 'ba334ab29d6f4530a9e0ce079c45fb511accd5963b8772452afd29f89e6ab746'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.21.0/bundle/up/darwin_arm64.tar.gz'
    sha256 'ec69dd948e7e6f08bed583f274f620041870caffa41752e91ebe018092857ce6'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.21.0/bundle/up/linux_amd64.tar.gz'
    sha256 '4d7e0ebc4f99b6814666ba7a7673a704f5eb16b69430eeb2105ec141952da58e'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.21.0/bundle/up/linux_arm.tar.gz'
    sha256 '75113427ad4876edc9873b9b1631fa8c507b694808b1524e59136c2b6bd4d05f'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.21.0/bundle/up/linux_arm64.tar.gz'
    sha256 '5be655f66fe74c5b9b90b6706c7625d7af63ae6dd247c5d55a95ae6cdb38e9f9'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
