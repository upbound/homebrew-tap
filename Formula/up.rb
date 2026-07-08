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
  version 'v0.49.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.49.1/bundle/darwin_amd64/up.tar.gz'
    sha256 'eb14ff917be8d7a0741b048df66f77f80ce047bb38cd2bbc1e1d4e26f91bb38c'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.49.1/bundle/darwin_arm64/up.tar.gz'
    sha256 'c70795ab88a609ed76df25484445254ded6ba24dd07a0ed76a4fd37716978800'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.49.1/bundle/linux_amd64/up.tar.gz'
    sha256 'ace7db355ac2f7b8bfa33915de2403495d6b78b020640b6bf369ebd69ce9075e'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.49.1/bundle/linux_arm64/up.tar.gz'
    sha256 '06f32fae613307733541b5bfa4db48d7bebb84bf5fcd906432ca95bef88a2569'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
