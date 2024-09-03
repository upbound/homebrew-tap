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
  version 'v0.33.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.33.0/bundle/up/darwin_amd64.tar.gz'
    sha256 'a985d31c35391de39e44b0f3dc3361eba38d916b13d0f05054d99b278a8f5931'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.33.0/bundle/up/darwin_arm64.tar.gz'
    sha256 '95f291b5e6d993eb6904b518995c4326ca60efd12df9dd7374ffe65392837ded'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.33.0/bundle/up/linux_amd64.tar.gz'
    sha256 'd187a62b28cfd3c1de6bceee057aa6402eba86c80de4faa476944737b8e595d1'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.33.0/bundle/up/linux_arm.tar.gz'
    sha256 '6773f4bf3878ff5b950a297328aefdd8bf99b7b85b4bb3edd380704233e11d70'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.33.0/bundle/up/linux_arm64.tar.gz'
    sha256 'f8f5aee70eb1dfc78d6a3bd12b058135b285b96617edcd80ee5a800381658464'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
