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
  version 'v0.48.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.48.0/bundle/darwin_amd64/up.tar.gz'
    sha256 '09a981b428a7b946a3b9ae46ecfb7eaa09ebba8d4e31b8d963b434c3c08d867f'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.48.0/bundle/darwin_arm64/up.tar.gz'
    sha256 'fd3d34a30b8d2bf60d096353ca2f9cc6d7ccd064a9d01a72ad28645d4b0beb1c'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.48.0/bundle/linux_amd64/up.tar.gz'
    sha256 '760235b90cd7da4d385fe5da1101a4bf943a05ea2bf2ab78f6e3d2e28abe124e'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.48.0/bundle/linux_arm64/up.tar.gz'
    sha256 'd4e08d6ed8760b25d22a1fc238a423914ae6cacfae500d18cbbd396239bb656e'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
