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
  version 'v0.51.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.51.1/bundle/darwin_amd64/up.tar.gz'
    sha256 'ba72af0001409df1929e1e10179b5eaa0b965c25b8342941d3040f52ddce0922'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.51.1/bundle/darwin_arm64/up.tar.gz'
    sha256 '65266d209d91f4e36e53215f97a87306698e442804e01738be944598f35e054c'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.51.1/bundle/linux_amd64/up.tar.gz'
    sha256 'c2cdaab70401e215162c4aeb02c4872a68fc17642bd9dc9c397596d5de9a21a7'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.51.1/bundle/linux_arm64/up.tar.gz'
    sha256 '910e1a8fd22be9c5563f6ff4bb3466dd491316ef596d7c0f8ece84faf5550ba1'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
