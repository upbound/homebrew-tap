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
  version 'v0.20.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.20.0/bundle/up/darwin_amd64.tar.gz'
    sha256 'e073ee5699f5556565d18364e108851f8dc851716c49bd5b28ab218cbfec9364'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.20.0/bundle/up/darwin_arm64.tar.gz'
    sha256 'ce271d595776c7877315888c814593a1ee6f48963aa8e2af48768cb9d334b483'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.20.0/bundle/up/linux_amd64.tar.gz'
    sha256 '3b7fc1c26a724f5c0cb8bdbfe22448a75799cb4ecaadf162dc4e605425a09fbb'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.20.0/bundle/up/linux_arm.tar.gz'
    sha256 'fb93be3e6c3ba89dc7878cc1516dba1f2ec4eccbebeba80a6a9188bda49a9ca1'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.20.0/bundle/up/linux_arm64.tar.gz'
    sha256 '0d3ac3e7c64ca34abd03c7d129bd6bae621487f192805fa544fb4b59e13862d5'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
