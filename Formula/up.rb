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
  version 'v0.34.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.34.1/bundle/up/darwin_amd64.tar.gz'
    sha256 '3f5b54dd93aedb1f395d4633957f46ab31486c0e1323030a3795a42f102cb634'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.34.1/bundle/up/darwin_arm64.tar.gz'
    sha256 'fc6f566d46a21d565ca0edb05a79872beca4cdf369a34ae4860ce49ead9b2b1d'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.34.1/bundle/up/linux_amd64.tar.gz'
    sha256 '258cd23f0931d052654fe75c7f6aabd98bc79f24a7f78d39dd343061fa3b55fd'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.34.1/bundle/up/linux_arm.tar.gz'
    sha256 '8b8d371cfadd410cf997391b676273d7227cb3f6b8d651a4b7976a5a88cab9be'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.34.1/bundle/up/linux_arm64.tar.gz'
    sha256 '433d12060a83fe128dd62ab5caf4a80aa13542d36708ef72c9a8004335324aa2'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
