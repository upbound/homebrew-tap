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
  version 'v0.48.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.48.1/bundle/darwin_amd64/up.tar.gz'
    sha256 'ced45a040b8f77029430891f3161c294ff1deba94a0d7ce07148ae58b77f720f'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.48.1/bundle/darwin_arm64/up.tar.gz'
    sha256 '8d5f66333b4484d487a74ea360bb6abc251dd7fb65d2cc74d4d253cbaf7704ba'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.48.1/bundle/linux_amd64/up.tar.gz'
    sha256 '6da1ad4420041de8a3cf24bd0e86dc9ec75d77a72f021e8cbdb3d80a740811f7'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.48.1/bundle/linux_arm64/up.tar.gz'
    sha256 '40e02aaa62da1dc59220dc4064b50cfd1cb837922ff30e89f759f5cc62e7e835'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
