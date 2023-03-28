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
  version 'v0.16.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.16.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '5429d2270c62a25fbb6fff3071b00c4c6298dbb44731ca6708f9cd9676670891'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.16.0/bundle/up/darwin_arm64.tar.gz'
    sha256 '83bcc8343582f17b9f627e585b035fe40e8512e0c29c89426fcd1fd97f4c4a25'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.16.0/bundle/up/linux_amd64.tar.gz'
    sha256 'a8eaaaa2ba5e490ea55a35466b96feb5daaaca6d7dbfddd72fb6ec289515fdd7'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.16.0/bundle/up/linux_arm.tar.gz'
    sha256 'be3558cab9f5babc42ad7d550cdd878932fcad42b579524b94be7a4abe95e71a'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.16.0/bundle/up/linux_arm64.tar.gz'
    sha256 'c05af5c0da8b629fd601981dd0e3cf9e806d70c667d50bcd15a82297f53698b6'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
