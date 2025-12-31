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
  version 'v0.44.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.44.1/bundle/darwin_amd64/up.tar.gz'
    sha256 '7f96eb753d672a78146e01f087fc28cf0753dfd27ea356f07e2c7abc0d10d29e'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.44.1/bundle/darwin_arm64/up.tar.gz'
    sha256 '912c2e6fa7527d4edd4e82b8091bb6c4e76438db9a9bf6bf067b32d9a5c7795d'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.44.1/bundle/linux_amd64/up.tar.gz'
    sha256 '79baf2ef83090ed98ecb1a05952304e5c2cf08933a8f99bc5e291334c471315f'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.44.1/bundle/linux_arm64/up.tar.gz'
    sha256 '644d5a040d268aef703c55d167e62e03ed918ea2565926eac3d041649076b524'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
