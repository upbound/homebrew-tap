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
  version 'v0.44.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.44.0/bundle/darwin_amd64/up.tar.gz'
    sha256 '5266de195496dab8078131732e6dec7d93d8c30487a1363e3cb60dd0ac3628ee'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.44.0/bundle/darwin_arm64/up.tar.gz'
    sha256 '45ef2563d5c1bfcc4c67618392d53e981c8068dfa3cf8f279e1b070b3620f918'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.44.0/bundle/linux_amd64/up.tar.gz'
    sha256 'd0ca1107cfc35fb29c96e13874a96da072f8834b730c3e4839d25f3fb332a9e0'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.44.0/bundle/linux_arm64/up.tar.gz'
    sha256 'f8f357b58dc7d53e6b103c4ffa71aedd4a350192370ffd0b93704deaf112b62d'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
